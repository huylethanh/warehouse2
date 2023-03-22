import 'package:warehouse_app/models/error/index.dart';
import 'package:warehouse_app/utils/utils.dart';
import 'package:warehouse_app/widgets/index.dart';

mixin ErrorInvestigator {
  Future<void> investigateError(
      ErrorResponse? error, Function()? callBack) async {
    if (error?.code == 'account_being_used') {
      DialogService.showErrorBotToast('account_being_used');
      await LoginReference().clearAll();
      return AppNavigation.pushReplacementNamed(Routing.login,
          arguments: "account_being_used");
    }

    DialogService.showErrorBotToast(error?.errorMessage ?? "Unknown error");
    callBack?.call();
    return Future.value();
  }
}
