import 'package:catbreeds/core/controllers/controller_configuraciones.dart';
import 'package:catbreeds/utils/constants/constant.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:catbreeds/presentation/common/theme/theme_text_scale_size.dart';
import 'package:catbreeds/core/managers/manager_keyboard.dart';
import 'package:catbreeds/utils/util.dart' as utils;

class WidgetScaffold extends StatelessWidget with KeyboardManager {
  final Widget body;
  final bool? gestureDetector;
  final bool? resizeToAvoidBottomInset;
  final bool? top;
  final bool? bottom;
  final Widget? bottomNavigationBar;
  final Color? bodyColor;
  final String? title;
  final bool? fullScreen;
  final TextAlign? textAlign;

  const WidgetScaffold(
      {super.key,
      required this.body,
      this.gestureDetector = false,
      this.resizeToAvoidBottomInset = false,
      this.top = true,
      this.bottom = true,
      this.bottomNavigationBar,
      this.bodyColor = Colors.white,
      this.title = '',
      this.fullScreen = false,
      this.textAlign = TextAlign.left});

  double _getTopWidget(BuildContext context) {
    double topWidget = 5;
    if (top == false) {
      topWidget = 60.0;
    } else {
      if (deviceIsTablet(context)) {
        topWidget = 25.0;
      } else {
        topWidget = 5;
      }
    }

    // margin: (top == false)
    //   ? const EdgeInsets.only(top: 60)
    //   : EdgeInsets.only(top: (deviceIsTablet(context) ? 25 : 5)),

    return topWidget;
  }

  @override
  Widget build(BuildContext context) {
    if (gestureDetector!) {
      return GestureDetector(
          onTap: () => hideKeyboard(context), child: buildScaffold(context));
    }

    return buildScaffold(context);
  }

  Widget buildScaffold(BuildContext context) {
    double topWidget = _getTopWidget(context);

    return Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: SafeArea(
            top: top!,
            bottom: bottom!,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: bodyColor),
              padding: (fullScreen == true)
                  ? EdgeInsets.zero
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width *
                          utils.GlobalConstants.paddingWidth,
                      vertical: MediaQuery.of(context).size.height *
                          utils.GlobalConstants.paddingHeight),
              child: ((fullScreen == true) &&
                      (top == false) &&
                      (utils.isNullOrEmpty(title) == false))
                  ? Stack(
                      children: <Widget>[
                        body,
                        buildAppBar(context, topWidget),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        (utils.isNullOrEmpty(title.toString()))
                            ? const SizedBox.shrink()
                            : buildAppBar(context, topWidget),
                        Expanded(child: body)
                      ],
                    ),
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar);
  }

  Widget buildAppBar(BuildContext context, double topWidget) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: (top == false)
      //     ? const EdgeInsets.only(top: 60)
      //     : EdgeInsets.only(top: (deviceIsTablet(context) ? 25 : 5)),
      margin: EdgeInsets.only(top: topWidget),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width *
              utils.GlobalConstants.paddingWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildBotonesTop(context),
          Expanded(
            child: Text(
              title.toString(),
              style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: GlobalConstants.primary),
              textScaler: ScaleSize.textScaler(context),
              textAlign: textAlign,
            ),
          ),
          const SizedBox(width: 30, height: 30)
        ],
      ),
    );
  }

  Widget buildBotonesTop(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.black54.withOpacity(0.5),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Navigator.canPop(context)
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.close,
                  // FontAwesomeIcons.angleLeft,
                  color: Colors.white,
                  size: 18,
                  applyTextScaling: true,
                  // shadows: <BoxShadow>[
                  //   BoxShadow(
                  //       color: Colors.white,
                  //       blurRadius: 5.0,
                  //       offset: Offset(-0.05, 3.0))
                  // ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
