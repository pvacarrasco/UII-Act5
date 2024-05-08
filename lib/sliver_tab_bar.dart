import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://decofilia.com/wp-content/uploads/2016/07/diseno-de-opticas-14.jpg";

  List<String> miImages = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Snellen_chart.svg/640px-Snellen_chart.svg.png",
    "https://m.media-amazon.com/images/I/51-hh0WS1EL._SL500_.jpg",
    "https://images.ctfassets.net/u4vv676b8z52/vs8FNmlgEh6vFMp65W1qN/7d36ce2d0ef59a42c8dfc1a762750aed/Hero_Article_Childrens-Sunglasses-SP.jpg?fm=jpg&q=80",
    "https://www.opticafabregas.net/wp-content/uploads/2014/12/entrada-lentes-contacto.jpg",
  ];

  void tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void dispose() {
    tabController!.removeListener(tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(tabListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Color(0xffb73a3a),
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(""),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          "Opticas Vianney",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: const Color(0xffffffff),
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                controller: tabController,
                indicatorColor: Color(0xffb73a3a),
                isScrollable: true,
                tabs: const [
                  Tab(text: "Examen de vista"),
                  Tab(text: "Lentes de aumento"),
                  Tab(text: "Lentes de sol"),
                  Tab(text: "Lentes de contacto"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800.0,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text(
                      "Un examen de la vista es una prueba breve que revisa principalemente qué tan bien puede ver las cosas de cerca y de lejos.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "La principal ventaja es la más obvia, las lentes graduadas te permiten ver; sin ellas, te costaría ver con claridad y nitidez.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Los lentes actúan como una barrera, protegiendo sus ojos de los rayos UVA y UVB.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Además de ofrecer flexibilidad, comodidad y una imagen “sin anteojos”, los lentes de contacto ayudan a corregir diversos trastornos de la vista.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
