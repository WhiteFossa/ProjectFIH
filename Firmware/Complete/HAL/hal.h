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
#include <stdio.h> /* I/O over UART */

/**
 * End of includes
 */

/**
 *  MCU Frequency
 */
#define F_CPU 8000000UL

/**
 * UART baudrate
 */
#define BAUD 9600

#include <util/setbaud.h> /* Baudrate macroses */

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

/**
 * ADC-related data:
 * Vref = 2.56V
 *
 *	Temp	LM135	ADCin	Code
 *	-50		2.23	0.66	264
 *	+5		2.78	1.60	640
 *	+25		2.98	2.02	808
 *	+60		3.33	2.55	1020
 *
 * ADC = 6.873 * Tcelsius + 607.64
 *
 * Delta(ADC-per-Celsius) = 6.873
 *
 */

/* Boolean */
#define bool uint8_t
#define true 0xFFU
#define false 0x00U

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


/* States for HWDT IRQ Resp state machine */
#define HAL_HWDT_IRQRESP_SM_STANDBY 0U /* Standby for IRQ, IRQRESP low */
#define HAL_HWDT_IRQRESP_SM_PRE_PULSE 1U /* After IRQ, pre pulse, IRQRESP low */
#define HAL_HWDT_IRQRESP_SM_PULSE 2U /* Pulse, IRQRESP high */
#define HAL_HWDT_IRQRESP_SM_POST_PULSE 3U /* Post pulse, IRQRESP low */

/* Temperature conversion related constants */
#define HAL_ADC_AVERAGING_WINDOW_LENGTH 16U /* Averaging window length*/

/**
 * Variables
 */

/* HWDT IRQ Resp state machine state */
volatile uint8_t hal_hwdt_irqresp_state_machine_state;

/* ADC averaging window */
volatile uint16_t hal_adc_averaging_window[HAL_ADC_AVERAGING_WINDOW_LENGTH];

/* ADC average value, multiplied by window length. */
volatile int32_t hal_adc_average_value_multiplied;

/* Averaged ADC value, use it to temperature measurements */
volatile uint16_t hal_adc_average;


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
bool hal_is_heater_on();


/**
 * Payload control.
 */
void hal_payload_on();
void hal_payload_off();
bool hal_is_payload_on();

/**
 * HWDT IRQ Resp low-level control
 */
void hal_pull_hwdt_irqresp_up();
void hal_pull_hwdt_irqresp_down();

/* Returns current temperature (as ADC readings) */
uint16_t hal_get_temperature();

/**
 * Functions (private)
 */

/* Put character into stream */
static int hal_uart_putchar(char c, FILE *stream);

/* Streams */
static FILE hal_uart_stdout = FDEV_SETUP_STREAM(hal_uart_putchar, NULL, _FDEV_SETUP_WRITE);

#endif /* HAL_HAL_H_ */
