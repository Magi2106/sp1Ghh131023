class Timer {
  int time; // Remaining time in seconds
  int startTime; // Starting time
  int previousTime; // Previous time for updating the timer

  // Constructor to initialize the timer with an initial time
  Timer(int initialTime) {
    time = initialTime;
    startTime = initialTime;
    previousTime = 0;
  }

  // Method to update the timer's time based on real-time elapsed
  void update() {
    int currentTime = millis() / 1000; // Current time in seconds

    if (currentTime > previousTime) {
      time = startTime - (currentTime - startTime);
      previousTime = currentTime;
    }
  }

  // Method to display the timer on the screen
  void display() {
    fill(0);
    textSize(24);
    textAlign(LEFT);
    text("Reach the top before: " + max(0, time), 20, 30);
  }

  // Method to add extra time to the timer
  void addTime(int extraTime) {
    time += extraTime;
  }

  // Method to check if the timer has reached 0 (finished)
  boolean isFinished() {
    return time <= 0;
  }
}
