import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ColorPicker(),
    );
  }
}

class ColorPicker extends StatefulWidget {
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  ColorSwatch _mainColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(child: MaterialButton(
      onPressed: () {
        pickColor();
      },
      child: Text(
        'Pick Color',
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'SFUIDisplay',
          fontWeight: FontWeight.bold,
        ),
      ),
      color: _mainColor,
      elevation: 0,
      minWidth: 300,
      height: 50,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    ));
  }

  void openDialog(Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          content:content ,
          actions: [
            FlatButton(
              child: Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            FlatButton(
              child: Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                print(_mainColor);
              },
            ),
          ],
        );
      },
    );
  }

  void pickColor() async {
    openDialog(
        MaterialColorPicker(
          selectedColor: _mainColor,
          allowShades: false,
          colors: fullMaterialColors,
          onMainColorChange: (color) => setState(() => _mainColor = color),
        )
    );
  }
