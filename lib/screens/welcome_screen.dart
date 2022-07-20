import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skeletonproject/models/slide.dart';
import 'package:skeletonproject/share_preferences.dart/preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[ 
            const _MainPages(),
            ElevatedButton(
              onPressed: (){
                Preferences.welcome = false;
                Navigator.of(context).pushNamed('/home');
              }, 
              child: const Text("Get Started!"),
            ),
            const SizedBox(height: 40),
          ],
        )
      ),
    );
  }
}

class _MainPages extends StatefulWidget {
  const _MainPages({
    Key? key,
  }) : super(key: key);

  @override
  State<_MainPages> createState() => _MainPagesState();
}

class _MainPagesState extends State<_MainPages> {

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {

    _timer = Timer.periodic( const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < slideList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: slideList.length,
                itemBuilder: (context, index) => _SlideItem(index: index),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < slideList.length; i++)
                  if (i == _currentPage)
                    const _SlideDots(isActive: true)
                  else
                    const _SlideDots(isActive: false)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SlideItem extends StatelessWidget {

  final int index;

  const _SlideItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(slideList[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            slideList[index].title,
            style: TextStyle(
              fontSize: 22,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            slideList[index].description,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SlideDots extends StatelessWidget {

  final bool isActive;

  const _SlideDots({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

