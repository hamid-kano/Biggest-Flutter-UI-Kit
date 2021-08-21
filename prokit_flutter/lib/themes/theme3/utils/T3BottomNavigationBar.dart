import 'package:flutter/material.dart';
import 'colors.dart';

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int initialIndex;
  final Color? color;
  final Color? buttonBackgroundColor;
  final Color? backgroundColor;
  final ValueChanged<int>? onTap;
  final Curve animationCurve;
  final Duration animationDuration;

  CurvedNavigationBar(
      {Key? key,
      required this.items,
      this.initialIndex = 0,
      this.color = Colors.white,
      this.buttonBackgroundColor,
      this.backgroundColor = Colors.blueAccent,
      this.onTap,
      this.animationCurve = Curves.easeOut,
      this.animationDuration = const Duration(milliseconds: 600)})
      : assert(items.length >= 2),
        assert(0 <= initialIndex && initialIndex < items.length),
        super(key: key);

  @override
  _CurvedNavigationBarState createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar> with SingleTickerProviderStateMixin {
  double? _startingPos;
  int _endingIndex = 0;
  double? _pos;
  double _buttonHide = 0;
  Widget? _icon;
  late AnimationController _animationController;
  int? _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[0];
    _length = widget.items.length;
    _pos = widget.initialIndex / _length!;
    _startingPos = widget.initialIndex / _length!;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos!) / 2;
        if ((endingPos - _pos!).abs() < (_startingPos! - _pos!).abs()) {
          _icon = widget.items[_endingIndex];
        }
        _buttonHide = (1 - ((middle - _pos!) / (_startingPos! - middle)).abs()).abs();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: widget.backgroundColor,
      height: 75.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -40,
            left: _pos! * size.width,
            width: size.width / _length!,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: Material(
                  color: widget.buttonBackgroundColor ?? widget.color,
                  type: MaterialType.circle,
                  shadowColor: shadow_color,
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: _icon,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              painter: NavCustomPainter(_pos!, _length!, widget.color),
              child: Container(
                height: 75.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: 100.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    index: widget.items.indexOf(item),
                    child: item,
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void _buttonTap(int? index) {
    if (widget.onTap != null) {
      widget.onTap!(index!);
    }
    final newPosition = index! / _length!;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition, duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}

class NavButton extends StatelessWidget {
  final double? position;
  final int? length;
  final int? index;
  final ValueChanged<int?>? onTap;
  final Widget? child;

  NavButton({this.onTap, this.position, this.length, this.index, this.child});

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length! * index!;
    final difference = (position! - desiredPosition).abs();
    final verticalAlignment = 1 - length! * difference;
    final opacity = length! * difference;
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap!(index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(0, difference < 1.0 / length! ? verticalAlignment * 40 : 0),
              child: Opacity(opacity: difference < 1.0 / length! * 0.99 ? opacity : 1.0, child: child),
            )),
      ),
    );
  }
}

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color? color;

  NavCustomPainter(double startingLoc, int itemsLength, this.color) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    loc = startingLoc + (span - s) / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
