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
}

/* Timer 0 overflow handler. Got called round every 2ms */
ISR(TIMER0_OVF_vect)
{
	if (0 == isEnabled)
	{
		isEnabled = 255;
		hal_heater_on();
	}
	else
	{
		isEnabled = 0;
		hal_heater_off();
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

	isEnabled = 0x00;

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
