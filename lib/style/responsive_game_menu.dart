import 'package:flutter/material.dart';

class ResponsiveGameMenu extends StatelessWidget {
  final Widget headArea;

  final Widget cardArea;

  final Widget dungeonArea;

  final Widget buttonArea;

  const ResponsiveGameMenu({
    required this.headArea,
    required this.cardArea,
    required this.dungeonArea,
    required this.buttonArea,
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
                  child: headArea,
                ),
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  minimum: padding,
                  child: cardArea,
                ),
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  bottom: false,
                  minimum: padding,
                  child: dungeonArea,
                ),
              ),
              SafeArea(
                top: false,
                maintainBottomViewPadding: true,
                child: Padding(
                  padding: padding,
                  child: Center(
                    child: buttonArea,
                  ),
                ),
              ),
            ],
          );
        } else {
          // "Landscape" / "tablet" mode.

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SafeArea(
                  right: false,
                  maintainBottomViewPadding: true,
                  minimum: padding,
                  child: headArea,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SafeArea(
                    bottom: false,
                    left: false,
                    maintainBottomViewPadding: true,
                    child: Padding(
                      padding: padding,
                      child: cardArea,
                    ),
                  ),
                  SafeArea(
                    bottom: false,
                    left: false,
                    maintainBottomViewPadding: true,
                    child: Padding(
                      padding: padding,
                      child: dungeonArea,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SafeArea(
                  top: false,
                  left: false,
                  maintainBottomViewPadding: true,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: padding,
                      child: buttonArea,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
