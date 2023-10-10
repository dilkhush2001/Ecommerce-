import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/page2.dart';
import 'package:upcoming/productDetails.dart';
import 'package:upcoming/searchPage.dart';

import 'cake.dart';
import 'cart.dart';
import 'login_page.dart';
import 'loginprofil.dart';
class burger extends StatefulWidget {
  var templist=[];
  burger(this.templist);
  @override
  State<burger> createState() => _burgerState();

}
Color heart=Colors.black38;//yaad se remove kr ke dekhna
class _burgerState extends State<burger> {
  @override
  final List<Widget> _pages = [
    login(),
    page5(),
    loginprofil(),
  ];

  get currIdx => 0;
  Widget build(BuildContext context) {
    void heartFav(int i){
      setState(() {
        if(li[i].color==Colors.black38){
          li[i].color=Colors.red;
        }
        else{
          li[i].color=Colors.black38;
        }
      });
    }
    void rating(int i){
      setState(() {
        if(li[i].ratting.length<9){
          li[i].ratting+=" *";
        }
      });
    }
    void like(int i){
      setState(() {
        if(li[i].up==Colors.black && li[i].down==Colors.black){
          li[i].up=Colors.green;
        }
        else if(li[i].up==Colors.black && li[i].down!=Colors.black){
          li[i].down=Colors.black;
          li[i].up=Colors.green;
        }
        else{
          li[i].up=Colors.black;
        }
      });
    }
    void dislike(int i){
      setState(() {
        if(li[i].down==Colors.black && li[i].up==Colors.black){
          li[i].down=Colors.red;
        }
        else if(li[i].down==Colors.black && li[i].up!=Colors.black){
          li[i].down=Colors.red;
          li[i].up=Colors.black;
        }
        else{
          li[i].down=Colors.black;
        }

      });
    }

    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container container(String imPath, String txt, String ratting, double cost, int i){
      return Container(
        height: hi/6,
        width: wi,
        color: Colors.black12,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>productDetails(i)));},
                child: Container(
                  height: hi/6,
                  width: wi/3,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(imPath),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Container(
              height: hi/6,
              width: wi/3.5,
              //color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(txt, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  SizedBox(height: 20,),
                  TextButton(onPressed: () { rating(i); },child: Text(ratting, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.green),),),
                  SizedBox(height:20),
                  Text('\$ $cost', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ],
              ),
            ),
            SizedBox(width: wi/8,),
            Container(
              height: hi/6,
              width: wi/5.6,
              //color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextButton(onPressed: () { kartCol(i);
                      money(i);
                      },
                        style: TextButton.styleFrom(
                          backgroundColor: li[i].cartcolor,
                          elevation: 30,
                          shadowColor: Colors.black,
                          minimumSize: (Size(2, 35)),
                        ),
                        child:  const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Add ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
                            Icon(Icons.shopping_cart_outlined, color: Colors.black,)
                          ],
                        ),),
                    ),
                  ),
                  SizedBox(height: 5,),
                  IconButton(onPressed: () {  heartFav(i);},icon: Icon(Icons.favorite, color: li[i].color, size: 30,),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){dislike(i);}, icon: Icon(Icons.thumb_down, color: li[i].down,)),
                      IconButton(onPressed: (){like(i);}, icon: Icon(Icons.thumb_up, color: li[i].up,)),

                    ],
                  )
                ],
              ),
            )

          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.red,), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>page2())); },
        ),
        backgroundColor: Colors.greenAccent,
        title: Center(child: Text("Burgers", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, ),)),
        actions:  [
          IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>searchPage()));},
            icon: FaIcon(FontAwesomeIcons.search, color: Colors.black,),),
          SizedBox(width: 30,),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => page5()));
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
      body:ListView.builder(
        itemCount: 28,
        //itemExtent: 200,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int i) {
          if(i<15){
            return containerSkip();
          }
          else if(i==li.length-1){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ElevatedButton(onPressed: (){ Navigator.pop(context);},
                  child: const Center(child: Text("DownLoading........!",selectionColor: Colors.cyan, style: TextStyle(fontSize: 30),),),),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 5, bottom: 5, top: 5, right: 3),
            child: container(li[i].imPath,li[i].txt,li[i].ratting ,li[i].cost, i),
          );

        },



      ),
    );
  }
  void kartCol(int i){
    if(li[i].f){
      setState(() {
        li[i].cartcolor=Colors.green;
        li[i].f=false;
        hm[i]=DataCart(count: 1, imPath: li[i].imPath, cost: li[i].cost, txt: li[i].txt, ratting: li[i].ratting, color: li[i].color, cartcolor: li[i].cartcolor, size: i);

      });
    }
    else{
      setState(() {
        li[i].cartcolor=Colors.cyan;
        li[i].f=true;
        if(hm.containsKey(i)){
          hm.remove(i);
        }
      });
    }
  }

  void money(int i) {
    if(li[i].f){
      setState(() {
        tot-=li[i].cost;
      });
    }
    else{
      setState(() {
        tot+=li[i].cost;
      });
    }
  }

  Widget containerSkip() {
    return Container(
      height: 0.0001,
    );
  }
}
