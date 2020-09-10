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

	/* Awaiting for HWDT IRQs */
	hal_hwdt_irqresp_state_machine_state = HAL_HWDT_IRQRESP_SM_STANDBY;

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
