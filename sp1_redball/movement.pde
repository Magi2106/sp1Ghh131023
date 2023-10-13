void keyPressed() {
  if (keyCode == LEFT) {
    ball.velocityX = -4; // Move the ball left when the LEFT arrow key is pressed
  } else if (keyCode == RIGHT) {
    ball.velocityX = 4; // Move the ball right when the RIGHT arrow key is pressed
  } else if (keyCode == 32) {
    ball.jump(); // Make the ball jump when the SPACE key is pressed
  }
}
