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
      title: '跟着苏东坡学中文',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF8B5E3C),
        scaffoldBackgroundColor: const Color(0xFFF7F1E7),
      ),
      home: const HomePage(),
    );
  }
}

// ==================== 首页 ====================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const StudyPage(),
              ),
            );
          },
          child: SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 24,
              ),
              child: Column(
                children: [
                  const Spacer(),

                  Container(
                    width: 210,
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9DCC7),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Icon(
                      Icons.history_edu_rounded,
                      size: 120,
                      color: Color(0xFF8B5E3C),
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    '跟着苏东坡学中文',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Aprende chino con Su Dongpo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),

                  const Spacer(),

                  const Text(
                    '轻触屏幕开始 · Toca para empezar',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ==================== 学习页面 ====================

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  final FlutterTts flutterTts = FlutterTts();

  String? selectedAnswer;
  bool checked = false;

  final String correctAnswer = '青天';

  Future<void> speak(
    String text, {
    String language = 'zh-CN',
  }) async {
    await flutterTts.stop();
    await flutterTts.setLanguage(language);

    if (language == 'zh-CN') {
      await flutterTts.setSpeechRate(0.42);
    } else {
      await flutterTts.setSpeechRate(0.45);
    }

    await flutterTts.speak(text);
  }

  Future<void> speakLine(
    String chinese,
    String spanish,
  ) async {
    await flutterTts.awaitSpeakCompletion(true);

    await flutterTts.setLanguage('zh-CN');
    await flutterTts.setSpeechRate(0.42);
    await flutterTts.speak(chinese);

    await flutterTts.setLanguage('es-ES');
    await flutterTts.setSpeechRate(0.45);
    await flutterTts.speak(spanish);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool correct =
        checked && selectedAnswer == correctAnswer;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '水调歌头',
          style: TextStyle(fontSize: 18),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            18,
            8,
            18,
            28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '苏轼 · Su Shi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 18),

              menuCard(
                icon: Icons.menu_book_rounded,
                title: '阅读',
                subtitle: 'Lectura',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ReadingPage(),
                    ),
                  );
                },
              ),

              menuCard(
                icon: Icons.record_voice_over_rounded,
                title: '跟读',
                subtitle: 'Escuchar y repetir',
                onTap: () {
                  speakLine(
                    '明月几时有？',
                    '¿Cuándo hay luna brillante?',
                  );
                },
              ),

              const SizedBox(height: 10),

              const Text(
                '逐句听 · Escucha frase por frase',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              lineTile(
                '明月几时有？',
                '¿Cuándo hay luna brillante?',
              ),

              lineTile(
                '把酒问青天。',
                'Alzo mi copa y pregunto al cielo.',
              ),

              lineTile(
                '不知天上宫阙，今夕是何年。',
                'No sé qué año será esta noche en el palacio celestial.',
              ),

              const SizedBox(height: 20),

              const Text(
                '填空练习 · Completa',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Text(
                        '明月几时有？',
                        style: TextStyle(fontSize: 18),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '把酒问 ${selectedAnswer ?? '____'}。',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Wrap(
                        spacing: 8,
                        children: [
                          '青天',
                          '明月',
                          '东风',
                        ].map((answer) {
                          return ChoiceChip(
                            label: Text(answer),
                            selected:
                                selectedAnswer == answer,
                            onSelected: (_) {
                              setState(() {
                                selectedAnswer = answer;
                                checked = false;
                              });
                            },
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 14),

                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed:
                              selectedAnswer == null
                                  ? null
                                  : () {
                                      setState(() {
                                        checked = true;
                                      });
                                    },
                          child: const Text(
                            '检查答案 · Comprobar',
                          ),
                        ),
                      ),

                      if (checked) ...[
                        const SizedBox(height: 10),

                        Text(
                          correct
                              ? '👏 回答正确！¡Muy bien!'
                              : '再试一次 · Inténtalo de nuevo',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: correct
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
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

  Widget menuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget lineTile(
    String chinese,
    String spanish,
  ) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        dense: true,
        title: Text(
          chinese,
          style: const TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          spanish,
          style: const TextStyle(fontSize: 12),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.volume_up_rounded,
          ),
          onPressed: () {
            speakLine(chinese, spanish);
          },
        ),
      ),
    );
  }
}

// ==================== 阅读页面 ====================

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() =>
      _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  final FlutterTts flutterTts = FlutterTts();

  final String poem =
      '明月几时有？\n'
      '把酒问青天。\n'
      '不知天上宫阙，\n'
      '今夕是何年。';

  int visibleCharacters = 0;

  @override
  void initState() {
    super.initState();
    startReading();
  }

  Future<void> startReading() async {
    await flutterTts.setLanguage('zh-CN');
    await flutterTts.setSpeechRate(0.40);

    flutterTts.speak(
      poem.replaceAll('\n', ''),
    );

    for (
      int i = 1;
      i <= poem.length;
      i++
    ) {
      if (!mounted) return;

      await Future.delayed(
        const Duration(milliseconds: 260),
      );

      if (mounted) {
        setState(() {
          visibleCharacters = i;
        });
      }
    }

    await Future.delayed(
      const Duration(milliseconds: 900),
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int count =
        visibleCharacters.clamp(
          0,
          poem.length,
        );

    final String shown =
        poem.substring(0, count);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),

                  const Spacer(),

                  const Text(
                    '阅读 · Lectura',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(width: 48),
                ],
              ),

              const Spacer(),

              const Icon(
                Icons.history_edu_rounded,
                size: 100,
                color: Color(0xFF8B5E3C),
              ),

              const SizedBox(height: 24),

              Text(
                shown,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  height: 1.8,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              const Text(
                '文字会随着朗读逐字出现',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
