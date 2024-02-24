import 'package:flutter/material.dart';

class DropdownMenuMeasures extends StatefulWidget {
  final Function dropDownChange;
  const DropdownMenuMeasures({super.key, required this.dropDownChange});

  @override
  State<DropdownMenuMeasures> createState() => _DropdownMenuMeasuresStates();
}

class _DropdownMenuMeasuresStates extends State<DropdownMenuMeasures> {
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  String? dropdownvalue;
  @override
  void initState() {
    dropdownvalue = _measures.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: dropdownvalue,
        items: _measures.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropdownvalue = value;
          });
          widget.dropDownChange(value);
        });
  }
}
