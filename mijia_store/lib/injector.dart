import 'package:get_it/get_it.dart';
import 'package:mijia_store/src/domain/usecase/update_product_usecase.dart';

import 'src/data/datasource/local/categories.dart';
import 'src/data/datasource/local/products_service.dart';
import 'src/data/repositories/categories_repository_impl.dart';
import 'src/data/repositories/product_repository_impl.dart';
import 'src/domain/repositories/categories_repository.dart';
import 'src/domain/repositories/product_repository.dart';
import 'src/domain/usecase/get_category_products_usecase.dart';
import 'src/domain/usecase/get_product_usecase.dart';

import 'src/presentation/cubit/products/products_cubit.dart';
import 'src/presentation/cubit/routing/routing_cubit.dart';

final GetIt injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // dependencies
  injector.registerSingleton<ProductsService>(ProductsService());
  injector.registerSingleton<Categories>(Categories());

  injector.registerSingleton<CategoriesRepository>(
      CategoriesRepositoryImpl(injector(), injector()));
  injector
      .registerSingleton<ProductRepository>(ProductRepositoryImpl(injector()));

  // usecase
  injector.registerSingleton<GetCategoryProductsUseCase>(
      GetCategoryProductsUseCase(injector()));
  injector.registerSingleton<GetProductUsecase>(GetProductUsecase(injector()));
  injector.registerSingleton<UpdateProductUsecase>(
      UpdateProductUsecase(injector()));

  // cubit
  injector.registerFactory(() => RoutingCubit());
  injector.registerFactory(() => ProductsCubit(
        injector(),
        injector(),
        injector(),
      ));
}
