import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  @override
  State<CalculadoraScreen> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<CalculadoraScreen> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == '=') {
        _calculateResult();
      } else if (value == 'AC') {
        _expression = '';
        _result = '';
      } else if (value == ',') {
        if (_expression.isEmpty || _expression.endsWith((r'[+\-x÷,]'))) {
          _expression += '0.';
        } else if (!_expression.endsWith('.')) {
          _expression += '.';
        }
      } else {
        _expression += value;
      }
    });
  }

  void _calculateResult() {
    try {
      // substituir vírgula por ponto
      String exp = _expression.replaceAll(',', '.');

      // Procurar o operador (suporta somente um operador na expressão)
      RegExp regExp = RegExp(r'([\+\-x÷])');
      Match? match = regExp.firstMatch(exp);

      if (match == null) {
        // Não tem operador, tenta converter direto
        double val = double.parse(exp);
        _result = _formatResult(val);
      } else {
        String op = match.group(0)!;
        int opIndex = match.start;

        // separa os dois operandos
        double num1 = double.parse(exp.substring(0, opIndex));
        double num2 = double.parse(exp.substring(opIndex + 1));

        double res;

        switch (op) {
          case '+':
            res = num1 + num2;
            break;
          case '-':
            res = num1 - num2;
            break;
          case 'x':
            res = num1 * num2;
            break;
          case '÷':
            if (num2 == 0) {
              _showError('Divisão por zero!');
              return;
            }
            res = num1 / num2;
            break;
          default:
            throw Exception('Operador desconhecido');
        }

        _result = _formatResult(res);
      }

      // Limpar expressão para novo cálculo
      _expression = '';
    } catch (e) {
      _result = 'Erro';
    }
  }

  String _formatResult(double val) {
    if (val == val.toInt()) {
      return val.toInt().toString();
    } else {
      return val.toStringAsFixed(4).replaceFirst(RegExp(r'0*$'), '').replaceFirst(RegExp(r'\.$'), '');
    }
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  bool _isOperator(String text) {
    return ['+', '-', 'x', '÷', '=', 'C'].contains(text);
  }

  Widget _buildButton(String text, {Color? bgColor, Color? textColor}) {
    bgColor ??= _isOperator(text) ? Colors.teal : Colors.grey.shade200;
    textColor ??= _isOperator(text) ? Colors.white : Colors.black87;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: textColor,
            padding: const EdgeInsets.symmetric(vertical: 30),
            textStyle: const TextStyle(fontSize: 24),
            shape: CircleBorder()
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(text),
        ),
      ),
    );
  }

  String _getLastNumber(String expression) {
    final regex = RegExp(r'(\d+\.?\d*)$');
    final match = regex.firstMatch(expression);
    if (match != null) {
      return match.group(0)!.replaceAll('.', ',');
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            alignment: Alignment.bottomCenter,
            height: 150,
            child: Text(
              _result.isNotEmpty ? _result : _getLastNumber(_expression),
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),

          const Divider(height: 1),
          Expanded(
            flex: 6,            child: Column(
              children: [
                Row(
                  children: [
                    _buildButton('7', bgColor: Colors.grey),
                    _buildButton('8', bgColor: Colors.grey),
                    _buildButton('9', bgColor: Colors.grey),
                    _buildButton('÷', bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('4', bgColor: Colors.grey),
                    _buildButton('5', bgColor: Colors.grey),
                    _buildButton('6', bgColor: Colors.grey),
                    _buildButton('x', bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('1', bgColor: Colors.grey),
                    _buildButton('2', bgColor: Colors.grey),
                    _buildButton('3', bgColor: Colors.grey),
                    _buildButton('-', bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    _buildButton('AC', bgColor: Colors.black26, textColor: Colors.white38),
                    _buildButton('0', bgColor: Colors.grey),
                    _buildButton(',', bgColor: Colors.grey),
                    _buildButton('+', bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            textStyle: const TextStyle(fontSize: 36),
                            shape: CircleBorder(
                            ),
                          ),
                          onPressed: () => _onButtonPressed('='),
                          child: const Text('='),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
