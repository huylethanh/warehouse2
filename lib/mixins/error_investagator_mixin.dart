import 'package:warehouse_app/models/error/index.dart';
import 'package:warehouse_app/utils/index.dart';
import 'package:warehouse_app/widgets/index.dart';

mixin ErrorInvestigator {
  void investigateError(ErrorResponse? error, Function()? callBack) {
    if (error?.code == 'account_being_used') {
      DialogService.showErrorBotToast('account_being_used');
      LoginReference().clearAll();
      AppNavigation.pushReplacementNamed(Routing.login,
          arguments: "account_being_used");
      return;
    }

    DialogService.showErrorBotToast(error?.errorMessage ?? "Unknown error");
    callBack?.call();
  }
}
