import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/workouts_provider.dart';
import 'package:workout_app/src/ui/views/workout_view.dart';

class WorkoutsView extends StatefulWidget {
  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: WorkoutsProvider(),
      onModelReady: (WorkoutsProvider provider) {
        provider.initiate();
      },
      builder: (
        BuildContext context,
        WorkoutsProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: PageView.builder(
            // physics: NeverScrollableScrollPhysics(),
            controller: provider.pageController,
            itemCount: provider.exercises.length,
            itemBuilder: (BuildContext context, int index) {
              provider.pageController.addListener(() {
                provider.setCurrentPageValue();
              });
              if (index == provider.currentPageValue.floor()) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(provider.currentPageValue - index),
                  child: WorkoutView(
                    exercise: provider.exercises[index],
                    onTimerFinished: () {
                      print('animating to next page!');
                      provider.nextPage();
                    },
                    onSkipPressed: () async {
                      if (provider.pageController.page + 1 >=
                          provider.exercises.length) {
                        provider.dialogService.showDialog(
                          title: 'This is the last exercise!',
                          description:
                              'I think you have gone too much with skipping!',
                          image: 'assets/images/gif/gone_too_much.gif',
                        );
                      } else {
                        provider.pageController.nextPage(
                          duration: Duration(
                            seconds: 1,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                );
              } else if (index == provider.currentPageValue.floor() + 1) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(provider.currentPageValue - index),
                  child: WorkoutView(
                    exercise: provider.exercises[index],
                    onTimerFinished: () {
                      print('animating 2');
                    },
                  ),
                );
              } else {
                return WorkoutView(
                  exercise: provider.exercises[index],
                  onTimerFinished: () {
                    print('animating 3');
                  },
                );
              }
            },
          ),
        );
      },
    );
  }
}
