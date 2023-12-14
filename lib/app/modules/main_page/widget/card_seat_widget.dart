import 'package:flutter/widgets.dart';

class CardSeatWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? color;

  const CardSeatWidget({
    super.key,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
        ),
      ),
    );
  }
}
