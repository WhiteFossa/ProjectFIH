/*
 * main.c
 *
 *  Created on: Sep 6, 2020
 *      Author: fossa
 */

#include "main.h"

/**
 * Entry point
 */
void main()
{
	/* Initialize hardware */
	hal_init();

	while(1)
	{
		hal_heater_on();
		_delay_ms(500);
		hal_heater_off();
		_delay_ms(500);
	}
}
