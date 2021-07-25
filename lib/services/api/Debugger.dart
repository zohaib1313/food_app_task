import 'package:logger/logger.dart';

class Debugger {
  static final logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null,
  );

  static void printLog(String message) {
    logger.d("\n" + message);
  }
}
