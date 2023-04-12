part of 'get_workouts_cubit.dart';

@freezed
class GetWorkoutsState with _$GetWorkoutsState {
  const factory GetWorkoutsState.loading() = _Loading;
  const factory GetWorkoutsState.success(List<WorkoutModel> model) = _Success;
  const factory GetWorkoutsState.error(String error) = _Error;
}
