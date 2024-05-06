import 'package:flutter/material.dart';
import 'package:pr30ject_modified/screen/home_screen.dart';

List screens = [
  const HomeMain(),
  const Text('서재'),
  const Text('캐릭터'),
  const Text('기록'),
  const Text('설정'),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Main',
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            iconSize: screenSize.height / 32,
            currentIndex: currentIndex,
            onTap: (index) {
              print('index test : $index');
              print('${screenSize.height / 32}');
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book_outlined),
                label: '서재',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.man_2),
                label: '캐릭터',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit),
                label: '기록',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '설정',
              )
            ],
            selectedItemColor: Colors.red,
            //선택된 아이콘 색
            unselectedItemColor: Colors.grey,
            //선택 안된 아이콘 색
            showSelectedLabels: true,
            //선택된 아이콘 라벨 보여줄지말지
            showUnselectedLabels: false,
            //선택안된 아이콘 라벨 보여줄지말지
            type: BottomNavigationBarType.shifting,
            //선택된 항목 돋보이게 움직임
          ),
          body: Center(
            child: screens.elementAt(currentIndex),
          ),
        ),
      ),
    );
  }
}
