import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final openRouterAPIKey = dotenv.env['OPENROUTER_API_KEY'];
final siteUrl =
    dotenv.env['SITE_URL'] ?? 'https://github.com/4bhisheksharma/A.R.Y.A';
final siteName = dotenv.env['SITE_NAME'] ?? 'A.R.Y.A';

class OpenaiService {
  final String baseUrl = 'https://openrouter.ai/api/v1';
  final String model = 'openai/gpt-4o-mini-2024-07-18';

  Future<String?> chatGPTAPI(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openRouterAPIKey',
          'HTTP-Referer': siteUrl,
          'X-Title': siteName,
        },
        body: jsonEncode({
          'model': model,
          'messages': [
            {'role': 'user', 'content': prompt},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        return content;
      } else {
        print('Error: ${response.statusCode}');
        print('Response: ${response.body}');
        return 'Sorry, I encountered an error. Please try again.';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Sorry, something went wrong. Please check your connection.';
    }
  }
}
