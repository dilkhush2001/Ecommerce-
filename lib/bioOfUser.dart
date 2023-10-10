import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/EditPro.dart';
import 'package:upcoming/page1.dart';

import 'cart.dart';
import 'login_page.dart';
import 'loginprofil.dart';
class BioOfUser extends StatefulWidget {
  const BioOfUser({super.key});
  @override
  State<BioOfUser> createState() => _BioOfUserState();
}

class _BioOfUserState extends State<BioOfUser> {
  get currIdx => 0;
  @override
  Widget build(BuildContext context) {
    double hi =MediaQuery.of(context).size.height;
    double wi =MediaQuery.of(context).size.width;
    Container container(){
      return Container(
        child: Center(
          child: Column(
              children: [
                  Container(
                    height: hi/4,
                    width: wi/3,
                    decoration:  BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(proImg.text.isEmpty?"https://cdn.pixabay.com/photo/2017/08/07/16/39/girl-2605526_640.jpg":proImg.text),
                            fit: BoxFit.fill
                          )
                      ),
                    ),
                SizedBox(height: 10,),
                Text(name.text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                SizedBox(height: 8,),
                Text(emailController.text),
                //Text("Date Time :${DateTime.now()}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
              ]


          ),
        )
      );
    }
    final List<Widget> _pages = [
      Myapp(),
      page5(),
      page5(),
      login()
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: Text("Uer Bio Details-",style: TextStyle(backgroundColor: Colors.black12, fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
        actions: [
          TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));}, child: Text('logout', style: TextStyle(color: Colors.red, decoration: TextDecoration.underline,fontSize: 20),))
        ],
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.black,), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.purpleAccent,), label: 'favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,), label: 'basket'),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.lock,color: Colors.black,) ,label: 'person'),
        ],
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Container(
          width: wi*0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                container(),
                const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child:  Text('500 Points                   |                 \$30.99', style: TextStyle(fontSize: 20, color: Colors.black45),)),
                Center(child: Text('My Account ',style: TextStyle(fontSize: 20, color: Colors.red))),
                const SizedBox(height: 8,),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8),
                  child: Text('Mobile Number ',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8),
                  child: Text(number.text,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8),
                  child: Text('Mentorship',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8),
                  child: Text('Good',style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                Center(child: Text('Personal Information  ',style: TextStyle(fontSize: 20, color: Colors.red))),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8,),
                  child: Text('Age :',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Text(age.text,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, top: 8,),
                  child: Text('Address :', style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Text(address.text.isEmpty?'address null':address.text,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20,),
                  child: Text('Pin Code :',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Text(pin.text.isEmpty?'Pin Code null':pin.text,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8,),
                  child: Text('City',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Text(city.text.isEmpty?'Pin Code null':city.text,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 8,),
                  child: Text('Country',style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 8, top: 8),
                  child: Text(country,style: TextStyle(fontSize: 16, color: Colors.black54)),
                ),
                SizedBox(height: 20,),
                Center(child: TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditPro()));
                },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      minimumSize: MaterialStateProperty.all(Size(wi*0.70, hi*0.10)),
                    ),
                    child: const Text("Edit Profile", style: TextStyle(color: Colors.black, fontSize: 22),))),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
