import 'package:http/http.dart' as http;

String url = 'http://numbersapi.com/random/math';

Future<String> retrieveNumberFact() async {
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200) return response.body;

  return '-';
}