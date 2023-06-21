import 'package:corriger_widgets_interactifs/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InteractifsPage extends StatefulWidget {
  const InteractifsPage({super.key});


  @override
  State<InteractifsPage> createState() => InteractifsPageState();
}

class InteractifsPageState extends State<InteractifsPage> {

   Profile myProfile  = Profile( surname: 'yannick', name: 'yao');
   late TextEditingController surname;
   late TextEditingController name;
   late TextEditingController secret;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    surname =TextEditingController();
    name =TextEditingController();
    secret =TextEditingController();
    surname.text = myProfile.surname;
    name.text = myProfile.name;
    secret.text = myProfile.secret;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    surname.dispose();
    name.dispose();
    secret.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.purple,
       title: const Text('Mon profile', style: TextStyle(color: Colors.white, fontFamily: CupertinoIcons.iconFont),
       ),
     ),
     body:  SingleChildScrollView(
       child: Column(
         mainAxisSize: MainAxisSize.max,
         children: [
           Card(
             margin: const EdgeInsets.only(left: 2, top: 0, right: 2, bottom: 10),
             elevation: 10,
             color: Colors.purpleAccent.shade100,
             child: Container(
               width:  MediaQuery.of(context).size.width,
               margin: const EdgeInsets.all(10),
               padding: const EdgeInsets.all(10),
               child: Column(
                 children: [
                   Text(myProfile.setName()),
                   Text( 'Age : ${myProfile.setAge()}'),
                   Text('Taille : ${myProfile.setHeight()}'),
                   Text('Genre : ${myProfile.genderString()}'),
                   Text('Hobbies : ${myProfile.setHobbies()}'),
                   Text('Langage de programmation favori : ${myProfile.favoriteLang}')
                 ],
               ),
             ),
           ),
           const Divider(color: Colors.purpleAccent, thickness: 2,),
           myText(text: 'Modifier les infos', couleur: Colors.red, weight: FontWeight.bold ),
           myTextField(controller: surname, hint: 'entrez votre prenom'),
           myTextField(controller: name, hint: 'entrez votre nom'),
           myTextField(controller: secret, hint: 'donnez nous un secret', isSecret: true)
         ],
       ),
     ),
   );
  }

  Text myText({required String text, required Color couleur, FontWeight weight = FontWeight.normal}) => Text(text, style: TextStyle(fontSize: 18, color: couleur),);

  TextField myTextField({ required TextEditingController controller, required String hint, bool isSecret = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,

      ),
      obscureText: isSecret,
      onSubmitted: ((newValue){
       // print(newValue);
      updateUser();
      }),
    );
  }

  updateUser(){
    setState(() {
      myProfile = Profile(
        surname: (surname.text != myProfile.surname) ? surname.text : myProfile.surname,
        name: (name.text != myProfile.name) ? name.text : myProfile.name,
        secret:(secret.text != myProfile.secret) ? secret.text : myProfile.secret,
      );
    });
  }

}
