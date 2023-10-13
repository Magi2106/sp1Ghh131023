class Ball {
  float x;        // x-coordinate of the ball
  float y;        // y-coordinate of the ball
  float radius;   // radius of the ball
  color fillColor; // fill color of the ball
  float velocityY; // Y-velocity for gravity
  float velocityX; // X-velocity for left and right movement
  boolean isJumping; // Flag to check if the ball is currently jumping
  float jumpStrength; // Strength of the jump
  float friction; // Friction coefficient

  // Constructor to initialize the ball's position, radius, and color
  Ball(float x, float y, float radius, color fillColor) {
    this.velocityX = 0; // Initialize the X-velocity to 0
    this.velocityY = 0; // Initialize the Y-velocity to 0
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.fillColor = fillColor;
    this.jumpStrength = -15; // Negative value to make the ball jump upwards
    this.isJumping = false;
    this.friction = 0.98; // Adjust this value for the amount of friction
  }

  // Method to apply gravity to the ball
  void applyGravity(float gravity) {
    velocityY += gravity;
    y += velocityY;

    // Check if the ball hits the ground
    if (y + radius > height) {
      y = height - radius;
      velocityY *= -0.5;
      isJumping = false; // Reset the jumping flag when the ball hits the ground
    }
  }

  // Method to display the ball
  void display() {
    fill(fillColor);
    ellipse(x, y, radius * 2, radius * 2);
  }

  // Method to move the ball left or right
  void move() {
    x += velocityX;
    velocityX *= friction;
  }

  // Method to make the ball jump
  void jump() {
    if (!isJumping) {
      velocityY = jumpStrength;
      isJumping = true;
    }
  }

  // Method to check if the ball is colliding with a square
  boolean isCollidingWith(Square square) {
    float ballLeft = x - radius;
    float ballRight = x + radius;
    float ballTop = y - radius;
    float ballBottom = y + radius;

    float squareLeft = square.x - square.side / 2;
    float squareRight = square.x + square.side / 2;
    float squareTop = square.y - square.side / 2;
    float squareBottom = square.y + square.side / 2;

    return ballRight > squareLeft && ballLeft < squareRight && ballBottom > squareTop && ballTop < squareBottom;
  }

  // Method to handle collisions with a platform (square)
  void handleCollisionWithPlatform(Square square) {
    float ballTop = y - radius;
    float ballBottom = y + radius;

    float squareTop = square.y - square.side / 2;
    float squareBottom = square.y + square.side / 2;

    // Check if the ball is falling onto the platform
    if (velocityY >= 0 && ballTop < squareTop && ballBottom < squareBottom) {
      y = squareTop - radius;
      velocityY = 0;
      isJumping = false;
    }
  }
}
