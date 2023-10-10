import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upcoming/burger.dart';
import 'package:upcoming/cake.dart';
import 'package:upcoming/page1.dart';
import 'package:upcoming/page2.dart';
import 'bioOfUser.dart';
import 'cake.dart';
import 'cake.dart';
import 'login_page.dart';
import 'loginprofil.dart';

class page5 extends StatefulWidget {
  const page5({super.key});

  @override

  State<page5> createState() => _page5State();

}
class _page5State extends State<page5> {
  double courier= 24.69;
  var templist=[];
  double ans=0;

  get currIdx => 0;

  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      login(),
      Myapp(),
      BioOfUser()
    ];
    final List<DataCart> cartList = hm.values.toList();
    String s="";
    if(hm.isEmpty){
          setState(() {
            s="Found Not Any Card here";
            tot=0.00;
          });
    }
    Color color=Color.fromARGB(244, 244, 66, 100);
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container container(String imPath){
      return Container(
        height: hi*0.14,
        width: wi*0.24,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)
            ),
            image: DecorationImage(image: NetworkImage(imPath),
              fit: BoxFit.fill,

            )
        ),

      );
    }
    Container taxt(String txt, String rating, double cost){
      return Container(
        height: hi*0.14,
        width: wi*0.40,
        decoration: const BoxDecoration(
          color: Colors.black12,
        ),
        child:  Padding(
          padding: EdgeInsets.only(top: 14, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(txt, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
              SizedBox(height: 8,),
              Text(rating, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),),
              SizedBox(height: 8,),
              Text('\$ $cost',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)
            ],
          ),
        ),
      );
    }
    Container icons(int i){
      return Container(
        height: hi*0.14,
        width: wi*0.34,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), bottomRight: Radius.circular(10)
          ),
            color: Colors.black12
        ),
        child: Row(
          children: [
            IconButton(icon:  Icon(Icons.remove_circle), onPressed: () {
              if(cartList[i].count>1){
                  setState(() {
                    cartList[i].count--;
                    tot-=cartList[i].cost;
                  });
                }
              },),
            SizedBox(width: 8,),
            Text('${cartList[i].count}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(width: 8,),
            IconButton(icon: const Icon(Icons.add_circle), onPressed: ()
            { if(cartList[i].count<9){
              setState(() {
                cartList[i].count++;
                tot+=cartList[i].cost;
              });
            }
             },),
            //SizedBox(width: 10,),
            IconButton(icon:  Icon(Icons.delete), onPressed: () {
              setState(() {
                tot=tot-(cartList[i].count)*cartList[i].cost;
               // templist.add(cartList[i].size);
                if(cartList.contains(i))
                  cartList.removeAt(i);
                 // print("pio");
                  if(hm.containsKey(cartList[i].size)) {
                    hm.remove(cartList[i].size);
                  }
                  li[cartList[i].size].cartcolor=Colors.cyan;
                  li[cartList[i].size].f=true;
                //hm.remove(i);
              });

            },

            ),

          ],
        ),
      );
    }
    Row list(String imPath, String txt, String rating, double cost, int i){
      return Row(
        children: [
          container(imPath),
          taxt(txt, rating, cost),
          icons(i)

        ],
      );
    }
    Container container1(){
      return Container(
        height: hi*0.20,
        width: wi,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12)
        ),

        child:    Padding(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Sub Total :                                                                  \$ ${tot.toStringAsFixed(2)}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 8,),
              Text("Courier :                                                                      \$ $courier", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(height: 8),
              SizedBox(
                height: 14,
              ),
              Text("Total                                                         \$ ${(tot<1?0.00:tot+courier).toStringAsFixed(2)}",style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))

            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading:IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.red,), onPressed: () {
          Navigator.pop(context);

          Navigator.push(context, MaterialPageRoute(builder: (context)=>cake(templist)));
          Navigator.push(context, MaterialPageRoute(builder: (context)=>burger(templist)));
          //templist.clear();
        },
        ),
        title: Center(
          child: Text("Cart", style: TextStyle(color: Colors.red),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>cake(templist)));
              Navigator.push(context, MaterialPageRoute(builder: (context)=>burger(templist)));
              }, icon: Icon(Icons.favorite, color: color,)),
          )
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

      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: hi/2.2,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                itemCount: cartList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int i) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: list(cartList[i].imPath, cartList[i].txt, cartList[i].ratting, cartList[i].cost, i),
                );
              },
              ),
            ),
          ),
          Container(
            height: hi/18,
            width: double.infinity,
            child: Center(child: Text(s, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: color, decoration: TextDecoration.underline),)),
          ),
          container1(),
          Center(child: TextButton(onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>page6()));
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, hi*0.10)),
              ),
              child: Text("Order Place", style: TextStyle(color: Colors.black, fontSize: 22),))),
          //SizedBox(height: ,)
          TextButton(onPressed: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>page6()));
          },
            child: Text('Continue Shoping', style: TextStyle(decoration: TextDecoration.underline, color: color, fontSize: 20, fontWeight: FontWeight.bold),),)

        ],
      ),

    );
  }
}


