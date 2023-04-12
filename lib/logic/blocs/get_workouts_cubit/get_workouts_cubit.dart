import 'package:feet_finder_workout/logic/model/workout_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_workouts_state.dart';
part 'get_workouts_cubit.freezed.dart';

class GetWorkoutsCubit extends Cubit<GetWorkoutsState> {
  GetWorkoutsCubit() : super(const GetWorkoutsState.loading());

  Future<void> getWorkouts(String catogory) async {
    emit(const GetWorkoutsState.loading());
    try {
      final workouts = await getWorkoutsFromServer();

      workouts.removeWhere((e) => e.category != catogory);

      for (var i = 0; i < workouts.length; i++) {
        if (i > 2) {
          workouts[i].isPro = true;
        }
      }

      emit(GetWorkoutsState.success(workouts));
    } catch (e) {
      emit(GetWorkoutsState.error(e.toString()));
      throw Exception(e);
    }
  }

  Future<List<WorkoutModel>> getWorkoutsFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('workouts').get();

    final workoutsFromServer = <WorkoutModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final workout = WorkoutModel.fromJson(value);

        workoutsFromServer.add(workout);
      });
    }
    return workoutsFromServer;
  }
}
