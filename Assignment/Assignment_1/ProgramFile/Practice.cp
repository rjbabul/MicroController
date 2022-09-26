#line 1 "D:/4_2/Interfacing & Microcontroller/LapWork/Assignment/Assignment1/ProgramFile/Practice.c"
void main() {
 TRISB = 0x00;
 TRISD =0x00;
 portd.f3=0x00;
 portb = 0x00;
 while(1)
 {
 if(portd.f3 ==1)
 {
 portb.f0 = 0xff;
 delay_ms(200);

 portb.f0 = 0x00;
 delay_ms(200);

 portb.f1 = 0xff;
 delay_ms(200);

 portb.f1 = 0x00;
 delay_ms(200);

 portb.f2 = 0xff;
 delay_ms(200);
 portb.f2 = 0x00;
 delay_ms(200);


 }

 }
}
