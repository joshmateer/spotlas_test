import 'package:flutter/material.dart';

class sizeGuide with ChangeNotifier {
  double screenHeight;
  sizeGuide(this.screenHeight);

  double getXXXS() {
    if (screenHeight >= 926) {
      return 3;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 2;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 1;
    }
    return 2;
  }

  double getXXS() {
    if (screenHeight >= 926) {
      return 6;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 4;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 2;
    }
    return 4;
  }

  double getXS() {
    if (screenHeight >= 926) {
      return 12;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 8;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 4;
    }
    return 8;
  }

  double getS() {
    if (screenHeight >= 926) {
      return 16;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 12;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 8;
    }
    return 12;
  }

  double getM() {
    if (screenHeight >= 926) {
      return 24;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 16;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 12;
    }
    return 16;
  }

  double getL() {
    if (screenHeight >= 926) {
      return 32;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 24;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 16;
    }
    return 24;
  }

  double getXL() {
    if (screenHeight >= 926) {
      return 40;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 32;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 24;
    }
    return 32;
  }

  double getXXL() {
    if (screenHeight >= 926) {
      return 56;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 48;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 32;
    }
    return 48;
  }

  double getXXXL() {
    if (screenHeight >= 926) {
      return 80;
    } else if (screenHeight >= 860 && screenHeight < 926) {
      return 64;
    } else if (screenHeight >= 667 && screenHeight < 860) {
      return 48;
    }
    return 64;
  }
}
