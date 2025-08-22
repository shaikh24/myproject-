import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'routes.dart';
import 'services/data_service.dart';
import 'state/cart_state.dart';
import 'state/wishlist_state.dart';
import 'state/auth_state.dart';
import 'ui/pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EcomApp());
}

class EcomApp extends StatelessWidget {
  const EcomApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataService = DataService();

    return MultiProvider(
      providers: [
        Provider<DataService>.value(value: dataService),
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => WishlistState()),
        ChangeNotifierProvider(create: (_) => AuthState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ecom App',
        theme: buildTheme(),
        onGenerateRoute: onGenerateRoute,
        home: SplashPage(dataService: dataService),
      ),
    );
  }
}
