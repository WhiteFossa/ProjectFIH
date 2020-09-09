/*
 * hal.h
 *
 * Hardware Abstraction Layer
 *
 *  Created on: Sep 6, 2020
 *      Author: fossa
 */

#ifndef HAL_HAL_H_
#define HAL_HAL_H_

/**
 * Includes
 */

#include <avr/io.h> /* Common */
#include <avr/interrupt.h> /* Interrupts support */
#include <util/delay.h> /* Basic delays. TODO: Remove it */

/**
 * End of includes
 */

/**
 *  MCU Frequency
 */
#define F_CPU 8000000UL

/**
 * Ports:
 * PC0 - Temperature input (ADC)
 *
 * PD0 - UART RX (input)
 * PD1 - UART TX (output)
 * PD2 - HWDT (Hardware WatchDog Timer) IRQ Request (input, INT0)
 * PD3 - HWDT IRQ Response (output)
 * PD4 - Heater off (output)
 * PD5 - Payload on (output)
 */

/** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 *  !!PORTS DIRECTIONS - WRONG SETTINGS WILL DAMAGE HARDWARE!!
 *  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
#define HAL_PORTB_DIR 0b00000000
#define HAL_PORTC_DIR 0b00000000
#define HAL_PORTD_DIR 0b00111010

/**
 * Ports and pins for various signals
 */

/* HWDT IRQ Response signal is on this port */
#define HAL_HWDT_IRQ_RESP_PORT PORTD

/* Heater off signal is on this port */
#define HAL_HEATER_OFF_PORT PORTD

/* Payload on signal is on this port */
#define HAL_PAYLOAD_ON_PORT PORTD

/* HWDT IRQ Response signal pin */
#define HAL_HWDT_IRQ_RESP_PIN 3

/* Heater off signal pin */
#define HAL_HEATER_OFF_PIN 4

/* Payload on signal pin */
#define HAL_PAYLOAD_ON_PIN 5



/**
 * Variables
 */

volatile uint8_t isEnabled;

/**
 * Functions (public)
 */

/**
 * Initialized hardware (port directions and so on).
 */
void hal_init();

/**
 * Heater control.
 */
void hal_heater_on();
void hal_heater_off();


/**
 * Payload control.
 */
void hal_payload_on();
void hal_payload_off();

/**
 * HWDT IRQ Resp low-level control
 */
void hal_pull_hwdt_irqresp_up();
void hal_pull_hwdt_irqresp_down();

/**
 * Functions (private)
 */

#endif /* HAL_HAL_H_ */
