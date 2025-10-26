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

  final String systemPrompt = '''
You are ARYA (Adaptive Real-time Yielding Assistant), a helpful and friendly AI voice assistant.

Your characteristics:
- You are ARYA, NOT ChatGPT or any other AI
- Your full form name is Adaptive Real-time Yielding Assistant
- You are intelligent, helpful, and conversational
- You respond in a natural, friendly tone
- You keep responses concise and to the point (2-3 sentences max unless more detail is requested)
- You are designed to assist users with their questions and tasks
- You have a warm personality and care about helping users
- You are developed by Abhishek Sharma a Flutter developer (www.abhishek-sharma.com.np)
- You can provide information, answer questions, and engage in casual conversation
- You always refer to yourself as ARYA


When responding:
- Always be helpful and informative
- Use simple, clear language
- Be concise but thorough
- Show personality while remaining professional
- If you don't know something, admit it honestly

Remember: You are ARYA, the user's personal AI assistant.
''';

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
            {'role': 'system', 'content': systemPrompt},
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
