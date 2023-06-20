import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractifsPage extends StatefulWidget {
  const InteractifsPage({super.key});


  @override
  State<InteractifsPage> createState() => InteractifsPageState();
}

class InteractifsPageState extends State<InteractifsPage> {
  @override

  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white60,
       title: const Text('State Managemant', style: TextStyle(color: Colors.brown, fontFamily: CupertinoIcons.iconFont),
       ),
       actions: const [
         Padding(padding: EdgeInsets.only(right: 20),
         child: Icon(Icons.account_circle, color: Colors.brown,),
         )
       ],
     ),
     body:  SingleChildScrollView(
       child: Container(),
     ),
   );
  }

}
