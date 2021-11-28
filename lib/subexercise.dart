class ExerciseCatalog{
  static  List<SubExercise> subexercise ;
}
class SubExercise{
  final int id;
  final String name;
  final String image;
  final int time;


  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'time': this.time,
    };
  }

  factory SubExercise.fromMap(Map<String, dynamic> map) {
    return SubExercise(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
      time: map['time'] as int,
    );
  }

  const SubExercise({
     this.id,
     this.name,
     this.image,
     this.time,
  });
}