import 'dart:convert';

import 'package:ebooks_app/ui/widgetes/app_tabs.dart';
import 'package:ebooks_app/ui/widgetes/list_item.dart';
import 'package:flutter/material.dart';
import 'package:ebooks_app/shared/app_colors.dart' as app_colors;
import 'package:ebooks_app/shared/app_textstyle.dart' as textstyle;

import '../widgetes/slider_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List? popularBooks;
  List? books;

  ScrollController? _scrollController;
  TabController? _tabController;

  void readData() async {
    await DefaultAssetBundle.of(context)
        .loadString('json/popularBooks.json')
        .then((value) {
      setState(() {
        popularBooks = json.decode(value);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString('json/books.json')
        .then((value) {
      setState(() {
        books = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    readData();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: app_colors.background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              //Icon Atas
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ImageIcon(
                      AssetImage('img/menu.png'),
                      size: 24,
                      color: Colors.black,
                    ),
                    Row(
                      children: const [
                        Icon(Icons.search),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.notifications),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              //Title Popular Books
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Popular Books',
                  style: textstyle.medium.copyWith(fontSize: 30),
                ),
              ),
              const SizedBox(height: 12),
              //Slider
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: popularBooks == null ? 0 : popularBooks!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: SliderItem(
                          imgUrl: popularBooks![index]["img"],
                        ),
                      );
                    }
                    return SliderItem(
                      imgUrl: popularBooks![index]["img"],
                    );
                  },
                ),
              ),

              //Tag
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: app_colors.sliverBackground,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(50),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TabBar(
                                controller: _tabController,
                                indicatorPadding: const EdgeInsets.all(0),
                                indicatorSize: TabBarIndicatorSize.label,
                                labelPadding: const EdgeInsets.only(left: 10),
                                isScrollable: true,
                                indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 7,
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: const Offset(0, 0),
                                      )
                                    ]),
                                tabs: const [
                                  AppTabs(
                                    color: app_colors.menu1Color,
                                    title: 'New',
                                  ),
                                  AppTabs(
                                    color: app_colors.menu2Color,
                                    title: 'Popular',
                                  ),
                                  AppTabs(
                                    color: app_colors.menu3Color,
                                    title: 'Trending',
                                  ),
                                ]),
                          ),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: books == null ? 0 : books!.length,
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListItem(
                            imgUrl: books![index]["img"],
                            rate: books![index]["rating"],
                            title: books![index]["title"],
                            author: books![index]["text"],
                            tag: "Love",
                          ),
                        ),
                      ),
                      Material(),
                      Material(),
                    ],
                  ),
                ),
              )

              //List of Books
            ],
          ),
        ),
      ),
    );
  }
}
