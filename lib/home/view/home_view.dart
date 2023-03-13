import 'package:e_cinemav1/consts/colors.dart';
import 'package:e_cinemav1/consts/widgets/elevatedbtn_widget.dart';
import 'package:e_cinemav1/consts/widgets/movie_presenter.dart';
import 'package:e_cinemav1/home/controller/home_controller.dart';
import 'package:e_cinemav1/home/controller/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

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
    var mediaquery = MediaQuery.of(context);
    return Consumer<SearchStateProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: SafeArea(
              child: CustomScrollView(
        slivers: [
          SliverAppBar(
              snap: false,
              floating: true,
              backgroundColor: backgroundColor,
              elevation: 5.0,
              pinned: true,
              centerTitle: true,
              leading: Text('LOGO\nHERE\nTY'),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: CustomElevatedButton(
                    buttonText: 'Login',
                    onPressed: () {},
                    height: 30,
                    width: mediaquery.size.width * 0.2,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              title: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(UniconsLine.location_arrow,size: 22,),
                    Text("Le Mans, France",style: TextStyle(
                      fontSize: 18
                    ),)
                  ],
                ),
                height: 50,
                width: mediaquery.size.width * 0.5,
              ),
              bottom: AppBar(
                elevation: 0.0,
                backgroundColor: backgroundColor,
                title: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      provider.isSearching
                          ? Container(
                              height: 50,
                              width: mediaquery.size.width * 0.75,
                              child: TextField(
                                onChanged: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      provider.changeWritingState(true);
                                    });
                                  } else {
                                    setState(() {
                                      provider.changeWritingState(false);
                                    });
                                  }
                                },
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 1.2),
                                decoration: InputDecoration(
                                  //I want the enabled border to be white, border radius 10
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.5),
                                      )),
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      letterSpacing: 1.2),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                ),
                              ))
                          : Text(
                              "Now in cinemas",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                      provider.isSearching
                          ? provider.isWriting
                              ? IconButton(
                                  icon: Icon(UniconsLine.arrow_right, size: 26),
                                  onPressed: () {},
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      provider.changeSearchingState();
                                    });
                                  },
                                  icon: Icon(
                                    UniconsLine.times,
                                    size: 26,
                                  ))
                          : IconButton(
                              icon: Icon(UniconsLine.search_alt, size: 26),
                              onPressed: () {
                                setState(() {
                                  provider.changeSearchingState();
                                });
                              },
                            )
                    ],
                  ),
                ),
              )),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var movie = controller.getMovies()[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 5.0),
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
    });
  }
}
