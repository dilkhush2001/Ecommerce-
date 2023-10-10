import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/cake.dart';
import 'package:upcoming/page1.dart';
import 'package:upcoming/searchPage.dart';

import 'bioOfUser.dart';
import 'cart.dart';
import 'login_page.dart';
import 'loginprofil.dart';
class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}


class _page2State extends State<page2> {
  final List<Widget> _pages = [
    Myapp(),
    page5(),
    BioOfUser()
  ];
  PageController pageController=PageController();
  int currPage=0;
  int startIndex=11;
  int perImage=2000;

  get currIdx => 0;
  @override
  void initState(){
    super.initState();
    AutoPageChange();
  }
  void AutoPageChange() {
    Timer.periodic(Duration(milliseconds: perImage), (timer) {
      if(currPage<list.length-1){
        currPage++;
      }
      else{
        currPage=0;
      }
      pageController.animateToPage(currPage, duration: Duration(milliseconds: 1000), curve: Curves.easeInSine);
    });

  }
  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container grid(String imPath, String txt){
      return Container(
        height: hi/3.45,
        width: wi/3.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: hi/4,
              width: wi/3.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(txt, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      );
    }
    Container circle(String imPath, String txt){
      return Container(
        height: hi/3.45,
        width: wi/3.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: hi/4,
              width: wi/3.1,
              decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Text(txt, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Colors.greenAccent,
        leading: IconButton(onPressed: () {  }, icon: const Icon(Icons.menu, color: Colors.black,),),
        title: const Text('Foody', style: TextStyle(color: Colors.red),),
        centerTitle:true,
        actions:  [
          IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>searchPage()));},
            icon: FaIcon(FontAwesomeIcons.search, color: Colors.black,),),
          SizedBox(width: 30,),
          IconButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => page5()));
          }, icon: Icon(Icons.shopping_cart_outlined,  color: Colors.black,)),
          SizedBox(width: 10,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        currentIndex: currIdx,
        onTap: (index){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>_pages[index]));
          });
        },

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
        ],

      ),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text("Collections", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 18),)),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 6,),
              child: Row(
                children: [
                  grid("https://cdn.pixabay.com/photo/2017/07/28/14/29/macarons-2548827_640.jpg", "Macarons sweet "),
                  SizedBox(width:2),
                  grid("https://cdn.pixabay.com/photo/2018/06/28/15/23/berries-3504149_640.jpg", "Berries Fruits"),
                  SizedBox(width: 2),
                  grid("https://cdn.pixabay.com/photo/2017/01/07/20/40/candy-1961538_640.jpg", "Candy Sweet"),
                  SizedBox(width: 6,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text("Newly Launched", style: TextStyle(fontWeight:FontWeight.bold, color: Colors.black, fontSize: 18),)),
            ),
            Center(
              child: Container(
                height: hi/4,
                width: wi*0.93,
                child: PageView.builder(
                  itemCount: list.length,
                    controller: pageController,
                    itemBuilder: (BuildContext context, int i){
                     // final int idx = i + startIndex;
                      return Container(
                        height: hi/4,
                        width: wi*0.93,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                          image: DecorationImage(image: NetworkImage(list[i].imPath),fit: BoxFit.fill)
                        ),
                      );

                },

                ),
              ),
            ),
            Center(child: const Text("Spicy Chiken LAssgna Roll-Ups", style: TextStyle(color: Colors.black87),)),
            SizedBox(height: 8),
            const Center(child: Text('Best Pizzas', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 6,),
              child: Row(
                children: [
                  circle("https://cdn.pixabay.com/photo/2017/09/19/20/41/pizza-2766568_640.jpg", "Pizza Breakfast"),
                  SizedBox(width:2),
                  circle("https://cdn.pixabay.com/photo/2017/09/29/12/23/sauces-2798897_640.jpg", "Sauces Sos"),
                  SizedBox(width: 2),
                  circle("https://cdn.pixabay.com/photo/2017/09/30/14/39/pizza-2802248_640.jpg", "Pizza Meat"),
                  SizedBox(width: 6,)
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 6,),
              child: Row(
                children: [
                  circle("https://cdn.pixabay.com/photo/2017/07/28/14/29/macarons-2548827_640.jpg", "Pizza Breakfast"),
                  SizedBox(width:2),
                  circle("https://cdn.pixabay.com/photo/2017/10/01/09/36/pizza-2804692_640.jpg", "Pizza 4K"),
                  SizedBox(width: 2),
                  circle("https://cdn.pixabay.com/photo/2017/09/19/20/41/pizza-2766568_640.jpg", "Pizza Breakfast"),
                  SizedBox(width: 6,)
                ],
              ),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 6,),
              child: Row(
                children: [
                  circle("https://cdn.pixabay.com/photo/2017/09/22/16/45/pizza-2776311_640.jpg", "Pizza food "),
                  SizedBox(width:2),
                  circle("https://cdn.pixabay.com/photo/2017/09/30/18/31/pizza-2803044_640.jpg", "PIzza Pastry"),
                  SizedBox(width: 2),
                  circle("https://cdn.pixabay.com/photo/2017/09/30/19/42/pizza-2803349_640.jpg", "Pizza cheddar"),
                  SizedBox(width: 6,)
                ],
              ),
            ),
            Center(child: TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>cake([])));
            },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("DownLoading .........", style: TextStyle(fontSize: 30),),
                ))),


          ],
        ),
      ),

    );
  }
  @override
  void dipose(){
    pageController.dispose();
    super.dispose();

  }
}
class Data1{
  String imPath;
  String txt;
  String name;
  String cost;
  Data1({
    required this.imPath,
    required this.txt,
    required this.name,
    required this.cost,
  });
}
