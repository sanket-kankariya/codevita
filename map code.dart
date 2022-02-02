main() {
  myProgram();
}

List a = [
  ["A", "S", "L", "D"],
  ["T", "R", "W", "R"],
  ["R", "M", "S", "R"],
  ["W", "R", "R", "M"],
];

void myProgram() {
  List<int>? currentRoute = [0, 0];
  List<int>? previousRoute = [99, 99];

  int y = 0;
  while (y < 4) {
    currentRoute = findNextR(
        currentRoute![0], currentRoute[1], previousRoute![0], previousRoute[1]);
    print("current " + currentRoute.toString());
    if (currentRoute == null) {
      print("Destination");
      // y = false;
      // break;
    }
    printHurdles(currentRoute![0], currentRoute[1]);
    previousRoute = currentRoute;
    print("previous " + previousRoute.toString());
    y++;
  }
}

List<int>? findNextR(int x, y, u, w) {
  List<List<int>> checker = [
    [-1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
  ];
  for (int i = 0; i < 8; i++) {
    int r = x + checker[i][0];
    int s = x + checker[i][1];
    if (r != -1 && s != -1 && r != u && s != w) {
      if (a[r][s] == "R") {
        return [r, s];
      }
      if (a[r][s] == "D") {
        return null;
      }
    }
  }
  return [];
}

void printHurdles(int x, int y) {
  List<List<int>> checker = [
    [-1, 0],
    [-1, 1],
    [0, 1],
    [1, 1],
    [1, 0],
    [1, -1],
    [0, -1],
    [-1, -1],
  ];
  for (int i = 0; i < 8; i++) {
    int r = x + checker[i][0];
    int s = x + checker[i][1];
    if (r != -1 && s != -1) {
      if (a[r][s] == "S" ||
          a[r][s] == "L" ||
          a[r][s] == "W" ||
          a[r][s] == "T") {
        print(a[r][s] + "\t");
      }
    }
  }
}
