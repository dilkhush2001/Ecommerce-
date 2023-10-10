import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upcoming/bioOfUser.dart';
TextEditingController proImg=TextEditingController();
TextEditingController address=TextEditingController();
TextEditingController pin=TextEditingController();
String country="USA";
TextEditingController city=TextEditingController();
class EditPro extends StatefulWidget {
  const EditPro({super.key});

  @override
  State<EditPro> createState() => _EditProState();
}

class _EditProState extends State<EditPro> {
  String selectedCountry ='USA';

  List<String> availableCountries =['USA', 'India', 'Nepal', 'Pakistan', 'Rus',];


  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Container(
          height: hi,
          width: wi*.98,
          color: Colors.black12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: proImg,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Image Path',
                    border:OutlineInputBorder(),
                  hintText: 'Enter Network ImagePath '
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: pin,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                decoration: const InputDecoration(
                    labelText: 'Pin Code',
                    border:OutlineInputBorder(),
                    hintText: 'Enter Pin Code '
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: address,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'Address ',
                    border:OutlineInputBorder(),
                    hintText: 'Enter The your Adress '
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                controller: city,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: 'City ',
                    border:OutlineInputBorder(),
                    hintText: 'Enter The City Name '
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                height: 24,
                width: wi,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Fill Counry Name :", style: TextStyle(fontSize: 18),),
                    SizedBox(width: 8,),
                    DropdownButton<String>(
                      value: country,
                      onChanged: (newValue) {
                        setState(() {
                          country = newValue!;
                        });
                      },
                      items: availableCountries.map((i) {
                        return DropdownMenuItem(
                          value: i,
                          child: Text(i),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Center(child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BioOfUser()));},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent
                ),
                child: Text('submit', style: TextStyle(color: Colors.black),),))
            ],
          ),
        ),
      ),
    );
  }
}
