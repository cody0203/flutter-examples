import '../../core/params/search_params.dart';
import '../../core/resources/data_state.dart';
import '../entities/move/detail/move.dart';
import '../entities/move/list/move.dart';

abstract class MoveRepository {
  Future<DataState<List<MoveInList>>> getMoveList();

  Future<DataState<MoveDetail>> getMove(int id);

  Future<DataState<List<MoveInList>>> searchingMoveByName(
    SearchParams params,
  );
}
