import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:workout_app/src/models/exercise_model.dart';
import 'package:workout_app/src/providers/workout_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';
import 'package:workout_app/src/ui/widgets/custom_timer.dart';
import 'package:workout_app/src/ui/widgets/rounded_button.dart';

class WorkoutView extends StatefulWidget {
  final Exercise exercise;
  final Function() onTimerFinished;
  final Function onSkipPressed;

  WorkoutView({
    this.exercise,
    this.onTimerFinished,
    this.onSkipPressed,
  });
  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

class _WorkoutViewState extends State<WorkoutView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: WorkoutProvider(),
      builder: (
        BuildContext context,
        WorkoutProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: blockSizeHorizontal(context) * 15,
              right: blockSizeHorizontal(context) * 5,
              bottom: blockSizeHorizontal(context) * 5,
              left: blockSizeHorizontal(context) * 5,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  50,
                ),
              ),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(
                  blockSizeHorizontal(context) * 5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.exercise.name,
                      style: TextStyle(
                        fontSize: blockSizeHorizontal(context) * 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: blockSizeHorizontal(context) * 70,
                      // height: blockSizeHorizontal(context) * 65,
                      child: Image.asset(
                        widget.exercise.image,
                      ),
                    ),
                    // TODO: try to make this work
                    // Expanded(
                    //   child: Container(
                    //     height: blockSizeHorizontal(context) * 10,
                    //     child: CustomTimer(
                    //       onTimerFinshed: (controller) {
                    //         widget.onTimerFinished(controller);
                    //       },
                    //       radius: blockSizeHorizontal(context) * 35,
                    //       fontSize: blockSizeHorizontal(context) * 10,
                    //       duration: widget.exercise.duration,
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Center(
                        child: Container(
                          height: blockSizeHorizontal(context) * 10,
                          child: CountDown(
                            seconds: widget.exercise.duration.inSeconds,
                            style: TextStyle(
                              fontSize: blockSizeHorizontal(context) * 10,
                              fontWeight: FontWeight.bold,
                            ),
                            onTimer: () {
                              widget.onTimerFinished();
                            },
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RoundedButton(
                          text: 'Cancel',
                          buttonColor: accentColor,
                          onPressed: () async {
                            await provider.navigateToHome();
                          },
                          fontSize: blockSizeHorizontal(context) * 6,
                          padding: EdgeInsets.symmetric(
                            horizontal: blockSizeHorizontal(context) * 10,
                            vertical: blockSizeHorizontal(context) * 2.5,
                          ),
                        ),
                        RoundedButton(
                          text: 'Skip',
                          buttonColor: accentColor,
                          onPressed: widget.onSkipPressed,
                          fontSize: blockSizeHorizontal(context) * 6,
                          padding: EdgeInsets.symmetric(
                            horizontal: blockSizeHorizontal(context) * 10,
                            vertical: blockSizeHorizontal(context) * 2.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: blockSizeHorizontal(context) * 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
