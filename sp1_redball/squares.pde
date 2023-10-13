class Square {
  float x;
  float y;
  float side;
  color fillColor;
  float gravity;

  // Constructor to initialize the square's position, size, color, and gravity
  Square(float x, float y, float side, color fillColor, float gravity) {
    this.x = x;
    this.y = y;
    this.side = side;
    this.fillColor = fillColor;
    this.gravity = gravity;
  }

  // Method to display the square
  void display() {
    fill(fillColor);
    rect(x - side / 2, y - side / 2, side, side);
  }

  // Method to apply gravity to the square
  void applyGravity() {
    y += gravity;
  }
}

// Function to generate a random square and add it to the list of squares
void generateRandomSquare() {
  float x = random(width);
  float y = -50; // Start the square off-screen at the top
  float side = random(30, 200); // Adjust the size range as needed
  color fillColor = color(random(255), random(255), random(255)); // Random color
  float gravity = random(1, 3.5); // Random gravity for squares
  squares.add(new Square(x, y, side, fillColor, gravity));
}
