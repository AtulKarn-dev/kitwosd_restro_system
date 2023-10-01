import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Widget? child;
  final Function? onTap;
  final bool enabled;
  final Color? splashColor;
  final ShapeBorder? customBorder;

  const Ripple(
      {Key? key, this.child, this.onTap, this.enabled = true, this.splashColor,this.customBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget ripple = Positioned.fill(
        child: Material(
      color: Colors.transparent,
      child: InkWell(
        highlightColor: Colors.transparent,
        customBorder: customBorder,
        splashColor: splashColor != null
            ? splashColor!.withAlpha(40)
            : const Color.fromRGBO(0, 0, 0, 0.1),
        onTap: () {
          if (onTap != null) onTap!();
        },
      ),
    ));

    return Stack(
      children: [child!, if (enabled) ripple],
    );
  }
}
