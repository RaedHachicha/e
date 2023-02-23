import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        //create a pinned appbar that shows a title
        SliverAppBar(
          pinned: true,
          title: Text("Sliver App Bar"),
        ),
        //create a silver list that shows 20 different colors
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              height: 100,
              color: Colors.primaries[index % Colors.primaries.length],
            ),
            childCount: 20,
          ),
        ),
      ],
    )));
  }
}
