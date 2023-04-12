part of 'get_plans_cubit.dart';

@freezed
class GetPlansState with _$GetPlansState {
  const factory GetPlansState.loading() = _Loading;
  const factory GetPlansState.error(String error) = _Error;
  const factory GetPlansState.success(List<PlanModel> model) = _Success;
}
