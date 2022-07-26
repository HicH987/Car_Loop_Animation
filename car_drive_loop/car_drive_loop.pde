
int x = 237;
int y = 197;
Sprite background;
PImage car;
ArrayList<PImage> bgAnim;

Rain[] rain = new Rain[500];
HorizontaLine[] lines = new HorizontaLine[14];

int currentFrame =0;
boolean recording = false;


void setup() {
  size(476, 472);
  smooth(10);

  car = loadImage("/assets/car.png");

  for (int i = 0; i < lines.length; i++)
      lines[i] = new HorizontaLine(x-(i)*20*1.6, y+(i)*20, x+(i)*20*1.6, y+(i)*20);

  bgAnim = new ArrayList<PImage>();
  for (int i = 1; i <13; i++)
      bgAnim.add(loadImage("/assets/background/bg-" + i + ".png"));
  background = new Sprite(bgAnim, 0, 0);

  for (int i = 0; i < rain.length; i++)
      rain[i] = new Rain();
}


void draw() {
  // background(49,9,24,100);
  background(109, 3, 61, 100);
  stroke(244, 27, 227, 100);
  strokeWeight(6);

  for (HorizontaLine l : lines)
      l.animatedLine(0.4);
  VerticalLine();

  image(car, 135, 290);

  background.show();
  background.animate(0.35);

  for (int i = 0; i < rain.length; i++) {
    rain[i].fall();
    rain[i].show();
  }
  
  record(1800);//30I/s --> 1800I/60s
}


//////////////////////////////
/////////////////////////////
void VerticalLine() {
  line(x, y, x, y);

  line(x, y, 0, 370);
  line(x, y, 0, 470);
  line(x, y, width, 370);
  line(x, y, width, 470);
  line(x, y, 171, height);
  line(x, y, width-171, height);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    recording = !recording;
    currentFrame = 0;
  }
}

void record(int frames){
  int totalFrames = frames;

  if (recording) {
    currentFrame +=1;
    saveFrame("output/fram_"+currentFrame+".png");

    if(currentFrame >= totalFrames)
        recording=false;

    displayMsg(20, 255, "Recording", width/2-40, height-45);

    String msg= "Created Frames: "+Integer.toString(currentFrame)+"/"+Integer.toString(totalFrames);
    displayMsg(18, 255, msg, width/2-80, height-25);

    fill(255, 0, 0);
  } 

  else {
    displayMsg(20, 255, "Press < R > to [Record/Stop-Record]", width/2-140, height-45);
    fill(0, 255, 0);
  }

  ellipse(width/2, height-70, 20, 20);
}

void displayMsg(int sizeTxt, int colT, String txt, float x, float y){
    textSize(sizeTxt);
    fill(colT);
    text(txt, x, y);
}

