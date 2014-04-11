/*
 * main.h
 *
 *  Created on: Apr 6, 2014
 *      Author: C15Geoffrey.Novakows
 */

#ifndef MAIN_H_
#define MAIN_H_

unsigned char getLEDVal();
unsigned char outputUpperled(unsigned char c);
unsigned char outputLowerled(unsigned char c);
int checkLED(unsigned char c1, unsigned char c2, unsigned char c3);
int checkSWT(unsigned char c1, unsigned char c2, unsigned char c3);
unsigned char getTopNibble(unsigned char ascii);
unsigned char getBtmNibble(unsigned char ascii);
void outputSWT(unsigned char ascii);
unsigned char topNibbleToAscii(unsigned char nibble);
unsigned char btmNibbleToAscii(unsigned char nibble);


#endif /* MAIN_H_ */
