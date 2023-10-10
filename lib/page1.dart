import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/Ice%20cream.dart';
import 'package:upcoming/bioOfUser.dart';
import 'package:upcoming/burger.dart';
import 'package:upcoming/cake.dart';
import 'package:upcoming/cart.dart';
import 'package:upcoming/page2.dart';
import 'package:upcoming/searchPage.dart';

import 'EditPro.dart';
import 'login_page.dart';
import 'loginprofil.dart';
var  list=<Data>[Data(imPath: 'https://cdn.pixabay.com/photo/2022/06/27/05/38/spices-7286739_640.jpg', txt: 'This is hydrabadi Biryani please buy',name: 'Mutton Biryani',cost: '\$ 25.99' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/06/10/05/32/biryani-platter-7253751_640.jpg', txt: 'Biyani Khaoo mast raho',name: 'Tika Paneer',cost: '\$ 78.99'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/02/12/15/00/biryani-7009110_640.jpg', txt: 'Rice khaoo', name: 'Rice carry', cost: '\$ 65.76'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/03/02/12/40/dish-7043064_640.jpg', txt: 'mutton rice ', name: 'Mutka Biryani', cost: '\$ 87.99'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/06/14/18/58/biryani-with-kebab-7262655_640.jpg', txt: 'Tika paneer khao bhai ', name: 'Tika Paneer', cost: '\$ 24.99'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/02/12/15/02/biryani-7009118_640.jpg', txt: "Big Deals Here try to order", name: 'Biryani rice ', cost: '\$ 54.60'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/07/04/06/30/biryani-5368414_640.jpg', txt: 'Bihari food in low cost', name: 'rice dal', cost: '\$ 23.87'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/19/08/52/pancake-2764589_640.jpg', txt: 'famous cake of Ap', name: 'Strawberry', cost: '\$ 99.99'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/05/23/22/33/birthday-2338813_1280.jpg', txt: 'Its My Favourites cake', name: 'Cake candees', cost: '\ 87.45'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/06/30/11/40/cupcakes-380178_640.jpg', txt: 'HI This is Good Cake Bro', name: 'CupCake candles', cost: '\$ 56.89'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg', txt: 'Delhi Favorites Cake', name: 'CupCake Muffin', cost: '\$ 56.99'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/12/17/20/52/cake-1914463_640.jpg', txt: 'Patna Favorites Cake ', name: 'Cake Pie', cost: '\$ 12.98'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg', txt: "", name: 'Hunburger', cost: '\$ 12.78'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_640.jpg', txt: '', name: 'snaks', cost: '\$ 45.89'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/03/05/19/02/abstract-1238247_640.jpg', txt: '', name: 'Barbecue', cost: '\$ 67.89'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/05/25/10/43/hamburger-1414423_640.jpg', txt: '', name: 'FOOD', cost: '\$ 23.978'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2018/03/18/14/27/eat-3236971_640.jpg', txt: '', name: 'Meals food', cost: '\$ 100.89'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/02/03/03/54/burger-2034433_640.jpg', txt: '', name: 'chips', cost: '\$ 67.99')
];
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context)=>MenuChange(),
        child: page1(),

      ),
    );
  }
}

class page1 extends StatefulWidget {
  page1({super.key,});

  @override
  State<page1> createState() => _page1State();
}
class _page1State extends State<page1> {
  final List<Widget> _pages = [
    Myapp(),
    page5(),
    BioOfUser()
  ];
  PageController pageController=PageController();
  int currPage=0;
  int perImage=3000;

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
      pageController.animateToPage(currPage, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    });

  }
  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Color color=const Color.fromARGB(254,253, 0, 0);

    Container container(){
      return Container(
        width: double.infinity,
        height: hi*0.35,
        color: Colors.grey[200],
        child: PageView.builder(
          itemCount: list.length,
          controller: pageController,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              height:hi*0.35 ,
              width: double.infinity,
              decoration: BoxDecoration(
                color: color,
                image: DecorationImage(image: NetworkImage(list[i].imPath),
                  fit: BoxFit.fill,

                )
              ),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(list[i].txt,style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.cyan),
                    ),
                  ),
                ],
              ),
            );

          },

        ),
      );
    }
    Container container1(String imPath, String txt, String cost){
      return Container(
        height: hi/12,
        width: wi/4.2,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imPath),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children:[
          Text(txt,  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
          ),
          SizedBox(height: 3,),
          Text(cost, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color),)
        ],
      ),
      );
    }
    Container container2(){
      return Container(
        height:hi*0.26,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container1(list[0].imPath, list[0].name, list[0].cost),
              SizedBox(width: wi/64,),
              container1(list[1].imPath, list[1].name,  list[1].cost),
              SizedBox(width: wi/64,),
              container1(list[2].imPath, list[2].name,list[2].cost),
              SizedBox(width: wi/64,),
              container1(list[3].imPath, list[3].name, list[0].cost),
              SizedBox(width: wi/64,),
              container1(list[4].imPath, list[4].name, list[4].cost),
              SizedBox(width: wi/64,),
              container1(list[5].imPath, list[5].name, list[6].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }
    Container container3(){
      return Container(
        height:hi*0.26,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container1(list[6].imPath, list[6].name, list[0].cost),
              SizedBox(width: wi/64,),
              container1(list[5].imPath, list[5].name, list[3].cost),
              SizedBox(width: wi/64,),
              container1(list[4].imPath, list[0].name, list[6].cost),
              SizedBox(width: wi/64,),
              container1(list[3].imPath, list[3].name,list[2].cost ),
              SizedBox(width: wi/64,),
              container1(list[3].imPath, list[3].name,list[6].cost ),
              SizedBox(width: wi/64,),
              container1(list[2].imPath, list[2].name, list[5].cost),
              SizedBox(width: wi/64,),
              container1(list[1].imPath, list[1].name, list[1].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }
    Container container4(){
      return Container(
        height:hi*0.26,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container1(list[4].imPath, list[4].name, list[6].cost),
              SizedBox(width: wi/64,),
              container1(list[5].imPath, list[5].name,list[3].cost),
              SizedBox(width: wi/64,),
              container1(list[0].imPath, list[0].name, list[6].cost),
              SizedBox(width: wi/64,),
              container1(list[3].imPath, list[3].name, list[0].cost),
              SizedBox(width: wi/64,),
              container1(list[2].imPath, list[2].name, list[2].cost),
              SizedBox(width: wi/64,),
              container1(list[1].imPath, list[1].name, list[1].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }
    Container container_gift(String imPath, String txt, String cost){
      return Container(
        height: hi/3.6,
        width: wi/4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            Container(
              height: hi/4.5,
              width: wi/2,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(imPath),
                    fit: BoxFit.fill,
                  )
              ),
            ),
            Text(txt,  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: 3,),
            Text(cost, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: color),)
          ],
        ),
      );
    }
    Container list_gift(){
      return Container(
        height:hi*0.30,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container_gift(list[7].imPath, list[7].name, list[7].cost),
              SizedBox(width: wi/64,),
              container_gift(list[8].imPath, list[8].name,list[8].cost),
              SizedBox(width: wi/64,),
              container_gift(list[9].imPath, list[9].name, list[9].cost),
              SizedBox(width: wi/64,),
              container_gift(list[10].imPath, list[10].name, list[10].cost),
              SizedBox(width: wi/64,),
              container_gift(list[11].imPath, list[11].name, list[11].cost),
              SizedBox(width: wi/64,),
              container_gift(list[8].imPath, list[8].name, list[8].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }

    Container Burgers_list(){
      return Container(
        height:hi*0.26,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container1(list[12].imPath, list[12].name, list[12].cost),
              SizedBox(width: wi/64,),
              container1(list[13].imPath, list[13].name,  list[13].cost),
              SizedBox(width: wi/64,),
              container1(list[14].imPath, list[14].name,list[14].cost),
              SizedBox(width: wi/64,),
              container1(list[15].imPath, list[15].name, list[15].cost),
              SizedBox(width: wi/64,),
              container1(list[16].imPath, list[16].name, list[16].cost),
              SizedBox(width: wi/64,),
              container1(list[17].imPath, list[17].name, list[17].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }
    Container Burgers_list1(){
      return Container(
        height:hi*0.26,
        child: Padding(
          padding:  EdgeInsets.only(left:wi/64),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: wi/64,),
              container1(list[17].imPath, list[17].name, list[12].cost),
              SizedBox(width: wi/64,),
              container1(list[15].imPath, list[15].name,  list[13].cost),
              SizedBox(width: wi/64,),
              container1(list[16].imPath, list[16].name,list[14].cost),
              SizedBox(width: wi/64,),
              container1(list[15].imPath, list[15].name, list[15].cost),
              SizedBox(width: wi/64,),
              container1(list[13].imPath, list[13].name, list[16].cost),
              SizedBox(width: wi/64,),
              container1(list[12].imPath, list[12].name, list[17].cost),
              SizedBox(width: wi/64,),
            ],
          ),
        ),
      );
    }
    //Best Biryani---
    Container grid(String imPath, String txt){
      return Container(
        height: hi/2,
        width: wi/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: hi/2.4,
              width: wi/2.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color,
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
    GestureDetector hiddenMenu(String path, String text){
      return GestureDetector(
        onTap: (){
          if(text=='Biryaniiii'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));
          }
          else if(text=='Cake....'){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>cake([])));
          }
          else if(text=='Ice Cream '){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>IceCream()));
          }
        },
        child: Container(
            color: Colors.black12,
            width: double.infinity, // Set the desired width
            height: hi/10, // Set the desired height
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: hi/10,
                  width: wi/6,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                      image: NetworkImage(path),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                SizedBox(width: 20,),
                Center(child:  Text(text,style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationThickness: 2),)),
                SizedBox(width: 20,),
                Center(child:Text('Tab On See More Items',style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 20, fontWeight: FontWeight.bold,))),
              ],
            ),
        ),
      );
    }

    return Scaffold(
      //backgroundColor: Colors.cyan,
      drawer:  Drawer(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepPurpleAccent,
                      backgroundImage: NetworkImage(proImg.text.isEmpty?"https://cdn.pixabay.com/photo/2017/08/07/16/39/girl-2605526_640.jpg":proImg.text),
                    ),
                    Text(name.text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(emailController.text),
                    Text("Date Time :${DateTime.now()}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),)
                  ]
              ),
              SizedBox(height: 5,),
              // Divider(
              //   thickness: 2,
              //   height: 10,
              //   color: Colors.black,
              // ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                tileColor: Colors.green,
              ),
              SizedBox(height: 8,),
              ListTile(
                leading: Icon(Icons.delivery_dining),
                tileColor: Colors.green,
                title: Text('our Sevices'),
              ),
              SizedBox(height: 8,),
              Center(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  tileColor: Colors.green,
                  title: Text('logout'),
                  onTap: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Center(child: Text('sure do you want logout')),
                        actions: [
                          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));}, child: Text("Yes")),
                          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));}, child: Text("No"))
                        ],
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 20,
        backgroundColor: Colors.greenAccent,
       // leading: IconButton(onPressed: () {  }, icon: const Icon(Icons.menu, color: Colors.black,),),
        title: Text('Foody', style: TextStyle(color: Colors.red),),
        centerTitle:true,
        actions:  [
          IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>searchPage()));},
          icon: FaIcon(FontAwesomeIcons.search, color: Colors.black,),),
          SizedBox(width: 30,),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => page5()));
              }, icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,)),
          SizedBox(width: 10,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: currIdx,
        onTap: (index){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>_pages[index]));
          });
        },

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
        ],

      ),
      body: BlocBuilder<MenuChange, bool>(builder: (context, isMenuOpen){
        return Stack(
          children: [
            Container(
              width: double.infinity,
              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(4),
                      child: Text("Hi Dear This Menu Of Sort Visualization ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.purpleAccent,backgroundColor: Colors.black12),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2022/03/02/12/40/dish-7043064_640.jpg", "Biryaniiii"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2017/05/23/22/33/birthday-2338813_1280.jpg", "Cake...."),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2022/03/02/12/40/dish-7043064_640.jpg", "Biyaniii "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_1280.jpg", "Burger... "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_640.jpg", "Ice Cream "),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: hiddenMenu("https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg", " fruits.... "),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: hiddenMenu("https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_1280.jpg", " YEssss.... "),
                    // ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                BlocProvider.of<MenuChange>(context).ToggleState();
              },
              child: AnimatedContainer(duration: Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                    0, isMenuOpen ? wi*0.7: 0, 0 ),
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child:SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left: 8, right: 8, bottom: 8),
                            child: container(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Trending Catergoies", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                TextButton(onPressed: () {  },
                                    child: const Text("See More",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.green, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          container2(),
                          SizedBox(height: 8,),
                          Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Chanies Trending Foody", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                TextButton(onPressed: () {  },
                                    child: const Text("See More",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.green, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          container3(),
                          SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Bihari Trending Foody", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
                                TextButton(onPressed: () {  },
                                    child: const Text("See More",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.green, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          container4(),
                          const SizedBox(height: 8,),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(onPressed: () {  },
                                    child: const Text("Gift By Occasions",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black),)),
                                TextButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cake([])));
                                },
                                    child: const Text("See More",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.green, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          list_gift(),
                          const SizedBox(height: 6,),
                          const Center(child: Text(" Best Burgers..", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                          Burgers_list(),

                          Burgers_list1(),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Burgers",  style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.black54,)),
                                ),
                                TextButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>burger([]))); },
                                    child: const Text("See More",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: Colors.green, decoration: TextDecoration.underline),)),
                              ],
                            ),
                          ),
                          Center(child: Text("Best Biryani Of India", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              grid(list[6].imPath, list[6].name),
                              grid(list[1].imPath, list[1].name)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              grid(list[0].imPath, list[0].name),
                              grid(list[2].imPath, list[2].name)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              grid(list[5].imPath, list[5].name),
                              grid(list[7].imPath, list[7].name)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              grid(list[4].imPath, list[4].name),
                              grid(list[6].imPath, list[6].name)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              grid(list[3].imPath, list[3].name),
                              grid(list[1].imPath, list[1].name)
                            ],
                          ),
                          Center(child: TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>page2()));
                          },
                              child: const Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("DownLoading .........", style: TextStyle(fontSize: 30),),
                              ))),




                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        );
      }
      ),
    );
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class Data {
  String imPath;
  String txt;
  String name;
  String cost;

  Data({
    required this.imPath,
    required this.txt,
    required this.name,
    required this.cost,
  });
}
class MenuChange extends Cubit<bool>{
  MenuChange() : super(false);
  void ToggleState() =>emit(!state);
}