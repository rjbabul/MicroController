char array[]= {0xCF ,0xFF, 0xC7, 0xA3, 0xC1, 0x86, 0xFF,0x91,0xA3,0xE3, 0xFF, 0x8C, 0xAB, 0xEF,0x87,0x91,0xFF,0xCF ,0xFF, 0xC7, 0xA3, 0xC1, 0x86, 0xFF,0x91,0xA3,0xE3, 0xFF, 0x8C, 0xAB, 0xEF,0x87,0x91 };
void main() {
     int i=0, j,k,a,b,c,d;
     TRISB = 0x00;
     portb = 0x00;
     TRISD =0x00;
     portd=0x00;
     while(1)
     {
          for(i=0;i<30;i++)
          {
           a=i;
           b=a+1;
           c=b+1;
           d=c+1;
             
             for(k=0;k<10;k++)
           {
               portd.f2=1;
               portb = array[a];
               delay_ms(10);
               portd.f2=0;
               
               portd.f3=1;
               portb= array[b];
               delay_ms( 10);
               portd.f3=0;
               
               portd.f4=1;
               portb = array[c];
               delay_ms(10);
               portd.f4=0;
               
               portd.f5=1;
               portb= array[d];
               delay_ms(10);
               portd.f5=0;
           }

          }
     }
}