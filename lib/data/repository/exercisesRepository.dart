import 'package:testflutter/constant/strings.dart';
import 'package:testflutter/data/models/exercises.dart';
import 'package:testflutter/data/web-server/exercises_web_servises.dart';

class ExercisesRepository {
  final ExerscisesWebServises exerscisesWebServises;
  ExercisesRepository(this.exerscisesWebServises);

  Future<List<Exercises>> getAllExercises() async {
    //I/flutter (27731): type 'List<dynamic>' is not a subtype of type 'Map<String, dynamic>'
    final exercises = await ExerscisesWebServises().getExerscises();

    List<Exercises> allExercises = [];
    for (var i = 0; i < exercises.length; i++) {
      allExercises.add(Exercises.fromJson(exercises[i]));
      print(allExercises[i].id);
    }
    /*List<Exercises> allExercises = [];
    for (var i = 0; i < exersisisstatic.length; i++) {
      allExercises.add(Exercises.fromJson(exersisisstatic[i]));
      
    }*/

    return allExercises;
  }
}
