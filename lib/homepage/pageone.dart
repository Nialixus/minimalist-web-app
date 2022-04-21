import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typewritertext/typewritertext.dart';
import '../animation/arrow.dart';
import 'provider/goone.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key, required this.bottomClick}) : super(key: key);
  final GestureDetector Function(Widget child) bottomClick;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => GoOne(),
        builder: (goOneContext, goOneChild) {
          Provider.of<GoOne>(goOneContext, listen: false).setVisibile();

          return Consumer<GoOne>(
              builder: (context, value, child) => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Visibility(
                            visible: value.visible[4],
                            child: TweenAnimationBuilder<double>(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeIn,
                                tween: Tween(begin: 0, end: 1),
                                builder: (context, value, child) {
                                  return Opacity(
                                    opacity: value,
                                    child: Image.asset(
                                      'assets/lambang.png',
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Visibility(
                          visible: value.visible[1],
                          child: const TypeWriterText(
                            text: Text(
                              'ELLCASE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                  letterSpacing: 5),
                            ),
                            duration: Duration(milliseconds: 100),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: LayoutBuilder(
                              builder: (builderContext, builderConstraints) {
                                TextPainter titlePainter = TextPainter(
                                  textDirection: TextDirection.ltr,
                                  text: const TextSpan(
                                    text: 'ELLCASE',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 70,
                                        letterSpacing: 5),
                                  ),
                                )..layout(
                                    maxWidth: builderConstraints.maxWidth,
                                    minWidth: builderConstraints.minWidth);

                                TextPainter subtitlePainer = TextPainter(
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  text: const TextSpan(
                                    text: 'エルチャセ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                )..layout(
                                    maxWidth: builderConstraints.maxWidth,
                                    minWidth: builderConstraints.minWidth);

                                return SizedBox(
                                    width: titlePainter.width,
                                    height: subtitlePainer.height,
                                    child: Visibility(
                                        visible: value.visible[2],
                                        child: TweenAnimationBuilder<double>(
                                            duration: const Duration(
                                                milliseconds: 1000),
                                            curve: Curves.easeIn,
                                            tween: Tween(begin: 0, end: 1),
                                            builder: (context, val, valChild) =>
                                                Opacity(
                                                    opacity: val,
                                                    child: valChild),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  height: 3,
                                                  color: Colors.black,
                                                )),
                                                const TypeWriterText(
                                                  text: Text(
                                                    'エルチャセ',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                ),
                                                Expanded(
                                                    child: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10),
                                                  height: 3,
                                                  color: Colors.black,
                                                )),
                                              ],
                                            ))));
                              },
                            )),
                        LayoutBuilder(builder: (context, constraints) {
                          TextPainter painter = TextPainter(
                            textDirection: TextDirection.ltr,
                            text: const TextSpan(
                                text: 'PT ELLCASE SETIA HARAPAN',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.5,
                                )),
                          )..layout(
                              maxWidth: constraints.maxWidth,
                              minWidth: constraints.minWidth);
                          return SizedBox(
                            width: painter.width,
                            height: painter.height,
                            child: Visibility(
                              visible: value.visible[4],
                              child: TweenAnimationBuilder<double>(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                  tween: Tween(begin: 0, end: 1),
                                  builder: (context, result, child) => Text(
                                      'PT ELLCASE SETIA HARAPAN',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.5,
                                          color: Colors.black
                                              .withOpacity(result)))),
                            ),
                          );
                        }),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Visibility(
                            visible: value.visible[5],
                            child: bottomClick(
                              Container(
                                color: Colors.transparent,
                                child: Arrow(
                                    duration: const Duration(milliseconds: 750),
                                    color: const Color(0xff222222)
                                        .withOpacity(0.25)),
                              ),
                            ),
                          ),
                        )
                      ]));
        });
  }
}