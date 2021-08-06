import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'routing_state.dart';

class RoutingCubit extends Cubit<RoutingState> {
  RoutingCubit() : super(const InitRoute());
  int _currentTabIndex = 0;
  String _overTabRouteName = '';
  String? _prevRouteName = '';
  int? _productId = 0;

  Future<void> onChangeTab(int? currentTab) async {
    _currentTabIndex = currentTab ?? _currentTabIndex;
    emit(
      ChangeRoute(
        currentTabIndex: _currentTabIndex,
        overTabRouteName: '',
      ),
    );
  }

  Future<void> onChangeRoute({
    required String currentRoute,
    String? prevRouteName,
    int? productId,
  }) async {
    try {
      _overTabRouteName = currentRoute;
      _prevRouteName = prevRouteName;
      _productId = productId;
      emit(
        ChangeRoute(
          currentTabIndex: _currentTabIndex,
          overTabRouteName: _overTabRouteName,
          prevRouteName: _prevRouteName,
          productId: _productId,
        ),
      );
    } on Exception {
      print('onChangeRoute error');
    }
  }
}
