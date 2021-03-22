
byte encoder_a = 2;
byte encoder_b = 3;
byte encoder_z = 4;
int  encoder_cnt=0;
int  encoder_rotate_cnt=0;

void setup() {
  pinMode(encoder_a,INPUT_PULLUP);
  pinMode(encoder_b,INPUT_PULLUP);
  pinMode(encoder_z,INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(encoder_a), encoder_pulse, RISING);
  Serial.begin(9600);
}

void loop() {
  Serial.println(encoder_cnt);
  delay(10);
}

void encoder_pulse() {
  if(digitalRead(encoder_b)==0){
    encoder_cnt++;
    if(digitalRead(encoder_z)==0){
      encoder_rotate_cnt++;
    }
  }else{
    encoder_cnt--;  
    if(digitalRead(encoder_z)==0){
      encoder_rotate_cnt--;
    }
  }
}
