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

	_delay_ms(START_DELAY);

	/* TODO: Load parameters from EEPROM */
	payload_off_target_temperature = 750U;
	payload_off_half_hysteresis = 7U;

	heater_on_target_temperature = 780U;
	heater_on_half_hysteresis = 7U;

	/* Suppose that payload is off on power on*/
	payload_off_level = payload_off_target_temperature - payload_off_half_hysteresis;

	/* And heater is on */
	heater_on_level = heater_on_target_temperature + heater_on_half_hysteresis;

	while(1)
	{
		uint16_t current_temperature = hal_get_temperature();

		printf("Current temperature: %d\n", current_temperature);

		/*
		 * Payload switching
		 */
		if (hal_is_payload_on() && (current_temperature < payload_off_level))
		{
			/* Turning off */
			hal_payload_off();
			payload_off_level = payload_off_target_temperature + payload_off_half_hysteresis;
			printf("Payload off, temperature: %d\n", current_temperature);
		}
		else if (!hal_is_payload_on() && (current_temperature > payload_off_level))
		{
			/* Turning on */
			hal_payload_on();
			payload_off_level = payload_off_target_temperature - payload_off_half_hysteresis;
			printf("Payload on, temperature: %d\n", current_temperature);
		}


		/*
		 * Heater switching
		 */
		if (!hal_is_heater_on() && (current_temperature < heater_on_level))
		{
			/* Turning on */
			hal_heater_on();
			heater_on_level = heater_on_target_temperature + heater_on_half_hysteresis;
			printf("Heater on, temperature: %d\n", current_temperature);
		}
		else if (hal_is_heater_on() && (current_temperature > heater_on_level))
		{
			/* Turning off */
			hal_heater_off();
			heater_on_level = heater_on_target_temperature - heater_on_half_hysteresis;
			printf("Heater off, temperature: %d\n", current_temperature);
		}

		_delay_ms(1000); /* TODO: Remove it */
	}
}
