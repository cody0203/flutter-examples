part of 'routing_cubit.dart';

abstract class RoutingState extends Equatable {
  const RoutingState({
    required this.currentTabIndex,
    required this.overTabRouteName,
    this.productId,
    this.prevRouteName,
  });
  final int currentTabIndex;
  final String overTabRouteName;
  final int? productId;
  final String? prevRouteName;

  @override
  List<Object> get props => <Object>[
        currentTabIndex,
        overTabRouteName,
        productId ?? '',
        prevRouteName ?? '',
      ];
}

class InitRoute extends RoutingState {
  const InitRoute()
      : super(
          currentTabIndex: 0,
          overTabRouteName: '',
        );
}

class ChangeRoute extends RoutingState {
  const ChangeRoute({
    required int currentTabIndex,
    required String overTabRouteName,
    String? prevRouteName,
    int? productId,
  }) : super(
          currentTabIndex: currentTabIndex,
          overTabRouteName: overTabRouteName,
          prevRouteName: prevRouteName,
          productId: productId,
        );
}
