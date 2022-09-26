char array [] = {0xC0, 0xF9, 0xA4 ,0xB0 ,0x99,0x92, 0x82,0xF8 ,0x80 , 0x90 } ;

void main() {
     int i, j,k;
     TRISB = 0x00;
     portb = 0x00;
     TRISC =0x00;
     portc=0x00;

     while(1)
     {
         for(i=0;i<10;i++)
         {
             for(j =0;j<10;j++)
             {
                 for( k=0;k<50;k++)
                 {
                     portc.f0=1;
                     portb= array[i];
                     delay_ms(10);
                     portc.f0=0;
                     
                     portc.f1=1;
                     portb = array[j];
                     delay_ms(10);
                     portc.f1=0;
                 }
             }
         }
         
     }
}