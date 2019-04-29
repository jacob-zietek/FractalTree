long seed = 1; double divisor = 1.75;

void setup(){
  fullScreen();
}

void draw(){
  if(keyPressed)
    seed++;
  background(255, map(mouseY, height, 0, 0, 255), map(mouseY, 0, height, 0, 255));
  text("Press a key to randomize angles", 40, 40);
  fill(0);
  translate(width/2, height);
  strokeWeight(2);
  stroke(0);
  branch(height/2, (int)(mouseX * .3));
}

void branch(int len, int angle){
  if(len < 4)
    return;
  line(0, -len, 0, 0);
  translate(0, -len);
  push();
  randomSeed(seed);
  rotate(radians(angle*random(-2,2)));
  branch((int)(len/divisor), angle);
  pop();
  rotate(radians(-angle*random(-2,2)));
  branch((int)(len/divisor), angle);
}
