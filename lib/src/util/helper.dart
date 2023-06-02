
/// Read more about these functions here:
///
/// [Payment card number division with a space as the separator.](https://gist.github.com/kenresoft/bc91291c6d1d06826002939c38f5498a)
///
// This code is written in Dart programming language

// This function takes a string input and returns the number of divisions that can be made
// in the string based on its length. A division is made by adding a space character after
// every n characters, where n is the number of divisions.
int divisions(String input) {
  int divisions = 0;

  // Check if the length of the input string is divisible by 3 or 4
  for (var j = 3; j <= 4; ++j) {
    if (input.length % j == 0) {
      // If the length is divisible by 3 or 4, set the number of divisions to that value
      return divisions = j;
    }
  }
  // If the length is not divisible by 3 or 4, the number of divisions remains 0
  return divisions;
}

int divisionsWithRemainder(String input) {
  int divisions = 0;

  for (var j = 3; j <= 4; ++j) {
    divisions = 4;
    if (input.length % j == 2) {
      return divisions = j;
    }
  }
  return divisions;
}

String spacedDigits(String input) {
  int count = 0;
  String spacedOutput = '';

  if (space(input) == input) {
    for (var i = 0; i < input.length; i++) {
      if (count == divisionsWithRemainder(input)) {
        spacedOutput += ' ';
        count = 0;
      }
      spacedOutput += input[i];
      count += 1;
    }
  } else {
    spacedOutput = space(input);
  }
  return spacedOutput.trim();
}

// This function takes a string input and adds spaces after every n characters, where n
// is the number of divisions calculated by the divisions() function.
String space(String input) {
  int count = 0;
  String spacedOutput = '';

  // Loop through each character in the input string
  for (var i = 0; i < input.length; i++) {
    if (count == divisions(input)) {
      // If the count is equal to the number of divisions, add a space character
      spacedOutput += ' ';
      count = 0;
    }
    // Add the current character to the output string
    spacedOutput += input[i];
    count += 1;
  }
  // Remove any leading or trailing spaces and return the spaced output string
  return spacedOutput.trim();
}
