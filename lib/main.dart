import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const LearnChineseApp());
}

const String coverImage =
    '55A50A20-27AF-491F-B737-712C4A461847.png';

const String readingImage =
    '9869CB58-6C3C-4D8F-8693-CB3BF04B0F62.png';

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
      body: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const StudyPage(),
            ),
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              coverImage,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0x33000000),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(22),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: 0.42,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Text(
                      '轻触进入学习 · Toca para empezar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== 学习页 ====================

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

  final List<Map<String, String>> poemLines = const [
    {
      'zh': '明月几时有？',
      'es': '¿Cuándo apareció la luna brillante?',
    },
    {
      'zh': '把酒问青天。',
      'es': 'Alzo mi copa y pregunto al cielo.',
    },
    {
      'zh': '不知天上宫阙，今夕是何年。',
      'es':
          'No sé qué año será esta noche en el palacio celestial.',
    },
    {
      'zh': '我欲乘风归去，又恐琼楼玉宇，高处不胜寒。',
      'es':
          'Quisiera volver con el viento, pero temo el frío de los palacios celestiales.',
    },
    {
      'zh': '起舞弄清影，何似在人间。',
      'es':
          'Bailo con mi sombra clara; nada se compara con el mundo humano.',
    },
    {
      'zh': '转朱阁，低绮户，照无眠。',
      'es':
          'La luna gira sobre el pabellón rojo, baja hasta la ventana y alumbra a quien no duerme.',
    },
    {
      'zh': '不应有恨，何事长向别时圆？',
      'es':
          'No debería guardar rencor; ¿por qué está siempre llena cuando estamos separados?',
    },
    {
      'zh': '人有悲欢离合，月有阴晴圆缺，此事古难全。',
      'es':
          'Las personas conocen alegría y tristeza, encuentros y despedidas; la luna crece y mengua.',
    },
    {
      'zh': '但愿人长久，千里共婵娟。',
      'es':
          'Deseo que vivamos muchos años y compartamos la belleza de la luna aunque estemos lejos.',
    },
  ];

  Future<void> speakLine(
    String chinese,
    String spanish,
  ) async {
    await flutterTts.stop();
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            16,
            6,
            16,
            28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '苏轼 · Su Shi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 16),

              Card(
                elevation: 0,
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            const ReadingPage(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 92,
                        child: Image.asset(
                          readingImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Expanded(
                        child: ListTile(
                          title: Text(
                            '阅读',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle: Text(
                            'Lectura · 全词朗读',
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing:
                              Icon(Icons.chevron_right),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                '逐句听 · Escucha frase por frase',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              ...poemLines.map(
                (line) => Card(
                  elevation: 0,
                  margin:
                      const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.fromLTRB(
                      14,
                      6,
                      6,
                      6,
                    ),
                    title: Text(
                      line['zh']!,
                      style:
                          const TextStyle(fontSize: 16),
                    ),
                    subtitle: Padding(
                      padding:
                          const EdgeInsets.only(top: 4),
                      child: Text(
                        line['es']!,
                        style:
                            const TextStyle(fontSize: 12),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.volume_up_rounded,
                      ),
                      onPressed: () {
                        speakLine(
                          line['zh']!,
                          line['es']!,
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                '填空练习 · Completa',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Text(
                        '明月几时有？',
                        style: TextStyle(fontSize: 17),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        '把酒问 ${selectedAnswer ?? '____'}。',
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 14),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
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
}

// ==================== 全词阅读页 ====================

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() =>
      _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage>
    with SingleTickerProviderStateMixin {
  final FlutterTts flutterTts = FlutterTts();

  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<Offset> moveAnimation;

  final String poem =
      '明月几时有？\n'
      '把酒问青天。\n'
      '不知天上宫阙，今夕是何年。\n'
      '我欲乘风归去，又恐琼楼玉宇，\n'
      '高处不胜寒。\n'
      '起舞弄清影，何似在人间。\n\n'
      '转朱阁，低绮户，照无眠。\n'
      '不应有恨，何事长向别时圆？\n'
      '人有悲欢离合，月有阴晴圆缺，\n'
      '此事古难全。\n'
      '但愿人长久，千里共婵娟。';

  int visibleCharacters = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 35),
    );

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.12,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    moveAnimation = Tween<Offset>(
      begin: const Offset(-0.015, 0),
      end: const Offset(0.025, -0.015),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.repeat(
      reverse: true,
    );

    startReading();
  }

  Future<void> startReading() async {
    await Future.delayed(
      const Duration(milliseconds: 700),
    );

    await flutterTts.stop();
    await flutterTts.setLanguage('zh-CN');
    await flutterTts.setSpeechRate(0.38);
    await flutterTts.awaitSpeakCompletion(true);

    final speaking = flutterTts.speak(
      poem.replaceAll('\n', ' '),
    );

    for (int i = 1; i <= poem.length; i++) {
      if (!mounted) return;

      await Future.delayed(
        const Duration(milliseconds: 300),
      );

      if (mounted) {
        setState(() {
          visibleCharacters = i;
        });
      }
    }

    await speaking;

    if (!mounted) return;

    await Future.delayed(
      const Duration(milliseconds: 1200),
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int count =
        visibleCharacters.clamp(0, poem.length);

    final String shown =
        poem.substring(0, count);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ClipRect(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return SlideTransition(
                  position: moveAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: child,
                  ),
                );
              },
              child: Image.asset(
                readingImage,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x11000000),
                  Color(0x33000000),
                  Color(0xCC000000),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '水调歌头 · 阅读',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),

                const Spacer(),

                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxHeight: 410,
                  ),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(
                      alpha: 0.54,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Text(
                      shown,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.65,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
