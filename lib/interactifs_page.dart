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
   bool showSecret = false;
   Map<String, bool> hobbies = {
     'Musique': false,
     'Programmation': false,
     'Football': false,
     'Films': false,
     'Livres': false
   };

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
       backgroundColor: Colors.deepPurple,
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
             color: Colors.deepPurpleAccent.shade100,
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
                   Text('Langage de programmation favori : ${myProfile.favoriteLang}'),
                   ElevatedButton(
                       onPressed: updateSecret,
                       child: Text((showSecret)? 'cacher secret' : 'Montrer secret'),
                   ),
                   (showSecret) ? Text(myProfile.secret) :  const SizedBox(height: 0, width: 0,),

                 ],
               ),
             ),
           ),
            Divider(color: Colors.deepPurpleAccent.shade100, thickness: 2,),
           myText(text: 'Modifier les infos', couleur: Colors.deepPurpleAccent.shade100, weight: FontWeight.bold ),
           myTextField(controller: surname, hint: 'entrez votre prenom'),
           myTextField(controller: name, hint: 'entrez votre nom'),
           myTextField(controller: secret, hint: 'donnez nous un secret', isSecret: true),
           Padding(padding:  const EdgeInsets.all(10),
           child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Text('Genre : ${myProfile.genderString()}'),
                   Switch(
                       value: myProfile.gender,
                       onChanged: ((newBool){
                         setState(() {
                           myProfile.gender = newBool;
                         });
                       })
                   )
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Text('Taille: ${myProfile.setHeight()}'),
                   Slider(
                       value: myProfile.height,
                       min: 0,
                       max: 240,
                       onChanged: ((newHeight){
                        setState(() {
                          myProfile.height = newHeight;
                        });
                       })
                   )
                 ],
               ),
              Divider(color: Colors.deepPurpleAccent.shade100, thickness: 2,),
              myHobbies(),
             ],
           ),
           )
         ],
       ),
     ),
   );
  }

  Text myText({required String text, required Color couleur, FontWeight weight = FontWeight.normal}) => Text(text, style: TextStyle(fontSize: 18, color: couleur),);

  Padding myTextField({ required TextEditingController controller, required String hint, bool isSecret = false}){
    return Padding(padding: const EdgeInsets.all(10),
      child:  TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border:  OutlineInputBorder(borderRadius: BorderRadius.circular(25))
        ),
        obscureText: isSecret,
        onSubmitted: ((newValue){
          // print(newValue);
          updateUser();
        }),
      ));
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

  updateSecret(){
    setState(() {
      showSecret = !showSecret;
    });
  }

  Column myHobbies (){
    List<Widget> widgets = [];
    hobbies.forEach((hobby, like) {
      Row r = Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobby),
          Checkbox(
              value: like,
              onChanged: (newBool){
                setState(() {
                  hobbies[hobby] = newBool ?? false;
                  List<String> str = [];
                  hobbies.forEach((key, value) {
                    if(value == true){
                      str.add(key);
                    }
                  });
                  myProfile.hobbies = str;
                });
              }
          )
        ],
      );
      widgets.add(r);
    });

    return Column(children: widgets,);
  }
}
