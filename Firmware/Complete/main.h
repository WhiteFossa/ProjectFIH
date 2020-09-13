/*
 * main.h
 *
 *  Created on: Sep 6, 2020
 *      Author: fossa
 */

#ifndef MAIN_H_
#define MAIN_H_

/*
 * Includes goes here
 */

#include <util/delay.h> /* Basic delays */

#include "HAL/hal.h"

/*
 * End of includes
 */

/**
 * Startup delay in milliseconds. We need it to give HAL time to stabilize average temperature measurement.
 */
#define START_DELAY 1000U

/*
 * Payload-related variables
 */

/* Central (i.e. before applying hysteresis) payload off temperature */
uint16_t payload_off_target_temperature;

/* payload_off_level is calculated as payload_off_target_temperature +- this half hysteresis*/
uint8_t payload_off_half_hysteresis;

/**
 * If ADC measurement is less than this level, then payload will be off, if higher - then on
 */
uint16_t payload_off_level;


/**
 * Heater-related settings
 */

/*
 * If ADC measurement it higher than this level, then heater will be off.
 */
uint16_t heater_on_level;

/* Central (before applying hysteresis) heater on temperature */
uint16_t heater_on_target_temperature;

uint16_t heater_on_half_hysteresis;


#endif /* MAIN_H_ */
