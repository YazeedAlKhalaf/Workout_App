import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/constants/enums.dart';
import 'package:workout_app/src/providers/settings_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';
import 'package:workout_app/src/ui/widgets/busy_overlay.dart';
import 'package:workout_app/src/ui/widgets/circular_button.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: SettingsProvider(),
      builder: (
        BuildContext context,
        SettingsProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: provider.busy
              ? BusyOverlay(
                  text: 'Changing Mode',
                  show: provider.busy,
                )
              : Padding(
                  padding: EdgeInsets.all(
                    blockSizeHorizontal(context) * 5,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Choose mode',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: blockSizeHorizontal(context) * 15,
                          ),
                        ),
                        SizedBox(
                          height: blockSizeHorizontal(context) * 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            CircularButton(
                              child: Text(
                                'Random',
                                style: TextStyle(
                                  color: textColorWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal(context) * 7,
                                ),
                              ),
                              radius: blockSizeHorizontal(context) * 35,
                              onTap: () {
                                provider.saveMode(
                                  Mode.random,
                                );
                              },
                            ),
                            CircularButton(
                              child: Text(
                                'Day\nWise',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textColorWhite,
                                  fontWeight: FontWeight.bold,
                                  fontSize: blockSizeHorizontal(context) * 7,
                                ),
                              ),
                              radius: blockSizeHorizontal(context) * 35,
                              onTap: () {
                                provider.saveMode(
                                  Mode.dayWise,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
