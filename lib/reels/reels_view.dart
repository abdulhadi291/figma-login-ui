import 'package:figma_login/reels/simple_video_player.dart';
import 'package:flutter/material.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  final List<String> videoUrl = [
    'https://cdn.pixabay.com/video/2024/08/30/228847_large.mp4',
    'https://cdn.pixabay.com/video/2025/04/29/275633_large.mp4',
    'https://cdn.pixabay.com/video/2025/05/13/278750_large.mp4',
    'https://cdn.pixabay.com/video/2025/06/03/283431_large.mp4',
    'https://cdn.pixabay.com/video/2020/04/28/37424-414024570_large.mp4',
    'https://media.istockphoto.com/id/1647025971/video/drone-flight-around-trees-revealing-mountain-road-in-swiss-alps.mp4?s=mp4-640x640-is&k=20&c=kX2MCizpS4krd-JVTYRkWoPHmzm9pvM7a_zLn6dxzPI='
  ];

  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void _onPageChanged(int index) {
    print('Page changed to: $index');
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
        backgroundColor: Color.fromARGB(255, 247, 121, 134),
      ),
      backgroundColor: Color.fromARGB(255, 247, 121, 134),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: videoUrl.length,
          onPageChanged: _onPageChanged,
          itemBuilder: (context, index) {
            return SimpleVideoPlayer(
              videoUrl: videoUrl[index],
              shouldPlay: true,
              isCurrentPage: index == _currentIndex,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 247, 121, 134),
        currentIndex: 0,
        onTap: (index) {
          setState(() {});
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: 'Back',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save_alt),
            label: 'Save',
          ),
        ],
      ),
    );
  }
}