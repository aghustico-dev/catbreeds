import 'package:flutter/material.dart';

import 'package:catbreeds/presentation/common/theme/theme_text_stroke.dart'
    as widgets;
import 'package:catbreeds/core/core.dart' as core;
import 'package:catbreeds/utils/util.dart' as utils;

class WidgetScaffold extends StatelessWidget with core.KeyboardManager {
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
      if (core.deviceIsTablet(context)) {
        topWidget = 25.0;
      } else {
        topWidget = 5;
      }
    }
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
            child: widgets.WidgetTextStroke(
                texto: title.toString(),
                fontFamily: 'Roboto',
                fontSize: 16,
                strokeWidth: 2,
                alignment: Alignment.center),
          ),
          const SizedBox(width: 30, height: 30)
        ],
      ),
    );
  }

  Widget buildBotonesTop(BuildContext context) {
    if (Navigator.canPop(context)) {
      return Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Colors.black54.withOpacity(0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 18,
              applyTextScaling: true,
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
