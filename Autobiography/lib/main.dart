import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final tabs=[
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                       useMaterial3: true,),
      home: Scaffold(
        appBar: AppBar(title: Text('我的自傳'),),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: currentIndex==0? Image.asset('images/f1.jpg',width:40,height:40): Image.asset('images/f1.jpg',width:20,height:20), label:'自我介紹',),
            BottomNavigationBarItem(icon: Icon(Icons.school), label:'學習歷程',),
            BottomNavigationBarItem(icon: Icon(Icons.schedule_outlined), label:'學習計畫',),
            BottomNavigationBarItem(icon: Icon(Icons.engineering), label:'專業方向',),
          ],
          onTap: (index) {
            setState(() {
              previousIndex=currentIndex;
              currentIndex=index;
              if (index==0) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('1.mp3'));
              }
              if (index==1) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('2.mp3'));
              }
              if (index==2) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('3.mp3'));
              }
              if (index==3) {
                if (previousIndex==currentIndex) player.resume();
                player.stop();
                player.play(AssetSource('4.mp3'));
              }
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {

  final String s1='大家好，我是一位來自普通家庭的孩子，生長在一個平凡而溫馨的家庭裡。'
                  '我的父親是一位勤奮的業務員，而母親則在一家做手工內衣的裁縫師，他們的辛勤工作為我們的生活打下了堅實的基礎。'
                  '我出生在一個充滿愛的家庭，父母雖然工作辛苦，但總是用笑容和關愛滿足著我們的需求。父親開車跑業務成了我童年的象徵，'
                  '他開著那輛明亮的車子，總是溫暖地接送我們到學校、朋友家，無論風雨晴雪，他總是守護在我們身邊。他的堅持和努力工作的精神深深影響著我，讓我懂得了奮鬥和堅持的價值。'
                  '母親在裁縫的工作也給了我很多啟發。她總是精明精細地應對各種工作上的挑戰，並用她的智慧和毅力為家庭付出。她教導我們節約的觀念，讓我們懂得生活的不易，更懂得珍惜每一分每一秒。'
                  '她的細心和愛心也使我們感受到家的溫暖，讓我們在成長過程中充滿自信和愛。'
                  '我的成長過程中充滿了父母的愛和教導。他們雖然沒有豐富的物質條件，但用心呵護著我們，讓我們感受到無盡的溫暖。'
                  '我學到了努力拼搏的精神，學到了在困難面前堅持不懈的毅力。父親的小黑車和母親的裁縫工作雖然看似平凡，'
                  '卻蘊含著他們對家庭的愛與責任，也成為我人生中不可或缺的一部分。';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('楊景閎的自傳', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 10,),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child:Image.asset('images/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f2.jpg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height:150,
                decoration: BoxDecoration(
                  border: Border.all(width:2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(image: AssetImage('images/f3.jpeg'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(16), // 設定整體內邊距
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
            ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '''我的學習歷程始於萬福國小，那裡是我接觸知識的起點。老師的悉心教導和同學之間的友誼，讓我對學習產生濃厚的興趣。隨著時光流轉，我進入了景興國中，開始接觸更多元的學科和活動。在這段期間，我不僅學到了更多的知識，還參與了各種社團和課外活動，激發了我對不同領域的探索心情。老師的啟發和同學的合作，讓我在學業和人際方面都有了全面的成長。轉眼間，高中階段的選擇即將開始。我選擇了木柵高工，這是一所以工科為主的學校，提供了更多實務和專業的知識。在這裡，我深深感受到老師的專業和教學的實用性，這為我未來的發展打下了堅實的基礎。為了更進一步深造，我努力準備升學考試，最終成功考入了高科大。這是我學習歷程中的一個新里程碑，也是我對未來充滿期待的開始。在高科大，我將有更多的機會學到更深層次的知識，同時也能參與更多實際的專業項目。這一路走來，我的學習歷程充滿了努力、堅持和成長。我感謝家人的支持，感謝老師的教導，也感謝身邊的同學們一路相伴。未來，我將繼續保持對學習的熱忱，不斷挑戰自己，為實現更大的夢想而努力拼搏。這段豐富多彩的學習歷程將成為我人生中珍貴的一部分，為我迎接未來的挑戰打下堅實的基礎。''',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            buildLearningPlanBox('大一', '建立基礎，多元發展', [
              '程式語言',
              '學習並精通一門程式語言，建立堅實的基礎。',
              '參與程式課程和專案，增進實際應用能力。',
              '人際關係',
              '積極參與學校社團和活動，擴展人脈。',
              '培養合作和溝通技巧，建立良好的團隊合作精神。',
              '外語能力',
              '注重英文能力的提升，提升實際應用的語言能。',
            ]),
            SizedBox(height: 20),
            buildLearningPlanBox('大二', '專業深耕，通識全面', [
              '程式能力',
              '深入研究並學習多門程式語言，拓展技術範疇。',
              '參與專業實習或開發項目，實踐學習成果。',
              '通識課程',
              '選修多元的通識課程，擴展跨領域知識。',
              '參與學術，研討會拓展對不同領域的理解。',
            ]),
            SizedBox(height: 20),
            buildLearningPlanBox('大三', '迎接挑戰，積極準備未來', [
              '準備是否要讀研究所',
              '蒐集相關研究方向的資訊，確定未來深造方向。',
              '參與導師的研究項目，累積相關實務經驗。',
              '預備實習資料',
              '更新履歷，梳理實習及研究相關經歷。',
              '參與業界交流活動，拓展職涯視野。',
            ]),
            SizedBox(height: 20),
            buildLearningPlanBox('大四', '實習實踐，自我突破', [
              '實習計畫',
              '選擇相關領域的實習機會，實際應用所學。',
              '建立與業界的聯繫，掌握實際工作需求。',
              '繼續自我提升',
              '參與相關技術研討會，保持學習的熱忱。',
              '與業界人士交流，掌握行業動態。',
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildLearningPlanBox(String title, String subtitle, List<String> details) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(subtitle, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          for (String detail in details) Text(detail, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '專業方向努力目標和計劃',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            buildGoalBox(
              '專業技能提升',
              '在專業技能上取得更高的水平，成為該領域的專家。',
              [
                '不斷深入研究新興技術和行業趨勢，以保持在專業領域的領先地位。',
                '參與相應的培訓和研討會，不斷更新技能和知識。',
                '積極參與相關領域的開源項目，提升實際應用能力。',
              ],
            ),
            buildGoalBox(
              '專業認證取得',
              '積極爭取相關的專業認證，以加強自身的競爭力。',
              [
                '確定目標認證，制定具體的學習計劃，逐步完成認證的考試和實踐。',
                '參與相應的培訓課程，獲取必要的知識和技能。',
                '經驗豐富後，尋求更高級別的認證，持續提升自身的專業水平。',
              ],
            ),
            buildGoalBox(
              '學術研究與發表',
              '參與學術研究，並在國際期刊或會議上發表研究成果。',
              [
                '選擇一個有挑戰性和創新性的研究主題，進行深入研究。',
                '持續參與國際學術研討會，與同行交流並擴大學術視野。',
                '積極參與專業協會，成為相應研究領域的活躍成員。',
              ],
            ),
            buildGoalBox(
              '團隊協作和領導力培養',
              '在團隊中發揮更大的影響力，培養卓越的領導能力。',
              [
                '主動參與項目和團隊，提供積極的貢獻，並學會協調與溝通。',
                '主動學習有效的領導技能，參與領導力培訓課程。',
                '建立團隊合作的文化，提高整體團隊的工作效能。',
              ],
            ),
            buildGoalBox(
              '跨領域合作和創新',
              '在不同領域間建立合作，促進跨學科的創新發展。',
              [
                '參與跨領域的專案和合作，學習其他領域的知識和技術。',
                '建立與其他專業人士的聯繫，促進跨領域的交流和合作。',
                '提倡和參與創新項目，為專業領域注入新的思維和解決方案。',
              ],
            ),
            buildGoalBox(
              '社會責任和影響力',
              '具備社會責任感，影響產業發展，促進科技和社會的和諧發展。',
              [
                '發表對行業發展的見解，參與相應政策和規範的制定。',
                '尋求機會成為行業內的領軍人物，推動社會的積極變革。',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGoalBox(String title, String subtitle, List<String> details) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text(subtitle, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          for (String detail in details) Text('• $detail', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

