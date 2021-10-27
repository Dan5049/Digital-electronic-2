/***********************************************************************
 * 
 * Stopwatch with LCD display output.
 * ATmega328P (Arduino Uno), 16 MHz, AVR 8-bit Toolchain 3.6.2
 *
 * Copyright (c) 2017-Present Tomas Fryza
 * Dept. of Radio Electronics, Brno University of Technology, Czechia
 * This work is licensed under the terms of the MIT license.
 * 
 **********************************************************************/

#ifndef F_CPU
#define F_CPU 16000000UL
#endif

/* Includes ----------------------------------------------------------*/
#include <avr/io.h>         // AVR device-specific IO definitions
#include <avr/interrupt.h>  // Interrupts standard C library for AVR-GCC
#include "timer.h"          // Timer library for AVR-GCC
#include "lcd.h"            // Peter Fleury's LCD library
#include <stdlib.h>         // C library. Needed for conversion function
#include "customChar.h"
#include "util/delay.h"

/* Function definitions ----------------------------------------------*/
/**********************************************************************
 * Function: Main function where the program execution begins
 * Purpose:  Update stopwatch value on LCD display when 8-bit 
 *           Timer/Counter2 overflows.
 * Returns:  none
 **********************************************************************/

// Custom character definition using https://omerk.github.io/lcdchargen/

int main(void)
{
    // Initialize LCD display
    lcd_init(LCD_DISP_ON);

    // Set pointer to beginning of CGRAM memory
    lcd_command(1 << LCD_CGRAM);
    for (uint8_t i = 0; i < 48; i++)
    {
        // Store all new chars to memory line by line
        lcd_data(customChar[i]);
    }
    // Set DDRAM address
    lcd_command(1 << LCD_DDRAM);
    
    // Display first custom character
    lcd_clrscr();
	_delay_ms(100);
    lcd_gotoxy(1, 0);
    lcd_puts("00:00.0");
    lcd_gotoxy(11, 0);
    lcd_putc('a');
    lcd_gotoxy(1, 1);
    lcd_putc('b');
    lcd_gotoxy(11, 1);
    lcd_putc('c');
	_delay_ms(250);
	/*lcd_gotoxy(1, 1);
	lcd_putc(' ');*/
	
	TIM2_16m();
	TIM2_overflow_interrupt_enable();
	TIM0_overflow_16ms();
	TIM0_overflow_interrupt_enable();

	sei();

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
 * Function: Timer/Counter2 overflow interrupt
 * Purpose:  Update the stopwatch on LCD display every sixth overflow,
 *           ie approximately every 100 ms (6 x 16 ms = 100 ms).
 **********************************************************************/
ISR(TIMER2_OVF_vect)
{
    static uint8_t number_of_overflows = 0;
    static uint8_t tens = 0;			// Tenths of a second
    static uint8_t secs = 0;			// Seconds
	static uint8_t mins = 0;			// Minutes
    char lcd_string_secs[2] = "  ";     // String for converting numbers by itoa()
	char lcd_string_mins[2] = "  ";
    char lcd_pwr[4] = "  ";
    uint16_t pwr;
    
    number_of_overflows++;
    if (number_of_overflows >= 6)
    {
        // Do this every 6 x 16 ms = 100 ms
        number_of_overflows = 0;

        tens++;
        if (tens >= 10) {
           tens = 0;
           secs++;		   
           if (secs >= 60) {
               secs = 0;
			   mins++; 
			   if (mins >= 60) {
				   mins = 0;
			   }
           } 
        pwr = secs * secs;          //powering seconds
        itoa(pwr, lcd_pwr, 10);     //number to string
        lcd_gotoxy(11, 0);
        lcd_puts(lcd_pwr);          //printing power of seconds
        }
        
        lcd_gotoxy(7, 0);
        lcd_putc(tens + '0');
        itoa(secs, lcd_string_secs, 10);
        lcd_gotoxy(4, 0);
        if (secs < 10) {
            lcd_putc('0');
        }
        lcd_puts(lcd_string_secs);
		
		itoa(mins, lcd_string_mins, 10);
		lcd_gotoxy(1, 0);
		if (mins < 10) {
			lcd_putc('0');
		}
		lcd_puts(lcd_string_mins);
        
    }
    // Else do nothing and exit the ISR
}

ISR(TIMER0_OVF_vect)
{	
	static uint8_t tnt = 0;
	static uint8_t col = 0;
	lcd_gotoxy(tnt + 1, 1);
	lcd_putc(col);
	col++;
	if(col == 6) {
		col = 0;
		tnt++;
		if (tnt == 10) {
			tnt = 0;
			lcd_gotoxy(1, 1);
			lcd_puts("          ");
		}
	}

// Else do nothing and exit the ISR
}