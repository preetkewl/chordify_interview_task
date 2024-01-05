import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingIndicatorPage extends StatelessWidget {
  const LoadingIndicatorPage({Key? key, required this.loading, required this.child})
      : super(key: key);

  final bool loading;
  final Widget child;

  @override
  build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        loading == true
            ? const Stack(
          children: [
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(
                  dismissible: false, color: Colors.white),
            ),
            Center(
              child: CircularProgressIndicator(
                value: null,
                strokeWidth: 5.0,
              ),
            ),
          ],
        )
            : Container(),
      ],
    );
  }
}
