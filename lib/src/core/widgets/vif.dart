
import 'package:flutter/widgets.dart' hide WidgetBuilder;

typedef TestFunction = bool Function();
typedef WidgetBuilder = Widget Function();

class Vif extends StatelessWidget {
  late final TestFunction _test;
  late final WidgetBuilder _widgetBuilder;
  late final WidgetBuilder _elseWidgetBuilder;

  Vif( {
    required TestFunction test,
    required WidgetBuilder ifTrue,
    WidgetBuilder? ifFalse,
    Key? key,
  } ) :
        _test = test,
        _widgetBuilder = ifTrue, super( key: key )
  {
    _elseWidgetBuilder = ifFalse ?? () => const SizedBox();
  }


  @override
  Widget build(BuildContext context) {

    bool result = _test();

    if ( result == true ) {
      return _widgetBuilder();
    } else {
      return _elseWidgetBuilder();
    }
  }
}
