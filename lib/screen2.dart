import 'package:flutter/material.dart';
import 'package:flutter_application_2/animatedlist.dart';

class Screen2 extends StatefulWidget {
  String uid;

  Screen2({super.key, required this.uid});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int i = 2;

  Tween<Offset> _offset = Tween(
    begin: Offset(1, 0),
    end: Offset(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Welcome"),
          Text(widget.uid),
          TextButton(
            onPressed: () {
              setState(() {
                i++;
                _listKey.currentState!.insertItem(i);
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width * 1,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: i,
                itemBuilder: (context, index, animation) => SlideTransition(
                  key: _listKey,
                  position: animation.drive(_offset),
                  child: CardItem(animation: animation, item: index),
                ),
              ))
        ],
      ),
    );
  }
}
