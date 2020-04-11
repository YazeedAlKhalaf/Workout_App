import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workout_app/src/providers/workouts_provider.dart';
import 'dart:math' as math;

import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

class CustomTimer extends StatefulWidget {
  final TextStyle timerStringStyle;
  final double radius;
  final Duration duration;
  final Function() onTimerFinshed;
  final bool showControls;
  final double fontSize;

  CustomTimer({
    this.timerStringStyle,
    this.radius,
    @required this.duration,
    this.onTimerFinshed,
    this.showControls = false,
    this.fontSize,
  });
  @override
  CustomTimerState createState() => CustomTimerState();
}

class CustomTimerState extends State<CustomTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  bool isPlaying = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
          blockSizeHorizontal(context) * 1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: Container(
                  width: widget.radius,
                  height: widget.radius,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (
                              BuildContext context,
                              Widget child,
                            ) {
                              return CustomPaint(
                                painter: TimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: primaryColor,
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: FractionalOffset.center,
                          child: InkWell(
                            onTap: () {
                              setState(() => isPlaying = !isPlaying);

                              if (controller.isAnimating) {
                                controller.stop(canceled: true);
                              } else {
                                controller.reverse(
                                  from: controller.value == 0.0
                                      ? 1.0
                                      : controller.value,
                                );
                              }
                            },
                            child: isPlaying
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      AnimatedBuilder(
                                        animation: controller,
                                        builder: (
                                          BuildContext context,
                                          Widget child,
                                        ) {
                                          if (controller.value == 0.00) {
                                            widget.onTimerFinshed();
                                          }
                                          return Text(
                                            timerString,
                                            style: widget.timerStringStyle ??
                                                TextStyle(
                                                  fontSize: widget.fontSize ??
                                                      blockSizeHorizontal(
                                                              context) *
                                                          6,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                : Icon(
                                    Icons.pause,
                                    size: blockSizeHorizontal(context) * 20,
                                    color: primaryColor,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: blockSizeHorizontal(context) * 5,
            ),
            widget.showControls
                ? Container(
                    margin: EdgeInsets.all(
                      blockSizeHorizontal(context) * 1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: primaryColor,
                          child: AnimatedBuilder(
                            animation: controller,
                            builder: (
                              BuildContext context,
                              Widget child,
                            ) {
                              return Icon(
                                controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: blockSizeHorizontal(context) * 1,
                                color: backgroundColor,
                              );
                            },
                          ),
                          onPressed: () {
                            setState(() => isPlaying = !isPlaying);

                            if (controller.isAnimating) {
                              controller.stop(canceled: true);
                            } else {
                              controller.reverse(
                                from: controller.value == 0.0
                                    ? 1.0
                                    : controller.value,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     print('status: ' + status.toString());
    //     print('Animation has finished from painter!');
    //   }
    // });
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      size.center(
        Offset.zero,
      ),
      size.width / 2.0,
      paint,
    );
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(
      Offset.zero & size,
      math.pi * 1.5,
      -progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
