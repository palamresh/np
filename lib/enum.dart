enum Gender {
  Male,
  Female,
  Other;
}

class Person {
  String name;
  Gender gender;
  Person({required this.name, required this.gender});
}
