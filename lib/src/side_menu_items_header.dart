import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:easy_sidemenu/src/global/global.dart';
import 'package:flutter/material.dart';

class SideMenuItemsHeader extends StatefulWidget {
  final List<SideMenuItem> items;
  final SideMenuHeader? sideMenuHeader;
  final EdgeInsetsGeometry? padding;
  SideMenuItemsHeader({
    Key? key,
    required this.items,
    this.sideMenuHeader,
    this.padding,
  }) : super(key: key) {
    // assert(sideMenuHeader == null && items.length == 1);
    // assert(sideMenuHeader != null && items.isNotEmpty);
  }

  @override
  State<SideMenuItemsHeader> createState() => _SideMenuItemsHeaderState();
}

class _SideMenuItemsHeaderState extends State<SideMenuItemsHeader> {
  @override
  void initState() {
    Global.displayModeState.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sideMenuHeader == null) {
      return widget.items.first;
    }
    return Column(
      children: [
        if (Global.displayModeState.value != SideMenuDisplayMode.compact)
          Padding(
            padding: widget.padding ?? const EdgeInsets.all(0),
            child: widget.sideMenuHeader!,
          ),
        ...widget.items,
      ],
    );
  }
}

class SideMenuHeader extends StatelessWidget {
  final Widget? leading;
  final Widget title;
  final Widget? trailing;
  const SideMenuHeader({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) leading!,
        Expanded(
          child: title,
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}
