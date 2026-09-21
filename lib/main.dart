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
        scaffoldBackgroundColor: const Color(0xFFF8F3EA),
      ),
      home: const HomePage(),
    );
  }
}

// ==================================================
// 首页
// ==================================================

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
              builder: (_) => const PoemSelectionPage(),
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
                    Color(0x66000000),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.42),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Text(
                      '点击进入 · Toca para entrar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
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

// ==================================================
// 选诗页面
// ==================================================
class PoemSelectionPage extends StatelessWidget {
  const PoemSelectionPage({super.key});

  static const List<Map<String, String>> poems = [
    {
      'title': '水调歌头·明月几时有',
      'es': 'Preludio del agua · ¿Cuándo apareció la luna?',
    },
    {
      'title': '念奴娇·赤壁怀古',
      'es': 'Recuerdos del Acantilado Rojo',
    },
    {
      'title': '定风波·莫听穿林打叶声',
      'es': 'Calmando el viento y las olas',
    },
    {
      'title': '江城子·密州出猎',
      'es': 'La cacería de Mizhou',
    },
    {
      'title': '江城子·乙卯正月二十日夜记梦',
      'es': 'Un sueño recordado',
    },
    {
      'title': '蝶恋花·春景',
      'es': 'Mariposas enamoradas · Primavera',
    },
    {
      'title': '浣溪沙·游蕲水清泉寺',
      'es': 'Visitando el templo Qingquan',
    },
    {
      'title': '题西林壁',
      'es': 'Escrito en el muro del templo Xilin',
    },
    {
      'title': '饮湖上初晴后雨',
      'es': 'Bebiendo junto al lago después de la lluvia',
    },
    {
      'title': '惠崇春江晚景',
      'es': 'Escena primaveral junto al río',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 54,
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '选诗',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Elegir poema',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: poems.length,
              itemBuilder: (context, index) {
                final poem = poems[index];
                final available = index == 0;

                // 自动根据手机高度平均分配给10首诗
                final itemHeight =
                    (constraints.maxHeight - 6) / poems.length;

                return SizedBox(
                  height: itemHeight,
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 1.5,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: available
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const StudyPage(),
                                ),
                              );
                            }
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFDCC8),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    poem['title']!,
                                    maxLines: 1,
                                    overflow:
                                        TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                          FontWeight.w600,
                                      height: 1.05,
                                    ),
                                  ),

                                  const SizedBox(height: 3),

                                  Text(
                                    poem['es']!,
                                    maxLines: 1,
                                    overflow:
                                        TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 10.5,
                                      color: Colors.black54,
                                      height: 1.05,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(width: 5),

                            Icon(
                              available
                                  ? Icons.chevron_right
                                  : Icons.lock_outline,
                              size: 18,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}


// ==================================================
// 学习页面
// ==================================================

class StudyPage extends StatelessWidget {
  const StudyPage({super.key});

  Widget learningCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String spanish,
    required Color color,
    required Widget page,
  }) {
    return Card(
      elevation: 0,
      color: color,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 20,
          ),
          child: Row(
            children: [
              Icon(icon, size: 34),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      spanish,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 28),
          child: Column(
            children: [
              const Text(
                '《水调歌头》',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                '明月几时有',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Su Shi · 苏轼',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 24),

              learningCard(
                context: context,
                icon: Icons.menu_book_rounded,
                title: '阅读',
                spanish: 'Lectura · 欣赏诗词，动画朗读',
                color: const Color(0xFFF6DED3),
                page: const ReadingPage(),
              ),

              const SizedBox(height: 10),

              learningCard(
                context: context,
                icon: Icons.headphones_rounded,
                title: '跟读',
                spanish: 'Repetición · 逐句朗读，中西对照',
                color: const Color(0xFFDDECEF),
                page: const FollowReadingPage(),
              ),

              const SizedBox(height: 10),

              learningCard(
                context: context,
                icon: Icons.edit_rounded,
                title: '填空练习',
                spanish: 'Completar · 趣味练习，巩固记忆',
                color: const Color(0xFFF9E7CA),
                page: const QuizPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================================================
// 阅读页面
// ==================================================

class ReadingPage extends StatefulWidget {
  const ReadingPage({super.key});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage>
    with SingleTickerProviderStateMixin {
  final FlutterTts tts = FlutterTts();

  late AnimationController controller;
  late Animation<double> scaleAnimation;

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

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.18,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    controller.repeat(reverse: true);

    startReading();
  }

  Future<void> startReading() async {
    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;

    await tts.setLanguage('zh-CN');
    await tts.setSpeechRate(0.38);
    await tts.awaitSpeakCompletion(true);

    tts.speak(poem.replaceAll('\n', ' '));

    for (int i = 1; i <= poem.length; i++) {
      if (!mounted) return;

      await Future.delayed(
        const Duration(milliseconds: 270),
      );

      if (mounted) {
        setState(() {
          visibleCharacters = i;
        });
      }
    }
  }

  @override
  void dispose() {
    tts.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = visibleCharacters.clamp(0, poem.length);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ScaleTransition(
            scale: scaleAnimation,
            child: Image.asset(
              readingImage,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x11000000),
                  Color(0x44000000),
                  Color(0xCC000000),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Column(
                        children: [
                          Text(
                            '阅读',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Lectura',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),

                const Spacer(),

                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 410),
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.56),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Text(
                      poem.substring(0, count),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.65,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================================================
// 跟读页面
// ==================================================

class FollowReadingPage extends StatefulWidget {
  const FollowReadingPage({super.key});

  @override
  State<FollowReadingPage> createState() =>
      _FollowReadingPageState();
}

class _FollowReadingPageState extends State<FollowReadingPage> {
  final FlutterTts tts = FlutterTts();

  final List<Map<String, String>> lines = const [
    {
      'zh': '明月几时有？',
      'py': 'Míng yuè jǐ shí yǒu?',
      'es': '¿Cuándo apareció la luna brillante?',
    },
    {
      'zh': '把酒问青天。',
      'py': 'Bǎ jiǔ wèn qīng tiān.',
      'es': 'Alzo mi copa y pregunto al cielo.',
    },
    {
      'zh': '不知天上宫阙，今夕是何年。',
      'py': 'Bù zhī tiān shàng gōng què, jīn xī shì hé nián.',
      'es': 'No sé qué año será esta noche en el palacio celestial.',
    },
    {
      'zh': '我欲乘风归去，又恐琼楼玉宇，高处不胜寒。',
      'py': 'Wǒ yù chéng fēng guī qù, yòu kǒng qióng lóu yù yǔ, gāo chù bù shèng hán.',
      'es': 'Quisiera volver con el viento, pero temo el frío de los palacios celestiales.',
    },
    {
      'zh': '起舞弄清影，何似在人间。',
      'py': 'Qǐ wǔ nòng qīng yǐng, hé sì zài rén jiān.',
      'es': 'Bailo con mi sombra clara; nada se compara con el mundo humano.',
    },
    {
      'zh': '转朱阁，低绮户，照无眠。',
      'py': 'Zhuǎn zhū gé, dī qǐ hù, zhào wú mián.',
      'es': 'La luna gira sobre el pabellón rojo y alumbra a quien no duerme.',
    },
    {
      'zh': '不应有恨，何事长向别时圆？',
      'py': 'Bù yīng yǒu hèn, hé shì cháng xiàng bié shí yuán?',
      'es': '¿Por qué está siempre llena cuando estamos separados?',
    },
    {
      'zh': '人有悲欢离合，月有阴晴圆缺，此事古难全。',
      'py': 'Rén yǒu bēi huān lí hé, yuè yǒu yīn qíng yuán quē, cǐ shì gǔ nán quán.',
      'es': 'Las personas tienen encuentros y despedidas; la luna crece y mengua.',
    },
    {
      'zh': '但愿人长久，千里共婵娟。',
      'py': 'Dàn yuàn rén cháng jiǔ, qiān lǐ gòng chán juān.',
      'es': 'Deseo que vivamos muchos años y compartamos la misma luna.',
    },
  ];

Future<void> speak(String text) async {
  await tts.stop();
  await tts.setLanguage('zh-CN');
  await tts.setSpeechRate(0.38);
  await tts.speak(text);
}
  @override
  void dispose() {
    tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '跟读',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Repetición',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(
            16,
            10,
            16,
            24,
          ),
          itemCount: lines.length,
          separatorBuilder: (_, __) =>
              const Divider(height: 18),
          itemBuilder: (context, index) {
            final line = lines[index];

            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          line['zh']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          line['py']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black45,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          line['es']!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.volume_up_rounded,
                    ),
                    onPressed: () {
                      speak(line['zh']!);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
// ==================================================
// 填空页面
// ==================================================

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  String? selectedAnswer;
  bool answeredCorrectly = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '明月 ____ 时有？',
      'es': 'Completa la palabra que falta.',
      'answer': '几',
      'choices': ['几', '何', '已'],
    },
    {
      'question': '把酒问 ____ 。',
      'es': 'Completa el verso.',
      'answer': '青天',
      'choices': ['青天', '明月', '东风'],
    },
    {
      'question': '不知天上 ____ 。',
      'es': 'Completa el verso.',
      'answer': '宫阙',
      'choices': ['宫阙', '人间', '明月'],
    },
    {
      'question': '今夕是 ____ 。',
      'es': 'Completa el verso.',
      'answer': '何年',
      'choices': ['何年', '何处', '何人'],
    },
    {
      'question': '我欲乘 ____ 归去。',
      'es': 'Completa el verso.',
      'answer': '风',
      'choices': ['风', '月', '云'],
    },
    {
      'question': '高处不胜 ____ 。',
      'es': 'Completa el verso.',
      'answer': '寒',
      'choices': ['寒', '暖', '风'],
    },
    {
      'question': '何似在 ____ 。',
      'es': 'Completa el verso.',
      'answer': '人间',
      'choices': ['人间', '天上', '梦中'],
    },
    {
      'question': '月有阴晴 ____ 。',
      'es': 'Completa el verso.',
      'answer': '圆缺',
      'choices': ['圆缺', '离合', '悲欢'],
    },
    {
      'question': '千里共 ____ 。',
      'es': 'Completa最后一句。',
      'answer': '婵娟',
      'choices': ['婵娟', '明月', '清影'],
    },
  ];

  Future<void> chooseAnswer(String answer) async {
    final correct =
        answer == questions[questionIndex]['answer'];

    setState(() {
      selectedAnswer = answer;
      answeredCorrectly = correct;
    });

    if (!correct) {
      return;
    }

    await Future.delayed(
      const Duration(milliseconds: 800),
    );

    if (!mounted) return;

    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswer = null;
        answeredCorrectly = false;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const CompletionPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    final progress = (questionIndex + 1) / questions.length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              '填空练习',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Completar',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Text(
                '${questionIndex + 1}/${questions.length}',
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ),
        ],
      ),
      body: Container(
  decoration: const BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
        '16F1DCC9-0A88-4597-ADC5-1B7B5EBE3A65.png',
      ),
      fit: BoxFit.cover,
      opacity: 0.16,
    ),
  ),
  child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                minHeight: 7,
                borderRadius: BorderRadius.circular(10),
              ),

              const Spacer(),

              Text(
                question['question'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                question['es'],
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 38),

              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children:
                    (question['choices'] as List<String>).map(
                  (answer) {
                    final selected =
                        selectedAnswer == answer;

                    return SizedBox(
                      width: 92,
                      height: 54,
                      child: FilledButton.tonal(
                        onPressed: answeredCorrectly
                            ? null
                            : () => chooseAnswer(answer),
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              selected && answeredCorrectly
                                  ? Colors.green.shade200
                                  : null,
                        ),
                        child: Text(
                          answer,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),

              const SizedBox(height: 28),

              if (selectedAnswer != null)
                Text(
                  answeredCorrectly
                      ? '✓ 答对了！ · ¡Correcto!'
                      : '再试一次 · Inténtalo de nuevo',
                  style: TextStyle(
                    color: answeredCorrectly
                        ? Colors.green
                        : Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const Spacer(),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

// ==================================================
// 完成页面
// ==================================================

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key});

  void goToPoemSelection(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const PoemSelectionPage(),
      ),
      (route) => route.isFirst,
    );
  }

  void goBackToStudy(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => const StudyPage(),
      ),
      (route) => route.isFirst,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            '92DF6262-13E6-4D92-B27E-F2DF355D8C54.png',
            fit: BoxFit.cover,
          ),

          Container(
            color: Colors.indigo.withValues(alpha: 0.58),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
              child: Column(
                children: [
                  const Text(
                    '🎆   ✨   🎆',
                    style: TextStyle(fontSize: 30),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    '太棒了！',
                    style: TextStyle(
                      color: Color(0xFFFFE59A),
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    '¡Excelente!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    '你已经完成《水调歌头》的全部练习！',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'Has completado todos los ejercicios.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '⭐',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '正确率',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '100%',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 75,
                          child: VerticalDivider(),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '🕒',
                                style: TextStyle(fontSize: 25),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '完成',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '完成！',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        goToPoemSelection(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF287ED8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Text(
                        '再学一首  ·  Elegir otro poema',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  TextButton(
                    onPressed: () {
                      goBackToStudy(context);
                    },
                    child: const Text(
                      '返回学习页面  ·  Volver al estudio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
