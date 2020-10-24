import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final String title;
  final Widget body;
  BasePage({
    this.showAppBar = true,
    this.showLeadingAction = true,
    this.title = "",
    this.body,
    Key key,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              automaticallyImplyLeading: widget.showLeadingAction,
              leading: widget.showLeadingAction
                  ? IconButton(
                      icon: Icon(
                        FlutterIcons.arrow_left_fea,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  : null,
              title: Text(
                widget.title,
              ),
            )
          : null,
      body: widget.body,
    );
  }
}
