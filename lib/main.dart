import 'package:flutter/material.dart';

import 'widgets/dropdown_menu.dart';
import 'widgets/text_field_input.dart';
import 'util/convert_util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String? dropdownvalue;
  String? startMeasure;
  String? convertedMeasure;
  double _result = 0;
  String _resultMessage = '';

  double _formData = 0;

  @override
  void initState() {
    startMeasure = 'meters';
    convertedMeasure = 'meters';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Unit Converter '),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Value',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
                TextFieldInputMeasures(
                  onDataChanged: (text) {
                    var input = double.parse(text);
                    setState(() {
                      _formData = input;
                    });
                  },
                ),
                const Text(
                  'From',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
                DropdownMenuMeasures(
                  dropDownChange: onStartMeasureChanged,
                ),
                const Text(
                  'To',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                ),
                DropdownMenuMeasures(
                  dropDownChange: onConvertedMeasureChanged,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => convert(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    child: const Text(
                      'Convert',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  _resultMessage,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onStartMeasureChanged(value) {
    setState(() {
      startMeasure = value;
    });
  }

  void onConvertedMeasureChanged(value) {
    setState(() {
      convertedMeasure = value;
    });
  }

  void convert() {
    // print(_formData.toString());
    // print(startMeasure.toString());
    if (startMeasure!.isEmpty || convertedMeasure!.isEmpty || _formData == 0) {
      _resultMessage = 'please input value';

      // return;
    }

    Conversion c = Conversion();
    double result = c.convert(_formData, startMeasure!, convertedMeasure!);
    setState(() {
      _result = result;
      if (result == 0) {
        _resultMessage = 'This conversion cannot be performed';
      } else {
        _resultMessage =
            '${_formData.toString()} $startMeasure are ${_result.toString()} $convertedMeasure';
      }
    });
  }
}
