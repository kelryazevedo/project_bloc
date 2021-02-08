import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double radius;
  final double height;
  final double width;
  final Color color;
  final Color shadowColor;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color borderColor;
  final double borderWidth;
  final Function onTap;
  final bool useSkeleton;
  final AlignmentGeometry alignment;

  CustomContainer({
    Key key,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.child,
    this.padding,
    this.margin,
    this.shadowColor,
    this.borderColor,
    this.borderWidth,
    this.onTap,
    this.useSkeleton,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  _buildContent() {
    return Container(
      key: this.key,
      padding: this.useSkeleton == true ? EdgeInsets.all(0) : padding,
      margin: margin,
      height: height,
      width: width,
      decoration: new BoxDecoration(
        color: this.useSkeleton == true ? Colors.transparent : color,
        border: Border.all(
            color: borderColor ?? Colors.transparent, width: borderWidth ?? 0),
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor != null
                ? shadowColor.withOpacity(0.3)
                : Colors.transparent,
            blurRadius: 8.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              1.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: this._buildChild(),
      ),
    );
  }

  _buildChild() {
    return InkWell(
      onTap: this.onTap ?? null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: child,
    );
  }
}
