import 'package:workout_app/src/locator.dart';
import 'package:workout_app/src/models/dialog_models.dart';
import 'package:workout_app/src/services/dialog_service.dart';
import 'package:flutter/material.dart';

class DialogManager extends StatefulWidget {
  final Widget child;
  DialogManager({
    Key key,
    this.child,
  }) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  DialogService _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogRequest request) {
    bool isConfirmationDialog = request.cancelTitle != null;
    // bool isActionsPassed = request.actions != null;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            request.title,
          ),
          content: Text(
            request.description,
          ),
          actions: request.actions ??
              <Widget>[
                isConfirmationDialog
                    ? FlatButton(
                        child: Text(
                          request.cancelTitle,
                        ),
                        onPressed: () {
                          _dialogService.dialogComplete(
                            DialogResponse(
                              confirmed: false,
                            ),
                          );
                        },
                      )
                    : Container(),
                FlatButton(
                  child: Text(
                    request.buttonTitle,
                  ),
                  onPressed: () {
                    _dialogService.dialogComplete(
                      DialogResponse(
                        confirmed: true,
                      ),
                    );
                  },
                ),
              ],
        );
      },
    );
  }
}
