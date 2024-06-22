import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Future<String> getTitle(){
 return Future.delayed(Duration(seconds: 3),(){
    return "Mi Planta de naranja Lima";
  });
}

String title = "Sin titulo";

setTitle()async{
  title = await getTitle();
  setState(() {});
}

@override
  void initState() {
   //getTitle().then((value){
   //   title = value;
   //   setState(() {});
   // });
    setTitle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}