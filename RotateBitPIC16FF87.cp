#line 1 "C:/Users/erick/Documents/RotateBitPIC16F887/RotateBit_PIC16F887/RotateBitPIC16FF87.c"

unsigned char temp,i;

int main(){
 TRISD = 0x00;
 TRISA0_bit = 0X01;
 PORTD = 0x01;
 ANSEL = 0x00;


 while(1){





 if(RA0_bit == 0){


 for(i = 0; i < 8; i++){
 if(RA0_bit == 0){
 temp = (PORTD & 0x01) << 7;
 PORTD = (PORTD >> 1) | temp;
 Delay_ms(90);
 }else{
 PORTD = 0xFF;
 Delay_ms(150);
 PORTD = 0x00;
 Delay_ms(150);
 }
 }
 for( i = 0; i < 8; i++){
 if(RA0_bit == 0){
 temp = (PORTD & 0x80) >> 8;
 PORTD = (PORTD << 1) | temp;
 Delay_ms(90);
 }else{
 PORTD = 0xFF;
 Delay_ms(150);
 PORTD = 0x00;
 Delay_ms(150);
 }
 }
 Delay_ms(150);
 }else{
 PORTD = 0xFF;
 Delay_ms(150);
 PORTD = 0x00;
 Delay_ms(150);
 }
 }
}
