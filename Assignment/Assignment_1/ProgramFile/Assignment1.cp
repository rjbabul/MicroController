#line 1 "D:/Practice/Assignment/Assignment1/ProgramFile/Assignment1.c"
char array [] = {0xC0, 0xF9, 0xA4 ,0xB0 ,0x99,0x92, 0x82,0xF8 ,0x80 , 0x90 } ;
int valADC=0;
int cnt=0,volt=0, temp=0,i;
int leftDigit=0, rigthDigit=0;
void call(int x);
void ledBlinking(int x);

void main() {

 TRISB=0x00;
 TRISC= 0x00;
 portc.f3=0xff;
 cnt=0;
 temp=0;
 valADC = 0;
 while(1)
 {


 if(portd.f5==1)
 {
 call(cnt);
 if(portd.f2==1 )
 {
 if(portd.f2==1 )
 {
 cnt++;
 call(cnt);
 }
 }


 if(portd.f3==1 )
 {

 if(portd.f3==1 )
 {
 cnt--;
 call(cnt);

 }
 }
 }

 if(portd.f5==0)
 { call(temp);
 if(portd.f2==1 )
 {
 if(portd.f2==1 )
 {
 temp++;
 call(temp);
 }
 }


 if(portd.f3==1 )
 {

 if(portd.f3==1 )
 {
 temp--;
 call(temp);
 }
 }

 }

 if(cnt>0 && cnt == temp )
 ledBlinking(cnt);
 }

}


void call(int x)
{

 int leftDigit= x/10;
 int rigthDigit=x%10;
 int i=0;
 for( i=0;i<=8;i++)
 {
 portc.f0=1;
 portb= array[leftDigit];
 delay_ms(10);
 portc.f0=0;

 portc.f1=1;
 portb = array[rigthDigit];
 delay_ms(10);
 portc.f1=0;
 }

}

void ledBlinking(int x)

 {
 while(1)
 {
 portc.f3=0x00;
 call(x);
 for(i=1;i<=100;i+=10)
 {
 portc.f4=0xff;
 call(x);
 }

 portc.f4=0x00;

 call(x);
 for(i=1;i<=100;i+=10)
 {
 portc.f5=0xff;

 call(x);
 }

 portc.f5=0x00;
 call(x);

 for( i=1;i<=100;i+=10)
 {
 portc.f3=0xff;

 call(x);
 }

 }
}
