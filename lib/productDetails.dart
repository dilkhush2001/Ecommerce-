import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/bioOfUser.dart';
import 'package:upcoming/login_page.dart';
import 'package:upcoming/loginprofil.dart';
import 'package:upcoming/page1.dart';

import 'cake.dart';
import 'cart.dart';
class productDetails extends StatefulWidget {
  int idx ;
  productDetails(this.idx);
  @override
  State<productDetails> createState() => _productDetailsState();

}

class _productDetailsState extends State<productDetails> {
  @override

  final List<Widget> _pages = [
    Myapp(),
    page5(),
    BioOfUser()
  ];
  int i=0;
  void initState() {
    super.initState();
     i=widget.idx;
  }
  @override
  Widget build(BuildContext context) {
    int currIdx=0;
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container container(){
      return Container(
        height: hi/2.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.cyanAccent,
          image: DecorationImage(image: NetworkImage(li[i].imPath),
            fit: BoxFit.fill
          )
        ),
      );
    }
    Container containerdes(){
      return Container(
        height: hi/3.2,
        width: double.infinity,
        decoration: BoxDecoration(
            //color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
        ),
        child:  Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Product Price :', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(width: 8,),
                  Text('\$ ${li[i].cost}', style: TextStyle(color: Colors.pink, backgroundColor: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),)
                ],
              ),
              SizedBox(height: 10,),
              Text('Product Details :', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
              SizedBox(width: 8,),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(li[i].descrip,style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                ),
              ),
              Row(
                children: [
                  Text('Product Rating :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(width: 8,),
                  Text(li[i].ratting, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30),)
                ],
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.red,), onPressed: () {Navigator.pop(context); },
        ),
        title: Text("Product Details", style: TextStyle(color: Colors.black,),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));}, icon: Icon(Icons.lock, color: Colors.black,)),
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page5()));}, icon: Icon(Icons.shopping_cart_outlined, color: Colors.black,))
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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: containerdes(),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        elevation: 30,
                        backgroundColor: Colors.green,shadowColor: Colors.green,
                      ),
                      child: Text('Click here to Buy ',selectionColor: Colors.pink,style: TextStyle(color: Colors.black),)),
                ),
                Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  child: ElevatedButton(onPressed: (){Navigator.pop(context);},
                      style: ElevatedButton.styleFrom(
                        elevation: 30,
                        backgroundColor: Colors.red,shadowColor: Colors.green,
                      ),
                      child: Text('Cancle ',selectionColor: Colors.pink,style: TextStyle(color: Colors.black),)),
                ),

              ],
            ),
          )
        ],
      ),
    );

  }


}
