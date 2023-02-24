import 'package:e_cinemav1/consts/widgets/movie_presenter.dart';
import 'package:e_cinemav1/home/controller/home_controller.dart';
import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text("Sliver App Bar"),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              var movie = controller.getMovies()[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                child: MoviePresenter(
                  movie: movie,
                ),
              );
            },
            childCount: controller.getMovies().length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.2),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 2.0,
              crossAxisCount: 2),
        ),
      ],
    )));
  }
}
