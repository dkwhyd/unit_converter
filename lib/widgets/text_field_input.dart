import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldInputMeasures extends StatelessWidget {
  final Function(String) onDataChanged;

  TextFieldInputMeasures({super.key, required this.onDataChanged});

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
              hintText: 'Input Number', border: OutlineInputBorder()),
          // format input berupa angka
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          // controller: _controller,
          onChanged: onDataChanged,
        ),
      ],
    );
  }
}
