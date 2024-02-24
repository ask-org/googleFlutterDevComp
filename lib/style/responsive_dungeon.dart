import 'package:flutter/material.dart';

class ResponsiveDungeon extends StatelessWidget {
  final Widget squarishMainArea;

  final Widget leftResourceArea;

  final Widget rightControllerArea;

  final Widget topMessageArea;

  const ResponsiveDungeon({
    required this.leftResourceArea,
    required this.squarishMainArea,
    required this.rightControllerArea,
    this.topMessageArea = const SizedBox.shrink(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // This widget wants to fill the whole screen.
        final size = constraints.biggest;
        final padding = EdgeInsets.all(size.shortestSide / 30);

        if (size.height >= size.width) {
          // "Portrait" / "mobile" mode.
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: padding,
                  child: topMessageArea,
                ),
              ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: padding,
                  child: leftResourceArea,
                ),
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  minimum: padding,
                  child: squarishMainArea,
                ),
              ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: padding,
                  child: rightControllerArea,
                ),
              ),
            ],
          );
        } else {
          // "Landscape" / "tablet" mode.
          final isLarge = size.width > 900;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 3,
                  child: Expanded(
                    child: SafeArea(
                      top: false,
                      left: false,
                      maintainBottomViewPadding: true,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: padding,
                          child: leftResourceArea,
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: isLarge ? 10 : 2,
                child: SafeArea(
                  right: false,
                  maintainBottomViewPadding: true,
                  minimum: padding,
                  child: squarishMainArea,
                ),
              ),
              Expanded(
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: padding,
                      child: rightControllerArea,
                    ),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
