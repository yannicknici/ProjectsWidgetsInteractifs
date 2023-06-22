
class Profile {
  String surname;
  String name;
  int age;
  bool gender;
  double height;
  String secret;
  List<String> hobbies;
  String favoriteLang;

  Profile({
    this.surname ="",
    this.name = "",
    this.age = 0,
    this.gender = true,
    this.height = 0.0,
    this.secret = "",
    this.hobbies = const [],
    this.favoriteLang = 'dart',
});

 // String setName() => "$surname $name";

  String setName(){
    return "$surname $name";
  }

  String setAge(){
    String ageString = "$age an";
    if (age>1){
      ageString += "s";
    }
    return ageString;
  }

  String genderString() => (gender) ? 'feminin' : 'Masculin';

  String setHeight() => '${height.toInt()} cm';

  String setHobbies(){
    String tohobbiesString = '';
    if (hobbies.isEmpty){
      return tohobbiesString;
    }else{
      tohobbiesString = 'mes hobbies sont :';
      for (var hobbies in hobbies) {
        tohobbiesString += '$hobbies,';
      }
      return tohobbiesString;
    }
  }
}