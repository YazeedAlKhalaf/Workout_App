import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:workout_app/src/providers/sets_number_provider.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';
import 'package:workout_app/src/ui/widgets/rounded_button.dart';

class SetsNumberView extends StatefulWidget {
  @override
  _SetsNumberViewState createState() => _SetsNumberViewState();
}

class _SetsNumberViewState extends State<SetsNumberView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: SetsNumberProvider(),
      builder: (
        BuildContext context,
        SetsNumberProvider provider,
        Widget child,
      ) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(
              blockSizeHorizontal(context) * 5,
            ),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: blockSizeHorizontal(context) * 5,
                ),
                Image.asset(
                  'assets/images/misc/banner1.png',
                  width: blockSizeHorizontal(context) * 150,
                ),
                SizedBox(
                  height: blockSizeHorizontal(context) * 10,
                ),
                Form(
                  key: provider.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: provider.setsNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Enter Sets Number',
                          labelStyle: TextStyle(
                            color: textColorBlack,
                            fontSize: blockSizeHorizontal(context) * 7.5,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              50,
                            ),
                          ),
                        ),
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                        ],
                        // TODO: nees some fixing and proofing
                        validator: (value) {
                          if (int.tryParse(value) == null) {
                            return 'Sets number can\'t be empty!';
                          } else if (int.tryParse(value) > 15) {
                            return 'Sets number can\'t be more than 15';
                          }
                        },
                      ),
                      SizedBox(
                        height: blockSizeHorizontal(context) * 5,
                      ),
                      RoundedButton(
                        text: 'Let\'s Go',
                        onPressed: () {
                          provider.save();
                        },
                        fontSize: blockSizeHorizontal(context) * 8,
                        padding: EdgeInsets.symmetric(
                          vertical: blockSizeHorizontal(context) * 2.5,
                          horizontal: blockSizeHorizontal(context) * 7,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
