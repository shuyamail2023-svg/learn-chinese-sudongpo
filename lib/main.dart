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
                final available = index <= 6;

                // 自根据手机高度平均分配给10首诗
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
                                      StudyPage(poemIndex: index),
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
  final int poemIndex;

  const StudyPage({super.key, required this.poemIndex});


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
Text(
  poemIndex == 0
    ? '《水调歌头》'
    : poemIndex == 1
        ? '《念奴娇·赤壁怀古》'
        : poemIndex == 2
            ? '《定风波·莫听穿林打叶声》'
            : poemIndex == 3
                ? '《江城子·密州出猎》'
                : poemIndex == 4
                    ? '《江城子·乙卯正月二十日夜记梦》'
                    : poemIndex == 5
                        ? '《蝶恋花·春景》'
                        : '《浣溪沙·游蕲水清泉寺》',
  style: const TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
  ),
),
              const SizedBox(height: 4),
             Text(
  poemIndex == 0
    ? '明月几时有'
    : poemIndex == 1
        ? '大江东去，浪淘尽'
        : poemIndex == 2
            ? '莫听穿林打叶声'
            : poemIndex == 3
    ? '老夫聊发少年狂'
    : poemIndex == 4
    ? '十年生死两茫茫'
    : poemIndex == 5
        ? '花褪残红青杏小'
        : '山下兰芽短浸溪',
  style: const TextStyle(
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
                page: ReadingPage(poemIndex: poemIndex),
              ),

              const SizedBox(height: 10),

              learningCard(
                context: context,
                icon: Icons.headphones_rounded,
                title: '跟读',
                spanish: 'Repetición · 逐句朗读，中西对照',
                color: const Color(0xFFDDECEF),
                page: FollowReadingPage(poemIndex: poemIndex),
              ),

              const SizedBox(height: 10),

              learningCard(
                context: context,
                icon: Icons.edit_rounded,
                title: '填空练习',
                spanish: 'Completar · 趣味练习，巩固记忆',
                color: const Color(0xFFF9E7CA),
                page: QuizPage(poemIndex: poemIndex),
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
  final int poemIndex;

  const ReadingPage({super.key, required this.poemIndex});

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage>
    with SingleTickerProviderStateMixin {
  final FlutterTts tts = FlutterTts();

  late AnimationController controller;
  late Animation<double> scaleAnimation;
late final String poem = widget.poemIndex == 0
    ? '明月几时有？ \n'
      '把酒问青天。 \n'
      '不知天上宫阙，今夕是何年。 \n'
      '我欲乘风归去，又恐琼楼玉宇， \n'
      '高处不胜寒。 \n'
      '起舞弄清影，何似在人间。 \n\n'
      '转朱阁，低绮户，照无眠。 \n'
      '不应有恨，何事长向别时圆？ \n'
      '人有悲欢离合，月有阴晴圆缺， \n'
      '此事古难全。 \n'
      '但愿人长久，千里共婵娟。 '
    : widget.poemIndex == 1
        ? '大江东去，浪淘尽，千古风流人物。 \n'
          '故垒西边，人道是，三国周郎赤壁。 \n'
          '乱石穿空，惊涛拍岸，卷起千堆雪。 \n'
          '江山如画，一时多少豪杰。 \n\n'
          '遥想公瑾当年，小乔初嫁了，雄姿英发。 \n'
          '羽扇纶巾，谈笑间，樯橹灰飞烟灭。 \n'
          '故国神游，多情应笑我，早生华发。 \n'
          '人生如梦，一尊还酹江月。 '
        : widget.poemIndex == 2
    ? '莫听穿林打叶声，何妨吟啸且徐行。 \n'
          '竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。 \n\n'
          '料峭春风吹酒醒，微冷，山头斜照却相迎。 \n'
          '回首向来萧瑟处，归去，也无风雨也无晴。 '
    : widget.poemIndex == 3
    ? '老夫聊发少年狂，左牵黄，右擎苍。 \n'
      '锦帽貂裘，千骑卷平冈。 \n'
      '为报倾城随太守，亲射虎，看孙郎。 \n\n'
      '酒酣胸胆尚开张。鬓微霜，又何妨！ \n'
      '持节云中，何日遣冯唐？ \n'
      '会挽雕弓如满月，西北望，射天狼。 '
    : widget.poemIndex == 4
    ? '十年生死两茫茫，不思量，自难忘。 \n'
      '千里孤坟，无处话凄凉。 \n'
      '纵使相逢应不识，尘满面，鬓如霜。 \n\n'
      '夜来幽梦忽还乡，小轩窗，正梳妆。 \n'
      '相顾无言，惟有泪千行。 \n'
      '料得年年肠断处，明月夜，短松冈。 '
    : widget.poemIndex == 5
    ? '花褪残红青杏小。 \n'
      '燕子飞时，绿水人家绕。 \n'
      '枝上柳绵吹又少，天涯何处无芳草。 \n\n'
      '墙里秋千墙外道。 \n'
      '墙外行人，墙里佳人笑。 \n'
      '笑渐不闻声渐悄，多情却被无情恼。 '
    : widget.poemIndex == 6
    ? '山下兰芽短浸溪，松间沙路净无泥，萧萧暮雨子规啼。 \n'
      '谁道人生无再少？门前流水尚能西！休将白发唱黄鸡。'
    : '横看成岭侧成峰，远近高低各不同。 \n'
      '不识庐山真面目，只缘身在此山中。';

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
                    IconButton(
  onPressed: () async {
    await tts.stop();
    await tts.setLanguage('zh-CN');
    await tts.setSpeechRate(0.38);
    await tts.speak(poem.replaceAll('\n', ' '));
  },
  icon: const Icon(
    Icons.volume_up_rounded,
    color: Colors.white,
    size: 28,
  ),
  tooltip: '朗读',
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
  final int poemIndex;

  const FollowReadingPage({
    super.key,
    required this.poemIndex,
  });

  @override
  State<FollowReadingPage> createState() =>
      _FollowReadingPageState();
}

class _FollowReadingPageState extends State<FollowReadingPage> {
  final FlutterTts tts = FlutterTts();

  late final List<Map<String, String>> lines =
    widget.poemIndex == 0
        ? [
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
  ] : widget.poemIndex == 1 ? [
{
  'zh': '大江东去，浪淘尽，千古风流人物。',
  'py': 'Dà jiāng dōng qù, làng táo jìn, qiān gǔ fēng liú rén wù.',
  'es': 'El gran río fluye hacia el este; sus olas se llevan a los grandes personajes de todos los tiempos.',
},
    {
  'zh': '故垒西边，人道是，三国周郎赤壁。',
  'py': 'Gù lěi xī biān, rén dào shì, Sān Guó Zhōu Láng Chì Bì.',
  'es': 'Al oeste de la antigua fortaleza, dicen que está el Acantilado Rojo de Zhou Yu, de la época de los Tres Reinos.',
},
{
  'zh': '乱石穿空，惊涛拍岸，卷起千堆雪。',
  'py': 'Luàn shí chuān kōng, jīng tāo pāi àn, juǎn qǐ qiān duī xuě.',
  'es': 'Rocas escarpadas atraviesan el cielo; olas furiosas golpean la orilla y levantan espuma como mil montones de nieve.',
},
    {
  'zh': '江山如画，一时多少豪杰。',
  'py': 'Jiāng shān rú huà, yī shí duō shǎo háo jié.',
  'es': 'El paisaje parece una pintura; ¡cuántos héroes surgieron en aquella época!',
},
{
  'zh': '遥想公瑾当年，小乔初嫁了，雄姿英发。',
  'py': 'Yáo xiǎng Gōng Jǐn dāng nián, Xiǎo Qiáo chū jià liǎo, xióng zī yīng fā.',
  'es': 'Imagino a Gongjin en aquellos años, cuando acababa de casarse con Xiao Qiao, gallardo y lleno de vigor.',
},
    {
  'zh': '羽扇纶巾，谈笑间，樯橹灰飞烟灭。',
  'py': 'Yǔ shàn guān jīn, tán xiào jiān, qiáng lǔ huī fēi yān miè.',
  'es': 'Con abanico de plumas y tocado de seda, entre risas, las naves enemigas quedaron reducidas a cenizas.',
},
{
  'zh': '故国神游，多情应笑我，早生华发。',
  'py': 'Gù guó shén yóu, duō qíng yīng xiào wǒ, zǎo shēng huá fà.',
  'es': 'Mi espíritu viaja por aquellos antiguos lugares; quizá se rían de mí por ser tan sentimental y haber encanecido tan pronto.',
},
{
  'zh': '人生如梦，一尊还酹江月。',
  'py': 'Rén shēng rú mèng, yī zūn huán lèi jiāng yuè.',
  'es': 'La vida es como un sueño; alzo una copa y la ofrezco a la luna sobre el río.',
},
    ] : widget.poemIndex == 2 ? [
        {
      'zh': '莫听穿林打叶声，何妨吟啸且徐行。',
      'py': 'Mò tīng chuān lín dǎ yè shēng, hé fáng yín xiào qiě xú xíng.',
      'es': 'No escuches el sonido de la lluvia golpeando las hojas; ¿por qué no caminar despacio, cantando con calma?',
    },
    {
      'zh': '竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。',
      'py': 'Zhú zhàng máng xié qīng shèng mǎ, shuí pà? Yī suō yān yǔ rèn píng shēng.',
      'es': 'Con bastón de bambú y sandalias de paja camino más ligero que a caballo. ¿Qué hay que temer? Afronto la lluvia toda mi vida.',
    },
    {
      'zh': '料峭春风吹酒醒，微冷，山头斜照却相迎。',
      'py': 'Liào qiào chūn fēng chuī jiǔ xǐng, wēi lěng, shān tóu xié zhào què xiāng yíng.',
      'es': 'El frío viento de primavera me despierta del vino; siento un poco de frío, pero el sol poniente sobre la montaña viene a recibirme.',
    },
    {
      'zh': '回首向来萧瑟处，归去，也无风雨也无晴。',
      'py': 'Huí shǒu xiàng lái xiāo sè chù, guī qù, yě wú fēng yǔ yě wú qíng.',
      'es': 'Miro hacia atrás al lugar azotado por el viento y la lluvia; regreso: ya no hay tormenta ni cielo despejado.',
    },
  ] : widget.poemIndex == 3 ? [
  {
    'zh': '老夫聊发少年狂，左牵黄，右擎苍。',
    'py': 'Lǎo fū liáo fā shào nián kuáng, zuǒ qiān huáng, yòu qíng cāng.',
    'es': 'Este viejo vuelve a sentir el ímpetu de la juventud: a la izquierda llevo al perro amarillo y a la derecha al azor.',
  },
  {
    'zh': '锦帽貂裘，千骑卷平冈。',
    'py': 'Jǐn mào diāo qiú, qiān qí juǎn píng gāng.',
    'es': 'Con gorro de brocado y abrigo de marta, mil jinetes atraviesan las colinas.',
  },
  {
    'zh': '为报倾城随太守，亲射虎，看孙郎。',
    'py': 'Wèi bào qīng chéng suí tài shǒu, qīn shè hǔ, kàn Sūn Láng.',
    'es': 'Para agradecer a toda la ciudad que sigue al gobernador, cazaré yo mismo al tigre, como lo hizo Sun Lang.',
  },
  {
    'zh': '酒酣胸胆尚开张。鬓微霜，又何妨！',
    'py': 'Jiǔ hān xiōng dǎn shàng kāi zhāng. Bìn wēi shuāng, yòu hé fáng!',
    'es': 'Con el vino, mi ánimo se vuelve aún más audaz. Aunque mis sienes tengan algo de escarcha, ¿qué importa?',
  },
  {
    'zh': '持节云中，何日遣冯唐？',
    'py': 'Chí jié Yún Zhōng, hé rì qiǎn Féng Táng?',
    'es': '¿Cuándo enviarán a Feng Tang con la insignia imperial a Yunzhong?',
  },
  {
    'zh': '会挽雕弓如满月，西北望，射天狼。',
    'py': 'Huì wǎn diāo gōng rú mǎn yuè, xī běi wàng, shè Tiān Láng.',
    'es': 'Tensaré el arco adornado como una luna llena, miraré al noroeste y dispararé hacia la estrella del Lobo Celestial.',
  },
] : widget.poemIndex == 4 ? [
  {
    'zh': '十年生死两茫茫，不思量，自难忘。',
    'py': 'Shí nián shēng sǐ liǎng máng máng, bù sī liáng, zì nán wàng.',
    'es': 'Diez años separan la vida y la muerte; aunque no piense en ti, no puedo olvidarte.',
  },
  {
    'zh': '千里孤坟，无处话凄凉。',
    'py': 'Qiān lǐ gū fén, wú chù huà qī liáng.',
    'es': 'Tu tumba solitaria está a mil li; no hay lugar donde expresar mi tristeza.',
  },
  {
    'zh': '纵使相逢应不识，尘满面，鬓如霜。',
    'py': 'Zòng shǐ xiāng féng yīng bù shí, chén mǎn miàn, bìn rú shuāng.',
    'es': 'Aunque nos encontráramos, quizá no me reconocerías: el rostro cubierto de polvo y las sienes blancas como escarcha.',
  },
  {
    'zh': '夜来幽梦忽还乡，小轩窗，正梳妆。',
    'py': 'Yè lái yōu mèng hū huán xiāng, xiǎo xuān chuāng, zhèng shū zhuāng.',
    'es': 'Anoche, en un sueño, regresé de pronto a mi tierra natal; junto a la pequeña ventana, estabas arreglándote.',
  },
  {
    'zh': '相顾无言，惟有泪千行。',
    'py': 'Xiāng gù wú yán, wéi yǒu lèi qiān háng.',
    'es': 'Nos miramos sin palabras; solo corrían mil líneas de lágrimas.',
  },
  {
    'zh': '料得年年肠断处，明月夜，短松冈。',
    'py': 'Liào dé nián nián cháng duàn chù, míng yuè yè, duǎn sōng gāng.',
    'es': 'Imagino que cada año, donde el corazón se rompe, hay una noche de luna sobre la colina de pequeños pinos.',
  },
] : widget.poemIndex == 5 ? [
  {
    'zh': '花褪残红青杏小。',
    'py': 'Huā tuì cán hóng qīng xìng xiǎo.',
    'es': 'Las flores pierden su rojo y aparecen pequeños albaricoques verdes.',
  },
  {
    'zh': '燕子飞时，绿水人家绕。',
    'py': 'Yàn zi fēi shí, lǜ shuǐ rén jiā rào.',
    'es': 'Cuando vuelan las golondrinas, el agua verde rodea las casas.',
  },
  {
    'zh': '枝上柳绵吹又少，天涯何处无芳草。',
    'py': 'Zhī shàng liǔ mián chuī yòu shǎo, tiān yá hé chù wú fāng cǎo.',
    'es': 'Cada vez queda menos algodón de sauce; en cualquier rincón del mundo hay hierba fragante.',
  },
  {
    'zh': '墙里秋千墙外道。',
    'py': 'Qiáng lǐ qiū qiān qiáng wài dào.',
    'es': 'Dentro del muro hay un columpio; fuera, un camino.',
  },
  {
    'zh': '墙外行人，墙里佳人笑。',
    'py': 'Qiáng wài xíng rén, qiáng lǐ jiā rén xiào.',
    'es': 'Fuera del muro pasa un caminante; dentro ríe una joven.',
  },
  {
    'zh': '笑渐不闻声渐悄，多情却被无情恼。',
    'py': 'Xiào jiàn bù wén shēng jiàn qiǎo, duō qíng què bèi wú qíng nǎo.',
    'es': 'La risa se aleja hasta desaparecer; el enamorado queda afligido por quien no conoce su amor.',
  },
] : widget.poemIndex == 6 ? [
  {
    'zh': '山下兰芽短浸溪，松间沙路净无泥，萧萧暮雨子规啼。',
    'py': 'Shān xià lán yá duǎn jìn xī, sōng jiān shā lù jìng wú ní, xiāo xiāo mù yǔ zǐ guī tí.',
    'es': 'Al pie de la montaña, los brotes de orquídea se acercan al arroyo; el sendero entre los pinos está limpio y sin barro, y bajo la lluvia del atardecer canta el cuco.',
  },
  {
    'zh': '谁道人生无再少？门前流水尚能西！休将白发唱黄鸡。',
    'py': 'Shuí dào rén shēng wú zài shào? Mén qián liú shuǐ shàng néng xī! Xiū jiāng bái fà chàng huáng jī.',
    'es': '¿Quién dice que la vida no puede volver a ser joven? ¡El agua frente a la puerta todavía puede correr hacia el oeste! No lamentes la vejez.',
  },
] : [];

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
  final int poemIndex;

  const QuizPage({
    super.key,
    required this.poemIndex,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  String? selectedAnswer;
  bool answeredCorrectly = false;

  late final List<Map<String, dynamic>> questions =
    widget.poemIndex == 0 ? [
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
  ] : widget.poemIndex == 1 ? [
{
  'question': '大江东去，____，千古风流人物。',
  'es': 'Completa el verso.',
  'answer': '浪淘尽',
  'choices': ['浪淘尽', '卷起雪', '拍岸边'],
},
{
  'question': '故垒西边，人道是，____。',
  'es': 'Completa el verso.',
  'answer': '三国周郎赤壁',
  'choices': ['三国周郎赤壁', '千古风流人物', '一时多少豪杰'],
},
{
  'question': '乱石穿空，惊涛拍岸，____。',
  'es': 'Completa el verso.',
  'answer': '卷起千堆雪',
  'choices': ['卷起千堆雪', '浪淘尽', '江山如画'],
},
  {
  'question': '江山如画，____。',
  'es': 'Completa el verso.',
  'answer': '一时多少豪杰',
  'choices': ['一时多少豪杰', '千古风流人物', '卷起千堆雪'],
},
{
  'question': '遥想公瑾当年，____，雄姿英发。',
  'es': 'Completa el verso.',
  'answer': '小乔初嫁了',
  'choices': ['小乔初嫁了', '羽扇纶巾', '早生华发'],
},
{
  'question': '羽扇纶巾，谈笑间，____。',
  'es': 'Completa el verso.',
  'answer': '樯橹灰飞烟灭',
  'choices': ['樯橹灰飞烟灭', '惊涛拍岸', '一时多少豪杰'],
},
{
  'question': '故国神游，多情应笑我，____。',
  'es': 'Completa el verso.',
  'answer': '早生华发',
  'choices': ['早生华发', '雄姿英发', '千堆雪'],
},
{
  'question': '人生如梦，____。',
  'es': 'Completa el último verso.',
  'answer': '一尊还酹江月',
  'choices': ['一尊还酹江月', '千古风流人物', '江山如画'],
},
] : widget.poemIndex == 2 ? [

{
  'question': '莫听穿林打叶声，____。',
  'es': 'Completa el verso.',
  'answer': '何妨吟啸且徐行',
  'choices': ['何妨吟啸且徐行', '谁怕', '一蓑烟雨任平生'],
},
{
  'question': '竹杖芒鞋轻胜马，____？',
  'es': 'Completa el verso.',
  'answer': '谁怕',
  'choices': ['谁怕', '何妨', '归去'],
},
{
  'question': '谁怕？____。',
  'es': 'Completa el verso.',
  'answer': '一蓑烟雨任平生',
  'choices': ['一蓑烟雨任平生', '山头斜照却相迎', '也无风雨也无晴'],
},
{
  'question': '料峭春风吹酒醒，____。',
  'es': 'Completa el verso.',
  'answer': '微冷',
  'choices': ['微冷', '徐行', '归去'],
},
{
  'question': '微冷，____。',
  'es': 'Completa el verso.',
  'answer': '山头斜照却相迎',
  'choices': ['山头斜照却相迎', '一蓑烟雨任平生', '何妨吟啸且徐行'],
},
{
  'question': '回首向来萧瑟处，____。',
  'es': 'Completa el verso.',
  'answer': '归去',
  'choices': ['归去', '徐行', '谁怕'],
},
{
  'question': '归去，____。',
  'es': 'Completa el verso.',
  'answer': '也无风雨也无晴',
  'choices': ['也无风雨也无晴', '一蓑烟雨任平生', '山头斜照却相迎'],
},
] : widget.poemIndex == 3 ? [
    {
    'question': '老夫聊发少年狂，____，右擎苍。',
    'es': 'Completa el verso.',
    'answer': '左牵黄',
    'choices': ['左牵黄', '右擎苍', '千骑卷平冈'],
  },
  {
    'question': '锦帽貂裘，____。',
    'es': 'Completa el verso.',
    'answer': '千骑卷平冈',
    'choices': ['千骑卷平冈', '亲射虎', '左牵黄'],
  },
  {
    'question': '为报倾城随太守，____，看孙郎。',
    'es': 'Completa el verso.',
    'answer': '亲射虎',
    'choices': ['亲射虎', '射天狼', '右擎苍'],
  },
  {
    'question': '酒酣胸胆尚开张。鬓微霜，____！',
    'es': 'Completa el verso.',
    'answer': '又何妨',
    'choices': ['又何妨', '何日遣冯唐', '看孙郎'],
  },
  {
    'question': '持节云中，____？',
    'es': 'Completa el verso.',
    'answer': '何日遣冯唐',
    'choices': ['何日遣冯唐', '又何妨', '西北望'],
  },
  {
    'question': '会挽雕弓如满月，西北望，____。',
    'es': 'Completa el verso.',
    'answer': '射天狼',
    'choices': ['射天狼', '亲射虎', '千骑卷平冈'],
  },
] : widget.poemIndex == 4 ? [
  {
    'question': '十年生死两茫茫，____，自难忘。',
    'es': 'Completa el verso.',
    'answer': '不思量',
    'choices': ['不思量', '无处话', '惟有泪'],
  },
  {
    'question': '千里孤坟，____。',
    'es': 'Completa el verso.',
    'answer': '无处话凄凉',
    'choices': ['无处话凄凉', '自难忘', '鬓如霜'],
  },
  {
    'question': '纵使相逢应不识，尘满面，____。',
    'es': 'Completa el verso.',
    'answer': '鬓如霜',
    'choices': ['鬓如霜', '泪千行', '短松冈'],
  },
  {
    'question': '夜来幽梦忽还乡，小轩窗，____。',
    'es': 'Completa el verso.',
    'answer': '正梳妆',
    'choices': ['正梳妆', '自难忘', '明月夜'],
  },
  {
    'question': '相顾无言，____。',
    'es': 'Completa el verso.',
    'answer': '惟有泪千行',
    'choices': ['惟有泪千行', '无处话凄凉', '尘满面'],
  },
  {
    'question': '料得年年肠断处，明月夜，____。',
    'es': 'Completa el verso.',
    'answer': '短松冈',
    'choices': ['短松冈', '千里孤坟', '小轩窗'],
  },
] : widget.poemIndex == 5 ? [
  {
    'question': '花褪残红，____。',
    'es': 'Completa el verso.',
    'answer': '青杏小',
    'choices': ['青杏小', '芳草少', '燕子飞'],
  },
  {
    'question': '燕子飞时，____。',
    'es': 'Completa el verso.',
    'answer': '绿水人家绕',
    'choices': ['绿水人家绕', '天涯无芳草', '墙里佳人笑'],
  },
  {
    'question': '枝上柳绵吹又少，____。',
    'es': 'Completa el verso.',
    'answer': '天涯何处无芳草',
    'choices': ['天涯何处无芳草', '绿水人家绕', '多情却被无情恼'],
  },
  {
    'question': '墙里秋千，____。',
    'es': 'Completa el verso.',
    'answer': '墙外道',
    'choices': ['墙外道', '青杏小', '佳人笑'],
  },
  {
    'question': '墙外行人，____。',
    'es': 'Completa el verso.',
    'answer': '墙里佳人笑',
    'choices': ['墙里佳人笑', '绿水人家绕', '天涯无芳草'],
  },
  {
    'question': '笑渐不闻声渐悄，____。',
    'es': 'Completa el último verso.',
    'answer': '多情却被无情恼',
    'choices': ['多情却被无情恼', '天涯何处无芳草', '墙里佳人笑'],
  },
] : widget.poemIndex == 6 ? [
  {
    'question': '山下兰芽短浸溪，____。',
    'es': 'Completa el verso.',
    'answer': '松间沙路净无泥',
    'choices': ['松间沙路净无泥', '萧萧暮雨子规啼', '门前流水尚能西'],
  },
  {
    'question': '松间沙路净无泥，____。',
    'es': 'Completa el verso.',
    'answer': '萧萧暮雨子规啼',
    'choices': ['萧萧暮雨子规啼', '休将白发唱黄鸡', '山下兰芽短浸溪'],
  },
  {
    'question': '谁道人生无再少？____。',
    'es': 'Completa el verso.',
    'answer': '门前流水尚能西',
    'choices': ['门前流水尚能西', '松间沙路净无泥', '萧萧暮雨子规啼'],
  },
  {
    'question': '门前流水尚能西！____。',
    'es': 'Completa el último verso.',
    'answer': '休将白发唱黄鸡',
    'choices': ['休将白发唱黄鸡', '谁道人生无再少', '山下兰芽短浸溪'],
  },
] : [];
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
          builder: (_) => CompletionPage(poemIndex: widget.poemIndex),
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
  final int poemIndex;

  const CompletionPage({
    super.key,
    required this.poemIndex,
  });

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
        builder: (_) => StudyPage(poemIndex: this.poemIndex),
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

                  Text(
      poemIndex == 0
    ? '你已经完成《水调歌头》的全部练习！'
    : poemIndex == 1
        ? '你已经完成《念奴娇·赤壁怀古》的全部练习！'
        : poemIndex == 2
            ? '你已经完成《定风波·莫听穿林打叶声》的全部练习！'
            : poemIndex == 3
                ? '你已经完成《江城子·密州出猎》的全部练习！'
                : poemIndex == 4
    ? '你已经完成《江城子·乙卯正月二十日夜记梦》的全部练习！'
    : poemIndex == 5
        ? '你已经完成《蝶恋花·春景》的全部练习！'
        : poemIndex == 6
            ? '你已经完成《浣溪沙·游蕲水清泉寺》的全部练习！'
            : '你已经完成全部练习！',
  textAlign: TextAlign.center,
  style: const TextStyle(
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
