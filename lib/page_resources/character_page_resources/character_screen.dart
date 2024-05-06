import 'package:flutter/material.dart';

class CharacterPage extends StatefulWidget {
  final double paddingSize;

  const CharacterPage({Key? key, required this.paddingSize}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  int _currentStep = 0;
  List<List<String>> _characters = [];

  @override
  void initState() {
    super.initState();
    _generateCharacters();
  }

  void _generateCharacters() {
    List<String> characters = [];
    for (int i = 1; i <= 56; i++) {
      characters.add('캐릭터 $i');
    }
    for (int i = 0; i < 7; i++) {
      _characters.add(characters.sublist(i * 8, (i + 1) * 8));
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var paddingSize = widget.paddingSize;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('나의 캐릭터')),
        leading: IconButton(
          icon: Icon(Icons.checkroom),
          onPressed: () {
            print('옷장!');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.store),
            onPressed: () {
              print('상점!');
            },
          ),
          IconButton(
            icon: Icon(Icons.attach_money),
            onPressed: () {
              print('코인!');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(paddingSize, 20, paddingSize, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(Icons.person, size: 50, color: Colors.white), 
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print('캐릭터 스토리 보기!');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 30), // 작은 크기로 설정
                ),
                child: Text('캐릭터 스토리 보기'),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        width: screenSize.width * 0.8,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  setState(() {
                                    if (_currentStep > 0) {
                                      _currentStep--;
                                    }
                                  });
                                },
                              ),
                            ),
                            Text(
                              '${_currentStep + 1}단계',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  setState(() {
                                    if (_currentStep < _characters.length - 1) {
                                      _currentStep++;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(_characters[_currentStep].length, (index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        _characters[_currentStep][index],
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
