int paddleX;
float ballXSpeed,ballYSpeed;
int ballY,ballX;
int score;
int ballRadius = 10;
int paddleThickness = 15;

void setup()
{
  size(600,600);
  background(0);
  rectMode(CENTER); // rect drawn based on center point
  paddleX = width/2;
  ballY = height/2;
  ballX = width/2;
  ballYSpeed = random(-3,3);
  ballXSpeed = random(-3,3);
  score = 0;
  //textMode(CENTER);
}


void draw()
{
  background(0); // erase old drawings each time through loop
  stroke(255);
  noFill();
  rect(width/2,height/2,width,height);
  textSize(30);
  fill(255);
  text(score,30,50);
  fill(255);
  ellipse(ballX,ballY,ballRadius*2,ballRadius*2); // ball
  rect(paddleX,height-paddleThickness/2,150,15); // paddle
  
  // make ball move
  ballY += ballYSpeed;
  ballX += ballXSpeed;
  
  
  // bounce ball off left side
  if(ballX < 0 && ballY < height) {
    ballXSpeed *= -1;
  } 
  
  // bounce ball off right side
  if(ballX > width && ballY < height) {
    ballXSpeed *= -1;
  }
  
  // bounce ball off top
  if(ballY < 0) {
    ballYSpeed *= -1;
  }
  // bounce ball off paddle
  if(ballY > height - ballRadius*2 && ballX > paddleX-75 && ballX < paddleX + 75) {
    //ballXSpeed *= -1;
    ballYSpeed *= -1;
    score += 1;
    ballXSpeed *= 1.3;
    ballYSpeed *= 1.3;
  
  }
  
  // if ball goes past the paddle
  if(ballY > height-10) {
    ballY = width/2;
    ballX = height/2;
    noLoop();
    background(0);
    text("Game Over", width/2-80,height/2);
    text("Reset: r", width/2-58, height/2 + 50);
  }
  
  // move paddle
  if(keyPressed) 
  {
   if(keyCode == RIGHT) 
   {
     paddleX += 5;
   } 
   else if(keyCode == LEFT) 
   {
     paddleX -= 5;
   }
  }
}

void keyPressed() {
  if(key == 'r') {
       ballY = height/2;
        ballX = width/2;
        ballYSpeed = 2;
        ballXSpeed = -3;
        score = 0; 
        loop();
     } 
}