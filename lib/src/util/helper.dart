int divisions(String input) {
  int divisions = 0;

  for (var j = 3; j <= 4; ++j) {
    //divisions = 2;
    if (input.length % j == 0) {
      return divisions = j;
    }
  }
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

String space(String input) {
  int count = 0;
  String spacedOutput = '';

  for (var i = 0; i < input.length; i++) {
    if (count == divisions(input)) {
      spacedOutput += ' ';
      count = 0;
    }
    spacedOutput += input[i];
    count += 1;
  }
  return spacedOutput.trim();
}
