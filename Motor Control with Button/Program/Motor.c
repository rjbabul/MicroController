void forward();
void reverse();
void stop();
 int sttus=0 ;
 int carry=0;
void main()
{

      TRISB =0x00;
      portb = 0x00;
      TRISD = 0xff;


      while(1){


            if( sttus==1)
            {
               if(portd.f4==1)
                  {
                    carry = 1;portd.f4=0;
                    sttus=0;
                  }
               if(portd.f3==1)
                  {
                    carry =0;
                    sttus=0;
                  }

            }
            else if( sttus==2)
            {
               if(portd.f1==1)
                  {
                    carry=1;portd.f1=0;
                    sttus=0;
                  }
               if(portd.f3==1)
                  {
                     carry=0;
                    sttus=0;
                  }
            }
            else
            {
                if(portd.f1==1 && !carry)
                   sttus=1;
                else if(portd.f4==1 && !carry)
                   sttus=2;
                else
                {  
                   carry=0;
                   portd.f1=0;
                   portd.f4=0;
                   sttus=0;
                }

            }

            if(sttus ==1)
            {
                forward();
            }
            else if(sttus==2)
            {
                reverse();
            }
            else if(sttus==0)
            {
                stop();
            }
      }
}

void forward()
  {
     portb.f0=1;
     portb.f2=0;
  }
  
void reverse()
  {
     portb.f0=0;
     portb.f2=1;
  }
  
void stop()
  {
     portb.f0=0;
     portb.f2=0;
  }