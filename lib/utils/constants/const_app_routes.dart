import 'package:catbreeds/core/managers/manager.dart' as core;
import 'package:catbreeds/presentation/screens/screen.dart' as screen;

class Routes extends core.RouteManager {
  Routes() {
    // addAll(screen.AdministracionApp().routes);
    // addAll(screen.FabricanteApp().routes);
    // addAll(screen.FincaVirtualApp().routes);
    // addAll(screen.HomeApp().routes);
    // addAll(screen.ProductorApp().routes);
    // addAll(screen.ShoppingApp().routes);
    addAll(screen.SplashApp().routes);
  }
}
