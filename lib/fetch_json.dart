import 'dart:convert';

import 'package:booksapp/data/people_data.dart';
import 'package:http/http.dart' as http;

class SearchResults {
  Future<PeopleData> fetchSearchResults() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/f3feef1c-9bfa-43fd-b2a0-bbe9abadb4f6'));

    if (response.statusCode == 200) {
      if (jsonDecode(response.body).containsKey('clients')) {
        return PeopleData.fromJson(jsonDecode(response.body)['clients']);
      } else {
        throw Exception("Message not found");
      }
    } else {
      throw Exception("Failed to get response from API");
    }
  }
}
