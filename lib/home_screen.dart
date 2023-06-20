import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:research_20_06_2023/tab_view_data.dart';
import 'package:research_20_06_2023/tab_view_img.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late final TabController _tabController;
  final ScrollController scrollController = ScrollController();

  double height = -1;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  callBackHeight(double result){
    height = result;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Research 20/06/2023',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: double.infinity,
          height: height > 0 ? height : 1100.0,
          child: Column(
            children: [
              Container(
                height: 250.0,
                width: double.infinity,
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'This is item $index',
                              style: const TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                        ),
                        DotsIndicator(
                          dotsCount: 3,
                          position: index,
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                      ],
                    );
                  },
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: TabBar(
                  controller: _tabController,
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Colors.green,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorPadding: EdgeInsets.zero,
                  onTap: (value) {
                    height = -1;
                    setState(() {

                    });
                  },
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Data Tab',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                    // second tab [you can add an icon using the icon property]
                    Tab(
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Image Tab',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      TabViewData(callBackNumber: callBackHeight,),
                      TabViewImage(callBackNumber: callBackHeight,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
