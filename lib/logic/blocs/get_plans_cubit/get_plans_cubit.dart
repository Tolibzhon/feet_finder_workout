import 'package:feet_finder_workout/logic/model/plan_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_plans_state.dart';
part 'get_plans_cubit.freezed.dart';

class GetPlansCubit extends Cubit<GetPlansState> {
  GetPlansCubit() : super(const GetPlansState.loading());

  Future<void> getPlans() async {
    emit(const GetPlansState.loading());
    try {
      final plans = await getPlansFromServer();

      for (var i = 0; i < plans.length; i++) {
        if (i > 2) {
          plans[i].isPro = true;
        }
      }

      emit(GetPlansState.success(plans));
    } catch (e) {
      emit(GetPlansState.error(e.toString()));
      throw Exception(e);
    }
  }

  Future<List<PlanModel>> getPlansFromServer() async {
    final snapshot = await FirebaseDatabase.instance.ref('plans').get();

    final plansFromServer = <PlanModel>[];
    if (snapshot.value != null) {
      final map = snapshot.value as Map<dynamic, dynamic>;

      map.forEach((key, value) {
        value['id'] = key;
        final workout = PlanModel.fromJson(value);

        plansFromServer.add(workout);
      });
    }
    return plansFromServer;
  }
}
