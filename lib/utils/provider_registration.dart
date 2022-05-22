import 'package:knowello/providers/knowello_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get registerProvider {
  return [
    ChangeNotifierProvider(create: (ctx) => KnowelloServiceProvider()),
  ];
}
