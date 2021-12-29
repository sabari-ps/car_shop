import 'package:car_shop/views/screens/next_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/sidemenu.png',
            color: Colors.white,
            width: 40.0,
            scale: 0.9,
          ),
        ),
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 32.0,
          ),
          SizedBox(
            width: 16.0,
          ),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 32.0,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          _sliver1(
            screenWidth: screenWidth,
          ),
          _sliver2(),
          _sliver3(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 4,
          backgroundColor: Colors.yellow.shade300,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.share),
              label: "Share",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            const BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history_edu),
            ),
            BottomNavigationBarItem(
              label: "Coins",
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NextScreen(),
                    ),
                  );
                },
                child: const ImageIcon(
                  AssetImage(
                    "assets/icons/coin.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _sliver1({required double screenWidth}) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Image.asset(
            'assets/images/bg.jpeg',
          ),
          Image.asset(
            'assets/images/bg.jpeg',
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/bg.jpeg',
              ),
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 40,
                  width: screenWidth * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          "assets/icons/filter.png",
                          color: Colors.white,
                        ),
                      ),
                      suffixIcon: Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          "assets/icons/search.png",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Image.asset("assets/icons/banner1.jpg"),
                  Positioned(
                    bottom: 20,
                    child: SizedBox(
                      width: screenWidth * 0.8,
                      height: 30,
                      child: Row(
                        children: [
                          IntrinsicWidth(
                            child: Row(
                              children: [
                                Image.asset("assets/icons/caricon.png"),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  alignment: Alignment.center,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                  child: const Text(
                                    "Enter car details >>>",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  _sliver2() => SliverToBoxAdapter(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff303944),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/icons/shoppe_btn.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/icons/carspa.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/icons/mechanical.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      child: Image.asset(
                        "assets/icons/quick.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Shoppe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "More >",
                  ),
                ],
              ),

            ],
          ),
        ),
      );

  _sliver3() =>  SliverGrid.count(
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    childAspectRatio: 1,
    crossAxisCount: 3,
    children: [
      Image.asset('assets/icons/1.png'),
      Image.asset('assets/icons/2.png'),
      Image.asset('assets/icons/3.png'),
      Image.asset('assets/icons/4.png'),
      Image.asset('assets/icons/5.png'),
      Image.asset('assets/icons/6.png'),
    ],
  );
}
