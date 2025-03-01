class UserModel {
  String uid;
  String name;
  int age;
  double height;
  double weight;
  String activityLevel;

  UserModel({
    required this.uid,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.activityLevel,
  });

  // Convert to Map for Firebase storage
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'height': height,
      'weight': weight,
      'activityLevel': activityLevel,
    };
  }

  // Convert Map to UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      age: map['age'],
      height: map['height'],
      weight: map['weight'],
      activityLevel: map['activityLevel'],
    );
  }
}
