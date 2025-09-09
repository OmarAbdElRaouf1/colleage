import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isChecked); // يكفي تستدعي الأب
      },
      child: AnimatedContainer(
        clipBehavior: Clip.antiAlias,
        duration: const Duration(milliseconds: 100),
        width: 20,
        height: 20,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: widget.isChecked ? Colors.orange : const Color(0xFFDCDEDE),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          color: widget.isChecked ? Colors.orange : Colors.white,
        ),
        child: widget.isChecked
            ? Padding(
                padding: const EdgeInsets.all(1),
                child: Image.asset(
                  "assets/Check.png", // ضع أيقونة صح هنا
                  color: Colors.white,
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
