//RotateBit Author: Erick Gabriel Amaral Garcia
unsigned char temp,i; //Global variables Declarated

int main(){
    TRISD = 0x00; //Declarate Output PORTD
    TRISA0_bit = 0X01; //Declarate bit 0 from PORTA
    PORTD = 0x01; //Set PORTD whit 0x01 value
    ANSEL = 0x00; //Analog Select Register to configured like digital input
    
             while(1){

                       if(RA0_bit == 0){ //Check bit 0 from PORTA

                                  for(i = 0; i < 8; i++){ //For Cicle fot rotate Rigth
                                      if(RA0_bit == 0){ //Check the buton state to reset
                                                 temp = (PORTD & 0x01) << 7; //Less significan Bit Mask
                                                 PORTD = (PORTD >> 1) | temp; //Shift to the Rigth
                                                 Delay_ms(90); // Delay 90ms
                                      }else{
                                                 PORTD = 0xFF; // Set value 0xFF in PORTD
                                                 Delay_ms(150); // Delay 150ms
                                                 PORTD = 0x00; // Set value 0x00 in PORTD
                                                 Delay_ms(150); // Delay 150ms
                                      }
                                  }
                                  for( i = 0; i < 8; i++){ // For Cicle fot rotate Rigth
                                      if(RA0_bit == 0){ // Check the buton state to reset
                                                 temp = (PORTD & 0x80) >> 8; // Most significan Bit Mask
                                                 PORTD = (PORTD << 1) | temp; // Shift to the Rigth
                                                 Delay_ms(90); // Delay 90ms
                                      }else{
                                                 PORTD = 0xFF; // Set value 0xFF in PORTD
                                                 Delay_ms(150); // Delay 150ms
                                                 PORTD = 0x00; // Set value 0x00 in PORTD
                                                 Delay_ms(150); // Delay 150ms
                                      }
                                  }
                                  Delay_ms(150); // Delay 90ms
                      }else{
                                  PORTD = 0xFF; // Set value 0xFF in PORTD
                                  Delay_ms(150); // Delay 150ms
                                  PORTD = 0x00; // Set value 0x00 in PORTD
                                  Delay_ms(150); // Delay 150ms
                      }
             }//End While
}//End Main
