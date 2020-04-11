import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:workout_app/src/locator.dart';
import 'package:workout_app/src/models/dialog_models.dart';
import 'package:workout_app/src/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/src/ui/shared/app_colors.dart';
import 'package:workout_app/src/ui/shared/ui_helpers.dart';

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AssetGiffyDialog(
          image: Image.asset(
            request.image ?? 'assets/images/gif/are_you_sure.gif',
            fit: BoxFit.fill,
          ),
          title: Text(
            request.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: textColorBlack,
              fontWeight: FontWeight.bold,
              fontSize: blockSizeHorizontal(context) * 10,
            ),
          ),
          description: Text(
            request.description,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: textColorBlack,
              fontSize: blockSizeHorizontal(context) * 5,
            ),
          ),
          buttonOkText: Text(
            request.buttonTitle,
            style: TextStyle(
              color: textColorWhite,
              fontSize: blockSizeHorizontal(context) * 4,
            ),
          ),
          buttonCancelText: Text(
            request.cancelTitle ?? '',
            style: TextStyle(
              color: textColorWhite,
              fontSize: blockSizeHorizontal(context) * 4,
            ),
          ),
          buttonCancelColor: Colors.red,
          onOkButtonPressed: () {
            _dialogService.dialogComplete(
              DialogResponse(
                confirmed: true,
              ),
            );
          },
          onCancelButtonPressed: () {
            _dialogService.dialogComplete(
              DialogResponse(
                confirmed: false,
              ),
            );
          },
          onlyOkButton: !isConfirmationDialog,
          buttonRadius: 50,
          cornerRadius: 50,
        );
      },
    );
  }
}
