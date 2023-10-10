import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upcoming/page1.dart';
import 'loginprofil.dart';
TextEditingController emailController = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController loginemailController = TextEditingController();
TextEditingController loginpassword = TextEditingController();
List<TextEditingController> controllersList = [];
class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  String valid="";
  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromARGB(254, 255, 0, 0);
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    Container container(TextEditingController emailController) {
      return Container(
        height: hi,
        width: wi,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(10) , topRight: Radius.circular(10)),
            image: DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2016/08/11/23/48/mountains-1587287_640.jpg",),
              fit: BoxFit.fill,
            )

        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Container(
            alignment: Alignment.center,
            height: hi,
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(30) , topRight: Radius.circular(30)),
                color: Colors.black38
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(valid, style: TextStyle(color: Colors.cyan, decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                  Container(
                    height: hi*0.06,
                    width: wi*0.90,
                    padding: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        controller: loginemailController,
                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Email/Phone Number',
                          contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.user, color: Colors.black,),



                      ),
                  ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    height: hi*0.06,
                    width: wi*0.90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                    ),
                    child: Center(
                      child: TextField(
                        obscuringCharacter: '*',
                        controller: loginpassword,
                        autocorrect: true,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Password',
                          //contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
                          border: InputBorder.none,
                          prefixIcon: Icon(FontAwesomeIcons.lock, color: Colors.black,),

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>loginprofil()));}, child: Text('forget password', style: TextStyle(color: color, decoration: TextDecoration.underline,fontSize: 17, ),))
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){
                        if(emailController.text.isEmpty || password.text.isEmpty || emailController.text!=loginemailController.text || password.text!=loginpassword.text){
                          setState(() {
                            valid="Please enter valid Username/Password";
                          });
                        }
                        else {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Myapp()));
                        }
                      }, child: const Text("Sign In", style: TextStyle(fontSize: 16),)),
                      SizedBox(width: 10,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>loginprofil()));
                      }, child: const Text("Sign Up", style: TextStyle(fontSize: 16)))
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sign as', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.greenAccent),),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.google, color: color,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.amazon,color: color,size: 30,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.microsoft,color: color,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.instagram,color: color,size: 30,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.facebook,color: color,size: 30,)),
                      SizedBox(width: 5,),
                      IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github,color: color,size: 30,)),
                    ],
                  ),

                ],
              ),
            ),

          ),
        ),

      );
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: container(emailController),
      ),

    );
  }
}
