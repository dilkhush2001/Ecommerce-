import 'package:flutter/material.dart';
import 'package:upcoming/page1.dart';
import 'package:upcoming/productDetails.dart';

import 'bioOfUser.dart';
import 'cake.dart';
import 'cart.dart';
import 'login_page.dart';
import 'loginprofil.dart';
class searchPage extends StatefulWidget {
  const searchPage({super.key,});
  @override
  State<searchPage> createState() => _searchPageState();
}
var searchList=<Search>[
];
class _searchPageState extends State<searchPage> {
  TextEditingController searchPageContolllor=TextEditingController();

  get currIdx => 0;
  @override
  Widget build(BuildContext context) {
    // this. is mera 1st time ke liye ui hai
    final List<Widget> _pages = [
      Myapp(),
      page5(),
      cake([]),
      BioOfUser()

    ];
    for (int i = 0; i < li.length; i++) {
      final currentItem = li[i];
      final searchText = searchPageContolllor.text.toLowerCase();
      final itemText = currentItem.txt.toLowerCase();
      if (itemText.contains(searchText)) {
        searchList.add(Search(
          cart: DataCart(
            count: 1,
            imPath: currentItem.imPath,
            cost: currentItem.cost,
            txt: currentItem.txt,
            ratting: currentItem.ratting,
            color: currentItem.color,
            cartcolor: currentItem.cartcolor,
            size: i,
          ),
        ));
      }
    }
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container container(String imPath, String txt, String ratting, double cost, int i){
      return Container(
        height: hi/6,
        width: double.infinity,
        color: Colors.black12,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>productDetails(i)));},
                child: Container(
                  height: hi/6,
                  width: wi/3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                    color: Colors.black,
                    image: DecorationImage(
                        image: NetworkImage(imPath),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: hi/6,
                width: wi/2.3,
               // color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(txt, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SizedBox(height: 20,),
                      TextButton(onPressed: () { rating(i); },child: Text(ratting, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Colors.green),),),
                      SizedBox(height:20),
                      Text('\$ $cost', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 8,),
            Container(
              width: wi/5.3,
             // color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () { kartCol(i);
                  },
                    style: TextButton.styleFrom(
                      backgroundColor: li[i].cartcolor,
                      elevation: 30,
                      shadowColor: Colors.black,
                      minimumSize: (Size(2, 40)),
                    ),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add ", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
                        Icon(Icons.shopping_cart_outlined, color: Colors.black,)
                      ],
                    ),),
                  IconButton(onPressed: () {  heartFav(i);},icon: Icon(Icons.favorite, color: li[i].color, size: 30,),),
                  TextButton(onPressed: () {
                  },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.pink,
                      elevation: 30,
                      shadowColor: Colors.black,
                      minimumSize: (Size(2, 40)),
                    ),
                    child:  const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Buy now", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black ),),
                        Icon(Icons.shopping_cart, color: Colors.black,)
                      ],
                    ),),
                ],
              ),
            )

          ],
        ),
      );
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'basket'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
        ],

      ),
      body: Column(
        children: [
          Container(
            height: hi/10,
            width: double.infinity,
            //color: Colors.green,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: searchPageContolllor,
                  onChanged: (text) {
                    updateSearchList(text);
                  },
                  decoration: const InputDecoration(
                    labelText: 'search',
                    hintText: 'Search for any item here',
                    border:OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = searchList[index].cart;
                return Padding(
                  padding: const EdgeInsets.only(top: 8,),
                  child: container(item.imPath, item.txt, item.ratting, item.cost, item.size),
                );
              },
            ),
          )


        ],
      ),
    );
  }
  void updateSearchList(String searchText) {
    setState(() {
      searchList.clear();
      for (int i = 0; i < li.length; i++) {
        final currentItem = li[i];
        final itemText = currentItem.txt.toLowerCase();
        if (itemText.contains(searchText.toLowerCase())) {
          searchList.add(Search(
            cart: DataCart(
              count: 1,
              imPath: currentItem.imPath,
              cost: currentItem.cost,
              txt: currentItem.txt,
              ratting: currentItem.ratting,
              color: currentItem.color,
              cartcolor: currentItem.cartcolor,
              size: i,
            ),
          ));
        }
      }
    });
  }

  void kartCol(int i) {
    if(li[i].f){
      setState(() {
        tot+=li[i].cost;
        li[i].cartcolor=Colors.green;
        li[i].f=false;
        hm[i]=DataCart(count: 1, imPath: li[i].imPath, cost: li[i].cost, txt: li[i].txt, ratting: li[i].ratting, color: li[i].color, cartcolor: li[i].cartcolor, size: i);

      });
    }
    else{
      setState(() {
        tot-=li[i].cost;
        li[i].cartcolor=Colors.cyan;
        li[i].f=true;
        if(hm.containsKey(i)){
          hm.remove(i);
        }
      });
    }
  }

  void heartFav(int i) {
    setState(() {
      if(li[i].color==Colors.black38){
        li[i].color=Colors.red;
      }
      else{
        li[i].color=Colors.black38;
      }
    });
  }

  void rating(int i) {
    print(hm.length);
    setState(() {
      if(li[i].ratting.length<9){
        li[i].ratting+=" *";
        print("YRG");
      }
    });
  }
}
class Search {
  DataCart cart;
  Search({
    required this.cart,
  });
}

