import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String _displayText = '0';
  String _operand = '';
  double? _firstValue;
  double? _secondValue;

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        // Clear everything
        _displayText = '0';
        _operand = '';
        _firstValue = null;
        _secondValue = null;
      } else if (value == '<') {
        // Backspace
        if (_displayText.length > 1) {
          _displayText = _displayText.substring(0, _displayText.length - 1);
        } else {
          _displayText = '0';
        }
      } else if (value == '+/-') {
        // Toggle sign
        if (_displayText != '0') {
          if (_displayText.startsWith('-')) {
            _displayText = _displayText.substring(1);
          } else {
            _displayText = '-$_displayText';
          }
        }
      } else if (value == '%') {
        // Percentage
        final currentValue = double.tryParse(_displayText);
        if (currentValue != null) {
          _displayText = (currentValue / 100).toString();
        }
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        // Handle operator
        if (_firstValue == null) {
          _firstValue = double.tryParse(_displayText);
          _displayText = '0';
        }
        _operand = value;
      } else if (value == '=') {
        // Perform calculation
        _secondValue = double.tryParse(_displayText);
        if (_firstValue != null && _secondValue != null) {
          switch (_operand) {
            case '+':
              _displayText = (_firstValue! + _secondValue!).toString();
              break;
            case '-':
              _displayText = (_firstValue! - _secondValue!).toString();
              break;
            case '×':
              _displayText = (_firstValue! * _secondValue!).toString();
              break;
            case '÷':
              if (_secondValue != 0) {
                _displayText = (_firstValue! / _secondValue!).toString();
              } else {
                _displayText = 'Error';
              }
              break;
            default:
              break;
          }
          _operand = '';
          _firstValue = null;
          _secondValue = null;
        }
      } else {
        // Handle numbers and decimal point
        if (value == '.' && _displayText.contains('.')) {
          return; // Ignore if a decimal point already exists
        }
        if (_displayText == '0') {
          _displayText = value;
        } else {
          _displayText += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: Text(
                _displayText,
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(8),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              // Buttons for the calculator
              for (String value in [
                '<',
                '+/-',
                '%',
                '÷',
                '7',
                '8',
                '9',
                '×',
                '4',
                '5',
                '6',
                '-',
                '1',
                '2',
                '3',
                '+',
                'AC',
                '0',
                '.',
                '=',
              ])
                ElevatedButton(
                  onPressed: () => _onButtonPressed(value),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: value == '='
                        ? Colors.amber
                        : (value == '+' ||
                                value == '-' ||
                                value == '×' ||
                                value == '÷' ||
                                value == '%')
                            ? Colors.blue
                            : (value == '<' || value == '+/-' || value == 'AC')
                                ? Colors.red
                                : Colors.grey,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
