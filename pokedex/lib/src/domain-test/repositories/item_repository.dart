import '../../core/params/search_params.dart';
import '../../core/resources/data_state.dart';
import '../entities/item/detail/item.dart';
import '../entities/item/list/item.dart';

abstract class ItemRepository {
  Future<DataState<List<ItemInList>>> getItemList();

  Future<DataState<ItemDetail>> getItem(int id);

  Future<DataState<List<ItemInList>>> searchingItemByName(
    SearchParams params,
  );
}
