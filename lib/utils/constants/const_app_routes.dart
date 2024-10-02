import 'package:catbreeds/core/managers/manager.dart' as core;
import 'package:catbreeds/presentation/screens/screen.dart' as screen;

class Routes extends core.RouteManager {
  Routes() {
    addAll(screen.HomeApp().routes);
  }
}
