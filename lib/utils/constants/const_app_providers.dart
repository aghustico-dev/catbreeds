import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:catbreeds/utils/providers/provider.dart' as provider;

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (_) => provider.ProviderConfiguracion()),
];
