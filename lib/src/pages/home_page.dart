import 'dart:math';

import 'package:boats_challenge/src/models/boat_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  double _page;  
  PageController _pageController;
  
  Animation<double> _animationOut;
  Animation<double> _animationBoat;
  AnimationController _animationController;

  void _pageListener() {
    setState(() {
      _page = _pageController.page;
    });
  }

  @override
  void initState() {
    _page = 0;
    _pageController = PageController(viewportFraction: 0.75, initialPage: _page.toInt());
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
        
    _animationOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.0, 1.0, curve: Curves.decelerate)
    ));

    _animationBoat = CurvedAnimation(
      parent: _animationController, 
      curve: Interval(0.0, 1.0, curve: Curves.elasticInOut)
    );

    _pageController.addListener(_pageListener);
    super.initState();    
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.transparent,
            title: Text('Boats', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25)),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 25,
                onPressed: () {}
              )
            ],
          ),
          body: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: boats.length,
            itemBuilder: (context, index) {
              final boat = boats[index];
              return Opacity(
                opacity: (1 - (index - _page).abs()).clamp(0.0, 1.0),
                child: Column(
                  children: [
                    Transform.rotate(
                      angle: _animationBoat.value * -pi/2,
                      child: Container(
                        height: size.height / 1.7,
                        child: Image(
                          image: AssetImage(boat.path), 
                          fit: BoxFit.fill
                        )
                      ),
                    ),
                    Opacity(
                      opacity: _animationOut.value,
                      child: Column(
                        children: [                            
                          SizedBox(height: 25),
                          Text(boat.model, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25)),
                          SizedBox(height: 5),
                          Text('By ${boat.author}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18)),
                          SizedBox(height: 10),
                          GestureDetector(
                            child: Text('SPEC >', style: TextStyle(color: Colors.blue.shade900, fontWeight: FontWeight.w500, fontSize: 15)),
                            onTap: () {
                              _animationController.forward(from:0.0);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );          
            }
          ),
        );
      }
    );
  }
}