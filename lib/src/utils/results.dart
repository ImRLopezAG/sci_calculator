import 'dart:math' as math;

class Results {
  static double add(double x, double y) => x + y;

  static double subtract(double x, double y) => x - y;

  static double multiply(double x, double y) => x * y;

  static double divide(double x, double y) => x / y;

  static double remainder(double x, double y) => x % y;

  static double sin(double x) => math.sin(x);

  static double cos(double x) => math.cos(x);

  static double tan(double x) => math.tan(x);

  static double asin(double x) => math.asin(x);

  static double acos(double x) => math.acos(x);

  static double atan(double x) => math.atan(x);

  static double log(double x) => math.log(x);

  static double ln(double x) => math.log(x) / math.log(math.e);

  static double sqrt(double x) => math.sqrt(x);

  static double pow(double x, double y) => math.pow(x, y).toDouble();

  static double factorial(double x) {
    if (x == 0) return 1;
    return x * factorial(x - 1);
  }

  static double calculate(String text) {
    text = text.replaceAll(' ', '');
    RegExp exp = RegExp(
        r'(\d+\.?\d*)([-+x/]|(?:sin|cos|tan|asin|acos|atan|log|ln|√))(\d+\.?\d*)');
    while (text.contains(exp)) {
      Match? match = exp.firstMatch(text);
      if (match != null) {
        double num = double.parse(match.group(1)!);
        double opr = double.parse(match.group(3)!);
        String operator = match.group(2)!;
        double result;
        switch (operator) {
          case '+':
            result = add(num, opr);
            break;
          case '-':
            result = subtract(num, opr);
            break;
          case 'x':
            result = multiply(num, opr);
            break;
          case '/':
            result = divide(num, opr);
            break;
          case '%':
            result = remainder(num, opr);
            break;
          case '^':
            result = pow(num, opr);
            break;
          case 'sin':
            result = sin(num);
            break;
          case 'cos':
            result = cos(num);
            break;
          case 'tan':
            result = tan(num);
            break;
          case 'asin':
            result = asin(num);
            break;
          case 'acos':
            result = acos(num);
            break;
          case 'atan':
            result = atan(num);
            break;
          case 'log':
            result = log(num);
            break;
          case 'ln':
            result = ln(num);
            break;
          case 'sqrt':
            result = sqrt(num);
            break;
          default:
            throw Exception("Invalid operator");
        }
        text = text.replaceFirst(match.group(0)!, result.toStringAsFixed(2));
      }
    }
    return double.parse(text);
  }

  static double answer = 0;
}
