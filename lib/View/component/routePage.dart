

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void routePush({@required BuildContext ctx, @required page}){
  Navigator.of(ctx).push(
    MaterialPageRoute(builder: (ctx) => page)
  );
}