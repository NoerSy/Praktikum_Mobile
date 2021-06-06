import 'package:flutter/material.dart';
import 'package:modul3/View/ProfilePage/ProfilePage.dart';
import 'package:modul3/thame/PaletteColor.dart';
import 'package:modul3/thame/SpacingDimens.dart';
import 'package:modul3/thame/TypographyStyle.dart';

import 'component/ConfirmationLogoutDialog.dart';

class UserBottomSheetDialog extends StatelessWidget {
  final BuildContext ctx;

  UserBottomSheetDialog({@required this.ctx});

  @override
  Widget build(BuildContext context) {

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 170.0,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          color: PaletteColor.primarybg,
          child: Column(
            children: [
              Container(
                height: 5,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PaletteColor.grey60,
                ),
              ),
              Visibility(
                visible: false,
                child: Container(
                  padding: EdgeInsets.only(
                    top: SpacingDimens.spacing16,
                    bottom: SpacingDimens.spacing16,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: RaisedButton(
                      elevation: 0,
                      color: PaletteColor.blue,
                      onPressed: () {

                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: PaletteColor.primarybg2,
                margin: EdgeInsets.only(
                  top: SpacingDimens.spacing8,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(ctx).push(
                    MaterialPageRoute(
                        builder: (ctx) => ProfilePage(),
                    ),
                  );
                },
                child: actionBottomSheet(
                  icon: Icons.person,
                  title: "My Profile",
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: PaletteColor.primarybg2,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmationLogoutDialog(
                        homePageCtx: ctx,
                        sheetDialogCtx: context,
                      );
                    },
                  );
                },
                child: actionBottomSheet(
                  icon: Icons.logout,
                  title: "Logout",
                ),
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: PaletteColor.primarybg2,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget actionBottomSheet({@required IconData icon, @required String title}) {
    return Container(
      color: PaletteColor.primarybg,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SpacingDimens.spacing16,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: PaletteColor.blue,
            ),
            SizedBox(
              width: SpacingDimens.spacing24,
            ),
            Text(
              title,
              style: TypographyStyle.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
