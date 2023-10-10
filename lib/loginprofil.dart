import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upcoming/login_page.dart';
import 'package:otp/otp.dart';
import 'package:otp/otp.dart';
import 'package:timezone/data/latest.dart' as timezone;
import 'package:timezone/timezone.dart' as timezone;
TextEditingController name = TextEditingController();
TextEditingController number = TextEditingController();
TextEditingController age = TextEditingController();
class loginprofil extends StatefulWidget {
  const loginprofil({super.key});
  @override
  State<loginprofil> createState() => _loginprofilState();
}

class _loginprofilState extends State<loginprofil> {


  final TextEditingController firstDigitController = TextEditingController();
  final TextEditingController secondDigitController = TextEditingController();
  final TextEditingController thirdDigitController = TextEditingController();
  final TextEditingController fourthDigitController = TextEditingController();

  final TextEditingController firstDigitControlleremail = TextEditingController();
  final TextEditingController secondDigitControlleremail = TextEditingController();
  final TextEditingController thirdDigitControlleremail= TextEditingController();
  final TextEditingController fourthDigitControlleremail= TextEditingController();

  FocusNode firstDigitFocusNode = FocusNode();
  FocusNode secondDigitFocusNode = FocusNode();
  FocusNode thirdDigitFocusNode = FocusNode();
  FocusNode fourthDigitFocusNode = FocusNode();

  FocusNode firstDigitFocusNodeemail = FocusNode();
  FocusNode secondDigitFocusNodeemail = FocusNode();
  FocusNode thirdDigitFocusNodeemail = FocusNode();
  FocusNode fourthDigitFocusNodeemail = FocusNode();


  String code4="";
  String code4email="";
  String notify="";
  bool isNumberVisible= false;
  bool isEmailVisible=false;
  Color verifyColor=Colors.black12 ;
  String verifyStr='  verify  ';

  Color verifyColorEmail=Colors.black12 ;
  String verifyStrEmail='  verify  ';
  @override
  void initState(){
    super.initState();
    firstDigitFocusNode=FocusNode();
    secondDigitFocusNode=FocusNode();
    thirdDigitFocusNode=FocusNode();
    fourthDigitFocusNode=FocusNode();

    firstDigitFocusNodeemail=FocusNode();
    secondDigitFocusNodeemail=FocusNode();
    thirdDigitFocusNodeemail=FocusNode();
    fourthDigitFocusNodeemail=FocusNode();
    Future.delayed(const Duration(milliseconds: 100),(){
    firstDigitFocusNode.requestFocus();
    });
  }
  @override
  void dispose() {
    firstDigitController.dispose();
    secondDigitController.dispose();
    thirdDigitController.dispose();
    fourthDigitController.dispose();

    firstDigitFocusNode.dispose();
    secondDigitFocusNode.dispose();
    thirdDigitFocusNode.dispose();
    fourthDigitFocusNode.dispose();


    firstDigitControlleremail.dispose();
    secondDigitControlleremail.dispose();
    thirdDigitControlleremail.dispose();
    fourthDigitControlleremail.dispose();

    firstDigitFocusNodeemail.dispose();
    secondDigitFocusNodeemail.dispose();
    thirdDigitFocusNodeemail.dispose();
    fourthDigitFocusNodeemail.dispose();

    super.dispose();
  }
  Widget build(BuildContext context) {
    final now = DateTime.now();
    timezone.initializeTimeZones();
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Column(
          children: [
            Text("Registration Form", style: TextStyle(fontWeight: FontWeight.bold),),

          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        height: hi,
        width: wi,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView(
            //mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  children: [
                    Text("Name    :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: hi*0.07,
                        width: wi/3.2,
                        color: Colors.black12,
                        child:TextField(
                          controller: name,
                          autocorrect: true,
                          keyboardAppearance: Brightness.light,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Name',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                            border: OutlineInputBorder(),
                          )
                      ),
                      ),
                    ),
                  ],
                ),

              ),
              Row(
                children: [
                  Text("Email   :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Container(
                      height: hi*0.07,
                      width: wi/3.2,
                      color: Colors.black12,
                      child:TextField(
                          controller: emailController,
                          autocorrect: true,
                          keyboardAppearance: Brightness.light,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Email',
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                            border: OutlineInputBorder(),
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 3,),
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        isEmailVisible=!isEmailVisible;
                        final code6 = OTP.generateTOTPCodeString('Dilkhush Client Side',
                          DateTime.now().millisecondsSinceEpoch,
                          interval: 10,
                          algorithm: Algorithm.SHA512,//hard level otp
                        );
                        code4email=code6.substring(0, 4);
                        print(code4email);
                        setState(() {});

                      }, child: Text("Gen OTP",)),
                      SizedBox(height: 3,),
                      TextButton(onPressed: () {
                        String otp = firstDigitControlleremail.text + secondDigitControlleremail.text + thirdDigitControlleremail.text + fourthDigitControlleremail.text;
                        if(code4email.isEmpty){
                          showDialog<void>(
                            context: context,
                            //barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Plz Click on The Generate OTP '),
                                content: const Text('Then try to verify your EMAIL OTP dear'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        else if(code4email==otp){
                          verifyColorEmail=Colors.green;
                          verifyStrEmail=' verified ';
                          print('verified');
                        }
                        else{
                           showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Invalid OTP'),
                                content: const Text('The entered OTP does not match. please try again.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        setState(() {
                        });
                      },
                        style: TextButton.styleFrom(
                            backgroundColor: verifyColorEmail
                        ),
                        child: Text(verifyStrEmail, style: TextStyle(fontSize: 14, color: Colors.black),),),
                    ],
                  ),
                  Visibility(
                      visible: isEmailVisible,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDigitTextFieldEmail(firstDigitControlleremail, firstDigitFocusNodeemail),
                          SizedBox(width: 3,),
                          buildDigitTextFieldEmail(secondDigitControlleremail, secondDigitFocusNodeemail),
                          SizedBox(width: 3,),
                          buildDigitTextFieldEmail(thirdDigitControlleremail, thirdDigitFocusNodeemail),
                          SizedBox(width: 3,),
                          buildDigitTextFieldEmail(fourthDigitControlleremail, fourthDigitFocusNodeemail),
                        ],
                      )
                  )

                ],
              ),
              Row(
                children: [
                  Text("Number:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                  Container(
                    height: hi*0.07,
                    width: wi/3.2,
                    color: Colors.black12,
                    child:TextField(
                        controller: number,
                        autocorrect: true,
                        keyboardAppearance: Brightness.light,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Enter your Number',
                          contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                          border: OutlineInputBorder(),
                        )
                    ),
                  ),
                  SizedBox(width: 3,),
                  Column(
                    children: [
                      ElevatedButton(onPressed: (){
                        isNumberVisible=!isNumberVisible;

                        final code6 = OTP.generateTOTPCodeString(
                          'Dilkhush ClientSide',
                          DateTime.now().millisecondsSinceEpoch,
                          interval: 10,
                          algorithm: Algorithm.SHA512,
                        );
                        code4=code6.substring(0, 4);
                        print(code4);
                        setState(() {});



                      }, child: Text("Gen OTP",)),
                      SizedBox(height: 3,),
                      TextButton(onPressed: () {
                        String otp = firstDigitController.text + secondDigitController.text + thirdDigitController.text + fourthDigitController.text;
                          if(code4.isEmpty){
                            showDialog<void>(
                              context: context,
                              //barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Plz Click on The Generate OTP '),
                                  content: const Text('Then try to verify your Mobile No. OTP dear'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          else if(code4==otp){
                            verifyColor=Colors.green;
                            verifyStr=' verified ';
                            print('verified');
                          }
                          else{
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Invalid OTP'),
                                  content: Text('The entered OTP does not match. Please try again.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                          setState(() {
                          });
                      },
                        style: TextButton.styleFrom(
                          backgroundColor: verifyColor
                        ),
                        child: Text(verifyStr, style: TextStyle(fontSize: 14, color: Colors.black),),),
                    ],
                  ),
                  Visibility(
                    visible: isNumberVisible,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildDigitTextField(firstDigitController, firstDigitFocusNode),
                          SizedBox(width: 3,),
                          buildDigitTextField(secondDigitController, secondDigitFocusNode),
                          SizedBox(width: 3,),
                          buildDigitTextField(thirdDigitController, thirdDigitFocusNode),
                          SizedBox(width: 3,),
                          buildDigitTextField(fourthDigitController, fourthDigitFocusNode
                          ),
                        ],
                      )
                  )

                ],
              ),
              Center(
                child: Row(
                  children: [
                    Text("Password:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: hi*0.06,
                        width: wi/2.7,
                        color: Colors.black12,
                        child:TextField(
                            controller: password,
                            autocorrect: true,
                            keyboardAppearance: Brightness.light,
                            keyboardType: TextInputType.visiblePassword,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter your Password',
                              contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
                              border: OutlineInputBorder(),
                            )
                        ),
                      ),
                    ),
                  ],
                ),

              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("Age            :", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: hi*0.05,
                        width: wi/5,
                        color: Colors.black12,
                        child:TextField(
                            controller: age,
                            autocorrect: true,
                            keyboardAppearance: Brightness.light,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(2), // Set the fixed length here
                            ],
                            decoration: const InputDecoration(
                              hintText: 'age',
                              contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                              border: OutlineInputBorder(),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    if(emailController.text.isEmpty || password.text.isEmpty || name.text.isEmpty || number.text.isEmpty || age.text.isEmpty){
                        notify="Please give Complete Information ";
                        setState(() {
                          notify;
                        });
                    }
                    else{
                      loginpassword.text='';
                      loginemailController.text='';
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
                    }
                  },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 30,
                        shadowColor: Colors.cyan
                      ),
                      child: Text('submit', style: TextStyle(color: Colors.black),)),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    name.text='';
                    emailController.text='';
                    loginemailController.text='';
                    age.text='';
                    number.text='';
                    password.text='';
                    loginpassword.text='';
                    notify='';
                    setState(() {
                      notify;
                    });
                  },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          elevation: 30,
                          shadowColor: Colors.cyan
                      ),
                      child: Text('Reset', style: TextStyle(color: Colors.black),))
                ],
              ),
              SizedBox(height: 30,),
              Center(child: Text(notify, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),)),
              SizedBox(height: 12,),
              Center(child: Text("Date Time :${DateTime.now()}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),))
            ],
          ),
        ),


      ),
    );
  }

  Widget buildDigitTextField(TextEditingController controller, FocusNode focusNode) {
        return Container(
          width: 40,
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            textAlign: TextAlign.center,
            maxLength: 1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                counterText: '',
              border: OutlineInputBorder(),

            ),
            onChanged: (val){
              if(val.isNotEmpty){focusNode.unfocus();
              _nextFocus(focusNode);
              }
            },

          ),
        );
  }
  Widget buildDigitTextFieldEmail(TextEditingController controller, FocusNode focusNode) {
    return Container(
      width: 40,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        maxLength: 1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),

        ),
        onChanged: (val){
          if(val.isNotEmpty){focusNode.unfocus();
          _nextFocusEmail(focusNode);
          }
        },

      ),
    );
  }
  void _nextFocus(FocusNode currentFocusNode){
    if (currentFocusNode == firstDigitFocusNode) {
      FocusScope.of(context).requestFocus(secondDigitFocusNode);
    } else if (currentFocusNode == secondDigitFocusNode) {
      FocusScope.of(context).requestFocus(thirdDigitFocusNode);
    } else if (currentFocusNode == thirdDigitFocusNode) {
      FocusScope.of(context).requestFocus(fourthDigitFocusNode);
    }
  }
  void _nextFocusEmail(FocusNode currentFocusNode){
    if (currentFocusNode == firstDigitFocusNodeemail) {
      FocusScope.of(context).requestFocus(secondDigitFocusNodeemail);
    } else if (currentFocusNode == secondDigitFocusNodeemail) {
      FocusScope.of(context).requestFocus(thirdDigitFocusNodeemail);
    } else if (currentFocusNode == thirdDigitFocusNodeemail) {
      FocusScope.of(context).requestFocus(fourthDigitFocusNodeemail);
    }
  }
}


