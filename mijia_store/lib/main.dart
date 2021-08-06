import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bloc_observer.dart';
import 'injector.dart';
import 'src/config/routes/app_router_delegate.dart';
import 'src/config/themes/app_themes.dart';
import 'src/presentation/cubit/add_to_cart/add_to_cart_cubit.dart';
import 'src/presentation/cubit/carts/carts_cubit.dart';
import 'src/presentation/cubit/products/products_cubit.dart';
import 'src/presentation/cubit/routing/routing_cubit.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RoutingCubit>(
          create: (_) => injector(),
        ),
        BlocProvider<ProductsCubit>(
          create: (_) => injector(),
        ),
        BlocProvider<CartsCubit>(
          create: (_) => CartsCubit(),
        ),
        BlocProvider<AddToCartCubit>(
          create: (_) => AddToCartCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mijia Store',
        theme: AppTheme.light,
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          child: Router<dynamic>(
            routerDelegate: AppRouterDelegate<dynamic>(),
          ),
        ),
      ),
    );
  }
}
