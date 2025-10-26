import 'package:arya/services/openai_service.dart';
import 'package:arya/theme/app_theme.dart';
import 'package:arya/widgets/feature_box.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final speechToText = SpeechToText();
  final OpenaiService openaiService = OpenaiService();
  String lastWords = "";
  String? generatedContent;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  Future<void> sendMessageToOpenRouter() async {
    if (lastWords.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final response = await openaiService.chatGPTAPI(lastWords);

    setState(() {
      generatedContent = response;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "A R Y A",
          style: TextStyle(
            color: MyAppTheme.mainFontColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
            fontFamily: 'Cera Pro',
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              iconSize: 45,
              icon: SizedBox(
                width: 35,
                height: 35,
                child: Lottie.asset(
                  'assets/images/Fire.json',
                  fit: BoxFit.contain,
                  repeat: true,
                  animate: true,
                ),
              ),
              onPressed: () {
                debugPrint("Menu button pressed");
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            // Avatar with fire animation
            Stack(
              children: [
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: MyAppTheme.mainFontColor.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Lottie JSON animation behind the avatar
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.9,
                            child: Lottie.asset(
                              'assets/images/Fire.json',
                              fit: BoxFit.contain,
                              repeat: true,
                              animate: true,
                            ),
                          ),
                        ),

                        // Circular avatar on top
                        Positioned(
                          top: 86,
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              'assets/images/arya-final.png',
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Welcome message or Speech Recognition Display
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: speechToText.isListening
                      ? [
                          MyAppTheme.mainFontColor.withValues(alpha: 0.4),
                          MyAppTheme.secondSuggestionBoxColor.withValues(
                            alpha: 0.3,
                          ),
                        ]
                      : [
                          MyAppTheme.firstSuggestionBoxColor.withValues(
                            alpha: 0.3,
                          ),
                          MyAppTheme.secondSuggestionBoxColor.withValues(
                            alpha: 0.2,
                          ),
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: speechToText.isListening
                      ? MyAppTheme.mainFontColor
                      : MyAppTheme.borderColor,
                  width: speechToText.isListening ? 2.0 : 1.5,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: MyAppTheme.mainFontColor.withValues(
                      alpha: speechToText.isListening ? 0.3 : 0.1,
                    ),
                    blurRadius: speechToText.isListening ? 20 : 10,
                    spreadRadius: speechToText.isListening ? 4 : 2,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  if (speechToText.isListening)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          color: MyAppTheme.mainFontColor,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Listening...",
                          style: TextStyle(
                            color: MyAppTheme.mainFontColor,
                            fontSize: 14,
                            fontFamily: 'Cera Pro',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  if (speechToText.isListening) SizedBox(height: 8),
                  Text(
                    lastWords.isEmpty
                        ? "Hello! I am ARYA, your personal AI assistant. How can I help you today?"
                        : lastWords,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MyAppTheme.mainFontColor,
                      fontSize: 16,
                      fontFamily: 'Cera Pro',
                      height: 1.4,
                      fontWeight: lastWords.isEmpty
                          ? FontWeight.normal
                          : FontWeight.w600,
                    ),
                  ),
                  if (lastWords.isNotEmpty && !speechToText.isListening)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ElevatedButton.icon(
                        onPressed: isLoading ? null : sendMessageToOpenRouter,
                        icon: isLoading
                            ? SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(Icons.send, size: 18),
                        label: Text(
                          isLoading ? 'Processing...' : 'Send to AI',
                          style: TextStyle(
                            fontFamily: 'Cera Pro',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyAppTheme.mainFontColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // AI Response Section
            if (generatedContent != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                margin: EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyAppTheme.thirdSuggestionBoxColor.withValues(alpha: 0.3),
                      MyAppTheme.firstSuggestionBoxColor.withValues(alpha: 0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                    color: MyAppTheme.mainFontColor.withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: MyAppTheme.mainFontColor.withValues(alpha: 0.15),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          color: MyAppTheme.mainFontColor,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "AI Response:",
                          style: TextStyle(
                            color: MyAppTheme.mainFontColor,
                            fontSize: 14,
                            fontFamily: 'Cera Pro',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      generatedContent!,
                      style: TextStyle(
                        color: MyAppTheme.mainFontColor,
                        fontSize: 15,
                        fontFamily: 'Cera Pro',
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

            SizedBox(height: 30),

            // Features header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      color: MyAppTheme.mainFontColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Features",
                    style: TextStyle(
                      color: MyAppTheme.mainFontColor,
                      fontSize: 20,
                      fontFamily: 'Cera Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            //features list
            Column(
              children: [
                MyFeatureBox(
                  color: MyAppTheme.firstSuggestionBoxColor,
                  headerText: 'ChatGPT Integration',
                  descriptionText:
                      'Integrate ChatGPT into your applications seamlessly.',
                  icon: Icons.chat_bubble_outline,
                ),
                MyFeatureBox(
                  color: MyAppTheme.secondSuggestionBoxColor,
                  headerText: 'Smart Voice Assistant',
                  descriptionText:
                      'Interact with ARYA using natural language voice commands.',
                  icon: Icons.mic_outlined,
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: MyAppTheme.mainFontColor.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 3,
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () async {
            debugPrint("Floating Action Button Pressed");
            if (await speechToText.hasPermission &&
                speechToText.isNotListening) {
              await startListening();
            } else if (speechToText.isListening) {
              await stopListening();
            } else {
              initSpeechToText();
            }
          },
          backgroundColor: MyAppTheme.mainFontColor,
          elevation: 0,
          child: const Icon(
            Icons.keyboard_voice,
            color: MyAppTheme.whiteColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
