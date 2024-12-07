import 'package:first_try_signup/Style/Douaa-Style/colors.dart';
import 'package:flutter/material.dart';


class CustomRadioGroup extends StatefulWidget {
  final List<String> options; // Options for the radio buttons
  final String? selectedValue; // Initially selected value
  final ValueChanged<String?> onChanged; // Callback when selection changes
  final Color activeColor; // Customizable active color (optional)

  const CustomRadioGroup({
    Key? key,
    required this.options,
    required this.onChanged,
    this.selectedValue,
    this.activeColor = CheckColor,
  }) : super(key: key);

  @override
  _CustomRadioGroupState createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  String? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.selectedValue; // Initialize with provided value
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.options.map((option) {
        return Row(
          children: [
            Radio<String>(
              value: option,
              groupValue: currentValue,
              onChanged: (value) {
                setState(() {
                  currentValue = value; // Update local state
                });
                widget.onChanged(value); // Notify parent widget
              },
              activeColor: widget.activeColor,
            ),
            Text(
              option,
              style: TextStyle(
                fontSize: 16,
                color: widget.activeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add spacing only after each option except the last one
            if (option != widget.options.last)
              const SizedBox(width: 80), // Adjust spacing to match your design
          ],
        );
      }).toList(),
    );
  }
}

