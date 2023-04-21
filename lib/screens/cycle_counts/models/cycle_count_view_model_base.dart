import 'package:warehouse_app/base/view_models/index.dart';
import 'package:warehouse_app/logics/cycle_count_logic/finish_count_logic.dart';
import 'package:warehouse_app/logics/logics.dart';

abstract class CycleCountViewModelBase extends ViewModelBase {
  final startCountUseCase = StartCountLogic();
  final partnerUseCase = PartnerCycleCountLogic();
  final getSessionCountUseCase = GetSessionCountLogic();
  final processCountUseCase = ProcessCountLogic();
  final finishCountUseCase = FinishCountLogic();
}
