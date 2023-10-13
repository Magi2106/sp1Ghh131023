ArrayList<Square> squares = new ArrayList<Square>();
Ball ball;
int frameCounter = 0;
int frameRate = 30; // Adjust as needed
Timer timer;

void setup() {
  smooth();
  size(480, 720);
  noStroke();
  generateRandomSquare();
  ball = new Ball(200, 200, 20, color(255, 0, 0));
  timer = new Timer(10); // Initial timer value (adjust as needed)
}

void draw() {
  background(255); // Clear the screen with a white background

  // Display and apply gravity to squares
  for (Square square : squares) {
    square.display();
    square.applyGravity();
  }

  // Check for collisions between the ball and squares
  for (Square square : squares) {
    if (ball.isCollidingWith(square)) {
      ball.handleCollisionWithPlatform(square);
    }
  }

  // Apply gravity to the ball
  ball.applyGravity(0.65);

  // Display the ball and allow it to move
  ball.display();
  ball.move();

  frameCounter++; // Increment frame counter

  // Check for a victory condition when the ball reaches the top
  if (ball.y - ball.radius < 0) {
    background(0); // Set a red background
    fill(color(255, 0, 0)); // Set text color to white
    textSize(32); // Set text size
    textAlign(CENTER, CENTER); // Center-align text
    text("VICTORY!", width / 2, height / 2); // Display victory message
    noLoop(); // Stop the draw loop
  }

  // Generate a new square periodically based on frame rate
  if (frameCounter % frameRate == 0) {
    generateRandomSquare();
  }

  // Update and display the timer
  timer.update();
  timer.display();

  // Check if the timer has reached 0
  if (timer.isFinished()) {
    background(0); // Set a red background
    fill(color(255, 0, 0)); // Set text color to white
    textSize(32); // Set text size
    textAlign(CENTER, CENTER); // Center-align text
    text("YOU DIED", width / 2, height / 2); // Display game over message
    noLoop(); // Stop the draw loop
  }
}
