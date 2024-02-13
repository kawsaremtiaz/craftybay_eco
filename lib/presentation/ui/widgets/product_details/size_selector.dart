import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String _selectedSize;
  @override
  void initState() {
    super.initState();
    _selectedSize = widget.sizes.first;
    widget.onChange(_selectedSize);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .map((s) => InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  _selectedSize = s;
                  widget.onChange(s);
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: CraftyBayAppColors.primaryColor),
                        color: s == _selectedSize
                            ? CraftyBayAppColors.primaryColor
                            : Colors.transparent),
                    child: Center(
                        child: Text(
                      s,
                      style: TextStyle(
                          color:
                              s == _selectedSize ? Colors.white : Colors.grey,
                          fontSize: 10),
                    )),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
