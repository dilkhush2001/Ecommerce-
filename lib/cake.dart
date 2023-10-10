import 'package:flutter/material.dart';
import 'package:upcoming/page2.dart';
import 'package:upcoming/productDetails.dart';

import 'cart.dart';
var li=<Data>[
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/05/23/22/33/birthday-2338813_1280.jpg',cost: 87.98, txt: 'Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: "Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries" ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg',cost:  847.98, txt: 'Cupka muffin', ratting: '*',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'its irresistible combination of fluffy, moist layers and sweet'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2019/02/25/19/27/brownie-4020349_640.jpg', cost:  66.98, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'creamy frosting, its no wonder that \n cake is a beloved treat for all occasions'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/05/23/23/17/dessert-352475_640.jpg', cost:  828.98, txt: 'muffin Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg', cost:  7.98, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2019/02/25/19/27/brownie-4020349_640.jpg', cost:  7.98, txt: 'copkin Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'tender crumb layers. These layers can be made from various ingredients, such as butter'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg', cost:  98.98, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'tender crumb layers. These layers can be made from various ingredients, such as butter'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2019/02/25/19/27/brownie-4020349_640.jpg', cost:  56.98, txt: 'pupkin Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/05/23/23/17/dessert-352475_640.jpg', cost:  87.00, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg', cost:  34.98, txt: 'mani Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'its irresistible combination of fluffy, moist layers and sweet'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/05/23/23/17/dessert-352475_640.jpg', cost: 23.98, txt: 'testi Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/11/21/08/32/muffins-1844458_640.jpg', cost:  87.98, txt: 'low Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/09/14/14/33/cupcake-2749204_640.jpg', cost:  99.99, txt: 'twsry Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cakes come in a wide array of flavors, catering to every palate. You might savor the rich, chocolatey decadence of a classic chocolate cake or indulge in the timeless '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2019/02/25/19/27/brownie-4020349_640.jpg', cost:  56.98, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cakes come in a wide array of flavors, catering to every palate. You might savor the rich, chocolatey decadence of a classic chocolate cake or indulge in the timeless '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2014/08/25/15/32/cream-puffs-427181_640.jpg', cost:  66.98, txt: 'testy Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/03/07/17/30/cake-4910417_640.jpg', cost:  45.98, txt: 'Dessert Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cakes come in a wide array of flavors, catering to every palate. You might savor the rich, chocolatey decadence of a classic chocolate cake or indulge in the timeless '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/11/21/08/32/muffins-1844458_640.jpg', cost:  678.98, txt: 'masi Cake', ratting: '*', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'tender crumb layers. These layers can be made from various ingredients, such as butter'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/03/21/11/17/burger-4953465_640.jpg',cost: 78.98, txt: 'burger', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cakes come in a wide array of flavors, catering to every palate. You might savor the rich, chocolatey decadence of a classic chocolate cake or indulge in the timeless ' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/01/13/03/02/burgers-1976198_640.jpg',cost: 90.98, txt: 'Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/12/29/12/56/burger-3047550_640.jpg',cost: 45.98, txt: 'Cake fav', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Cake is a delectable and indulgent dessert that has captured the hearts and taste buds of people around the world for centuries' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/12/29/12/56/burger-3047550_640.jpg',cost: 11.98, txt: 'fav Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true , descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/03/23/03/58/burger-2167270_640.jpg',cost: 65.78, txt: 'costly Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true , descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist'),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/04/30/06/05/burger-5111533_640.jpg',cost: 90.98, txt: 'Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/08/05/09/07/pizza-5464886_640.jpg',cost: 100.98, txt: 'Cake mostly', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'magifire its irresistible combination of fluffy, moist layers and sweet' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/05/31/04/49/food-5241278_640.jpg',cost: 56.98, txt: 'Cake nice', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true , descrip: 'Cakes come in a wide array of flavors, catering to every palate. You might savor the rich, chocolatey decadence of a classic chocolate cake or indulge in the timeless '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2020/04/30/06/05/burger-5111533_640.jpg',cost: 98.98, txt: 'nice Cake', ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'The true magic of a cake lies in its texture. As you cut into a slice, your knife glides through a soft and airy interior, revealing moist' ),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/04/10/19/46/ice-2219574_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/08/06/04/01/ice-cream-2588541_640.jpg', cost: 64.09, txt: 'Cream russian' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/01/11/07/18/cupcakes-1133146_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375_640.jpg', cost: 760.09, txt: 'Painstaking' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2018/10/21/11/14/ice-3762671_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/08/03/14/38/ice-cream-2576622_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/04/10/19/46/ice-2219574_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2015/09/05/23/54/ice-cream-926426_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/04/04/18/07/ice-cream-2202561_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/01/11/07/18/cupcakes-1133146_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/11/19/10/03/rose-7601741_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/08/03/14/38/ice-cream-2576622_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/11/19/10/03/rose-7601741_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2022/12/06/19/42/winter-7639603_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *', cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2017/08/03/14/38/ice-cream-2576622_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38,f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),
  Data(imPath: 'https://cdn.pixabay.com/photo/2016/01/11/07/18/cupcakes-1133146_640.jpg', cost: 760.09, txt: 'Cream' , ratting: '* *',cartcolor: Colors.cyan,down: Colors.black, up: Colors.black, color: Colors.black38, f: true, descrip: 'Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India ,Today best IceCream  it is the best food in India '),



];
double tot=0.00;
Map<int, DataCart> hm = {};
// var cartList=<DataCart>[];
class cake extends StatefulWidget {
  var templist;
  cake(this.templist);

  @override
  State<cake> createState() => _cakeState();
}
Color heart=Colors.black38;
class _cakeState extends State<cake> {
  @override
  void initState() {
    super.initState();
    var ins=widget.templist;
      setState(() {
        for(var idx in ins){
            // if(hm.containsKey(idx)){
            //   hm.remove(idx);
            // }
           // kartCol(idx);
        }

      });
  }
  @override
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
                title: Center(child: Text("Cakes", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, ),)),
          actions:  [
            Icon(Icons.search_rounded, color: Colors.black,),
            SizedBox(width: 30,),
            IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => page5()));
              }, icon: Icon(Icons.shopping_cart_outlined,  color: Colors.black,)),
            SizedBox(width: 10,),
          ],

        ),
        body:ListView.builder(
          itemCount: 15,
          //itemExtent: 200,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int i) {
            if(i==25){
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
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

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
}
class  Data{
  String imPath;
  double cost;
  String txt;
  String ratting;
  Color color;
  Color cartcolor;
  Color down;
  Color up;
  bool f;
  String descrip;

  Data({
    required this.imPath,
    required this.cost,
    required this.txt,
    required this.ratting,
    required this.color,
    required this.cartcolor,
    required this.down,
    required this.up,
    required this.f,
    required this.descrip,

  });
}
class DataCart{
  int count;
  String imPath;
  double cost;
  String txt;
  String ratting;
  Color color; 
  Color cartcolor;
  int size;

  DataCart({
    required this.count,
    required this.imPath,
    required this.cost,
    required this.txt,
    required this.ratting,
    required this.color,
    required this.cartcolor,
    required this.size,
  });
}


