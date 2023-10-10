import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class StateMenu extends StatelessWidget {
  const StateMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        //lazy: false,
        create: (BuildContext context) => BlocA(),
        child: ChangeMenu(),
      )
    );
  }
}
class ChangeMenu extends StatefulWidget {
  const ChangeMenu({super.key});

  @override
  State<ChangeMenu> createState() => _ChangeMenuState();
}

class _ChangeMenuState extends State<ChangeMenu> {
  @override
  Widget build(BuildContext context) {
    double hi=MediaQuery.of(context).size.height;
    double wi=MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<BlocA, bool>(builder: (context, isMenuOpen){
        return  Stack(
          children: [
            Container(
              color: Colors.greenAccent,
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<BlocA>(context).toggleMenu();
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                transform: Matrix4.translationValues(
                 0,isMenuOpen ? MediaQuery.of(context).size.width *0.9 : 0, 0,
                ),
                child: Container(
                  color: Colors.cyan,
                  child: const Center(
                    child: Column(
                      children: [
                        Text('YES',style: TextStyle(fontSize: 18),),
                        Text('YES',style: TextStyle(fontSize: 18),),
                        Text('YES',style: TextStyle(fontSize: 18),),
                        Text('YES',style: TextStyle(fontSize: 18),),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }
      )
    );
  }
}



class BlocA extends Cubit<bool>{
  BlocA():super(false);
  void toggleMenu() =>emit(!state);
}
