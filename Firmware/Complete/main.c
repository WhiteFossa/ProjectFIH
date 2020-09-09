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
		hal_payload_on();
		_delay_ms(5000);
		hal_payload_off();
		_delay_ms(5000);
	}
}
