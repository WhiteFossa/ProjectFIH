/*
 * hal.c
 *
 *  Created on: Sep 6, 2020
 *      Author: fossa
 */
#include "hal.h"


/* INT0 - HWDT Request handler */
ISR(INT0_vect)
{
	/* Initiating a pulse only if we are not in process of pulse */
	if (HAL_HWDT_IRQRESP_SM_STANDBY == hal_hwdt_irqresp_state_machine_state)
	{
		hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_PRE_PULSE;
	}
}


/* Timer 0 overflow handler. Got called round every 2ms */
ISR(TIMER0_OVF_vect)
{
	/* Hardware watchdog IRQ responce state machine */
	if (HAL_HWDT_IRQRESP_SM_PRE_PULSE == hal_hwdt_irqresp_state_machine_state)
	{
		/* Pre pulse -> pulse */
		hal_pull_hwdt_irqresp_up();
		hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_PULSE;
	}
	else if (HAL_HWDT_IRQRESP_SM_PULSE == hal_hwdt_irqresp_state_machine_state)
	{
		/* Pulse -> post pulse */
		hal_pull_hwdt_irqresp_down();
		hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_POST_PULSE;
	}
	else if (HAL_HWDT_IRQRESP_SM_POST_PULSE == hal_hwdt_irqresp_state_machine_state)
	{
		/* Post pulse -> standby */
		hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_STANDBY;
	}
}


/* ADC conversion completed */
ISR(ADC_vect)
{
	uint16_t lower_part = ADCL; /* Do not optimize, read sequence is crucial! */
	uint16_t higher_part = ADCH;

	/* 0th measurement is going to leave the window */
	hal_adc_average_value_multiplied -= (int32_t)hal_adc_averaging_window[0];

	/* Shifting through averaging window */
	for (uint8_t i = 0; i < HAL_ADC_AVERAGING_WINDOW_LENGTH - 1; i++)
	{
		hal_adc_averaging_window[i] = hal_adc_averaging_window[i + 1];
	}
	hal_adc_averaging_window[HAL_ADC_AVERAGING_WINDOW_LENGTH - 1] = (higher_part << 8) + lower_part;

	hal_adc_average_value_multiplied += hal_adc_averaging_window[HAL_ADC_AVERAGING_WINDOW_LENGTH - 1]; /* Newcomer measurement */

	hal_adc_average = (uint16_t)(hal_adc_average_value_multiplied / (int32_t)HAL_ADC_AVERAGING_WINDOW_LENGTH);

	printf("ADC average: %d\n", hal_adc_average);

	_delay_ms(100);
}

void hal_init()
{
	DDRB = HAL_PORTB_DIR;
	DDRC = HAL_PORTC_DIR;
	DDRD = HAL_PORTD_DIR;

	/* Defaults: heater on, payload off. */
	hal_heater_on();
	hal_payload_off();

	/* Setting up INT0 to falling edge. */
	MCUCR |= _BV(ISC01);
	GICR |= _BV(INT0);

	/* Setting up Timer 0 - interrupts source (~2ms) */
	TCCR0 |= _BV(CS01) | _BV(CS00); /* 64 prescaler */
	TCCR0 &= ~_BV(CS02);
	TIMSK |= _BV(TOIE0); /* Interrupts enabled */

	/* Setting up ADC */
	ADMUX |= _BV(REFS1) | _BV(REFS0); /* Vref = 2.56V */
	ADMUX &= ~(_BV(ADLAR) | _BV(MUX3) | _BV(MUX2) | _BV(MUX1) | _BV(MUX0)); /* Right-adjusted, channel 0 */

	/* Enabled, free-running, start, /128 prescaler (62.5KHz clock) */
	ADCSRA |= _BV(ADEN) | _BV(ADSC) | _BV(ADFR) | _BV(ADIE) | _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0);

	/* Awaiting for HWDT IRQs */
	hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_STANDBY;

	/* Zeroing ADC averaging window */
	for (uint8_t i = 0; i < HAL_ADC_AVERAGING_WINDOW_LENGTH; i++)
	{
		hal_adc_averaging_window[i] = 0;
	}
	hal_adc_average_value_multiplied = 0; /* And variable too */

	/* Setting-up UART */
	UBRRH = UBRRH_VALUE;
	UBRRL = UBRRL_VALUE;
	#if USE_2X
		UCSRA |= _BV(U2X);
	#else
		UCSRA &= ~_BV(U2X);
	#endif

	UCSRB |= _BV(TXEN); /* Transmit only, no IRQS */
	UCSRC |= _BV(URSEL) | _BV(UCSZ1) | _BV(UCSZ0); /* 8-bit, no parity, 1 stop */

	/* And streams over UART */
	stdout = &hal_uart_stdout;

	/* Last operation - enabling interrupts */
	sei();
}


void hal_heater_on()
{
	HAL_HEATER_OFF_PORT &= ~_BV(HAL_HEATER_OFF_PIN);
}

void hal_heater_off()
{
	HAL_HEATER_OFF_PORT |= _BV(HAL_HEATER_OFF_PIN);
}

void hal_payload_on()
{
	HAL_PAYLOAD_ON_PORT |= _BV(HAL_PAYLOAD_ON_PIN);
}

void hal_payload_off()
{
	HAL_PAYLOAD_ON_PORT &= ~_BV(HAL_PAYLOAD_ON_PIN);
}

void hal_pull_hwdt_irqresp_up()
{
	HAL_HWDT_IRQ_RESP_PORT |= _BV(HAL_HWDT_IRQ_RESP_PIN);
}

void hal_pull_hwdt_irqresp_down()
{
	HAL_HWDT_IRQ_RESP_PORT &= ~_BV(HAL_HWDT_IRQ_RESP_PIN);
}

/**
 * Private stuff goes below
 */
int hal_uart_putchar(char c, FILE *stream)
{
	if ('\n' == c)
	{
	    hal_uart_putchar('\r', stream);
	}

	loop_until_bit_is_set(UCSRA, UDRE);
	UDR = c;
	return 0;
}


