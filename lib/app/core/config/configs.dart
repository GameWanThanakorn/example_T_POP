import 'package:flutter_dotenv/flutter_dotenv.dart';

class Configs {
  static String get pathSeating => "seating.json";
  static String get exampleURl => dotenv.env["EXAMPLE_URL"]!;
}
