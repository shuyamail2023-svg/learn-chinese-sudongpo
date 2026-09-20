import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const LearnChineseApp());
}

class LearnChineseApp extends StatelessWidget {
  const LearnChineseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '学中文 · 苏东坡',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF8B5E3C),
        scaffoldBackgroundColor: const Color(0xFFF7F1E7),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F1E7),
        centerTitle: true,
        title: const Text(
          '学中文 · 苏东坡',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              const Text(
                '跟着苏东坡学中文',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                '读诗 · 听诗 · 填空 · 学中文',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Text(
                        '水调歌头',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        '苏轼',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        '明月几时有？\n'
                        '把酒问青天。\n'
                        '不知天上宫阙，\n'
                        '今夕是何年。'
                        '我欲乘风归去，\n'
                        '又恐琼楼玉宇，\n'
                        '高处不胜寒。\n'
                        '起舞弄清影，\n'
                        '何似在人间。',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          height: 1.8,
                        ),
                      ),

                      const SizedBox(height: 24),

                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StudyPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.school),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text(
                              '开始学习',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  String? selectedAnswer;
  bool checked = false;

  final String correctAnswer = '青天';
  final FlutterTts flutterTts = FlutterTts();
  Future<void> speakPoem() async {
  await flutterTts.setLanguage('zh-CN');
  await flutterTts.setSpeechRate(0.45);
  await flutterTts.speak(
    '明月几时有？把酒问青天。不知天上宫阙，今夕是何年。',
  );
}
  void checkAnswer() {
    setState(() {
      checked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool correct =
        checked && selectedAnswer == correctAnswer;

    return Scaffold(
      appBar: AppBar(
        title: const Text('水调歌头 · 诗词填空'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '请选出正确的词语',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 28),
ElevatedButton.icon(
  onPressed: speakPoem,
  icon: const Icon(Icons.volume_up),
  label: const Text('🔊 听 · 慢速朗读'),
),

const SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text(
                        '明月几时有？',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '把酒问 ${selectedAnswer ?? '____'}。',
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ...['青天', '明月', '东风'].map(
                (answer) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        selectedAnswer = answer;
                        checked = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        answer,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              FilledButton(
                onPressed:
                    selectedAnswer == null ? null : checkAnswer,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    '检查答案',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              if (checked) ...[
                const SizedBox(height: 20),
                Text(
                  correct
                      ? '✓ 回答正确！“把酒问青天。”'
                      : '再想一想。正确答案是“青天”。',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: correct ? Colors.green : Colors.red,
                  ),
                ),
              ],

              const SizedBox(height: 28),

              const Card(
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '今日学习',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '明月：the bright moon\n'
                        '把酒：举起酒杯\n'
                        '青天：the blue sky / heaven',
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
