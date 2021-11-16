/***********************************************************************
 * 
 * The I2C bus scanner detects the addresses of the modules that are 
 * connected to the SDA and SCL signals. A simple description of FSM is 
 * used.
 * ATmega328P (Arduino Uno), 16 MHz, AVR 8-bit Toolchain 3.6.2
 *
 * Copyright (c) 2017-Present Tomas Fryza
 * Dept. of Radio Electronics, Brno University of Technology, Czechia
 * This work is licensed under the terms of the MIT license.
 * 
 **********************************************************************/

/* Defines -----------------------------------------------------------*/
#ifndef F_CPU
# define F_CPU 16000000  // CPU frequency in Hz required for UART_BAUD_SELECT
#endif

/* Includes ----------------------------------------------------------*/
#include <avr/io.h>         // AVR device-specific IO definitions
#include <avr/interrupt.h>  // Interrupts standard C library for AVR-GCC
#include "timer.h"          // Timer library for AVR-GCC
#include <stdlib.h>         // C library. Needed for conversion function
#include "uart.h"           // Peter Fleury's UART library
#include "twi.h"            // TWI library for AVR-GCC

/* Variables ---------------------------------------------------------*/
typedef enum {              // FSM declaration
    //STATE_IDLE = 1,
    //STATE_SEND,
    //STATE_ACK
	STATE_IDLE = 1,
	STATE_HUMID,
	STATE_TEMP,
	STATE_CHECK
} state_t;

/* Function definitions ----------------------------------------------*/
/**********************************************************************
 * Function: Main function where the program execution begins
 * Purpose:  Use Timer/Counter1 and send I2C (TWI) address every 33 ms.
 *           Send information about scanning process to UART.
 * Returns:  none
 **********************************************************************/
int main(void)
{
    // Initialize I2C (TWI)
    twi_init();

    // Initialize UART to asynchronous, 8N1, 9600
    uart_init(UART_BAUD_SELECT(9600, F_CPU));

    // Configure 16-bit Timer/Counter1 to update FSM
    // Set prescaler to 33 ms and enable interrupt
    TIM1_overflow_33ms();
    TIM1_overflow_interrupt_enable();

    // Enables interrupts by setting the global interrupt mask
    sei();

    // Put strings to ringbuffer for transmitting via UART
    uart_puts("\r\nScan I2C-bus for devices:\r\n");

    // Infinite loop
    while (1)
    {
        /* Empty loop. All subsequent operations are performed exclusively 
         * inside interrupt service routines ISRs */
    }

    // Will never reach this
    return 0;
}

/* Interrupt service routines ----------------------------------------*/
/**********************************************************************
 * Function: Timer/Counter1 overflow interrupt
 * Purpose:  Update Finite State Machine and test I2C slave addresses 
 *           between 8 and 119.
 **********************************************************************/
ISR(TIMER1_OVF_vect)
{
    //static state_t state = STATE_IDLE;  // Current state of the FSM
    //static uint8_t addr = 7;            // I2C slave address
    //static uint8_t temp = 0;            // temperature
    //uint8_t result = 1;                 // ACK result from the bus
    //char uart_string[2] = "00";			// String for converting numbers by itoa()
    //char temp_string[2] = "00";
//
    //// FSM
    //switch (state)
    //{
    //// Increment I2C slave address
    //case STATE_IDLE:
        //addr++;
        //// If slave address is between 8 and 119 then move to SEND state
        //if (addr < 120) state = STATE_SEND;
            //else addr = 7;
        //break;
    //
    //// Transmit I2C slave address and get result
    //case STATE_SEND:
        //// I2C address frame:
        //// +------------------------+------------+
        //// |      from Master       | from Slave |
        //// +------------------------+------------+
        //// | 7  6  5  4  3  2  1  0 |     ACK    |
        //// |a6 a5 a4 a3 a2 a1 a0 R/W|   result   |
        //// +------------------------+------------+
        ///*result = twi_start((addr<<1) + TWI_WRITE);
        //twi_stop();*/
        ///* Test result from I2C bus. If it is 0 then move to ACK state, 
         //* otherwise move to IDLE */
        //if (result == 0) {
            //state = STATE_ACK;
        //}
        //else {
            //state = STATE_IDLE;
        //}
        //break;
//
    //// A module connected to the bus was found
    //case STATE_ACK:
        //// Send info about active I2C slave to UART and move to IDLE
        ///*uart_puts("Addr:");             //address reading
        //itoa(addr, uart_string, 16);
        //uart_puts(uart_string);
        //uart_puts("\r\n");*/
        ////twi_start(00);
        //temp = twi_read_nack();
		//twi_stop()
        //itoa(temp, temp_string, 10);
        //uart_puts(temp_string);
        //uart_puts("\r\n");
        //
        //state = STATE_IDLE;
        //break;
//
    //// If something unexpected happens then move to IDLE
    //default:
        //state = STATE_IDLE;
        //break;
    //}
	
	/*static uint8_t temp = 0;
	uint8_t addr = 92;
	char temp_string[2] = "00";
	
	twi_start((addr<<1) + TWI_WRITE);
	twi_write(2);
	twi_start((addr<<1) + TWI_WRITE);
	temp = twi_read_nack();*/
	
	static state_t state = STATE_IDLE;  // Current state of the FSM
	static uint8_t addr = 0x5c;  // I2C slave address of DHT12
	uint8_t value;               // Data obtained from the I2C bus
	char uart_string[] = "000";  // String for converting numbers by itoa()
	char humint_string[2] = "00";
	char humfrc_string[2] = "00";
	char tempint_string[2] = "00";
	char temfrc_string[2] = "00";
	char checksum_string[2] = "00";

	// FSM
	switch (state)
	{
		// Do nothing
		case STATE_IDLE:
		// Move to the next state
		state = STATE_HUMID;
		break;
		
		// Get humidity
		case STATE_HUMID:
		// WRITE YOUR CODE HERE
		twi_start((addr<<1) + TWI_WRITE);
		twi_write(0);
		twi_start((addr<<1) + TWI_WRITE);
		uint8_t humid_int = twi_read_nack();
		twi_start((addr<<1) + TWI_WRITE);
		twi_write(1);
		twi_start((addr<<1) + TWI_WRITE);
		uint8_t humid_frc = twi_read_nack();
		itoa(humid_int, humint_string, 10);
		itoa(humid_frc, humfrc_string, 10);
		uart_puts("Humidity: ");
		uart_puts(humint_string);
		uart_puts(".");
		uart_puts(humfrc_string);
		uart_puts("\r\n");
		// Move to the next state
		state = STATE_TEMP;
		break;

		// Get temperature
		case STATE_TEMP:
		// WRITE YOUR CODE HERE
		twi_start((addr<<1) + TWI_WRITE);
		twi_write(2);
		twi_start((addr<<1) + TWI_WRITE);
		uint8_t temp_int = twi_read_nack();
		twi_start((addr<<1) + TWI_WRITE);
		twi_write(3);
		twi_start((addr<<1) + TWI_WRITE);
		uint8_t temp_frc = twi_read_nack();
		itoa(temp_int, tempint_string, 10);
		itoa(temp_frc, temfrc_string, 10);
		uart_puts("Temperature: ");
		uart_puts(tempint_string);
		uart_puts(".");
		uart_puts(temfrc_string);
		uart_puts("\r\n");
		// Move to the next state
		state = STATE_CHECK;
		break;

		// Get checksum
		case STATE_CHECK:
		// WRITE YOUR CODE HERE
		twi_start((addr<<1) + TWI_WRITE);
		twi_write(4);
		twi_start((addr<<1) + TWI_WRITE);
		uint8_t checksum = twi_read_nack();
		itoa(checksum, checksum_string, 10);
		uart_puts("Checksum: ");
		uart_puts(checksum_string);
		uart_puts("\r\n");
		uart_puts("------------");
		uart_puts("\r\n");
		// Move to the next state
		state = STATE_IDLE;
		break;

		default:
		state = STATE_IDLE;
		break;
	}
	 
}