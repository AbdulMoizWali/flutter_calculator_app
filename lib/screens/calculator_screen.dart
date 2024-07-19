import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

enum Operator {
  c('C', textColor: Colors.green),
  divide('÷', textColor: Colors.green),
  multiply('×', textColor: Colors.green),
  delete('⌫', textColor: Colors.green),
  seven('7'),
  eight('8'),
  nine('9'),
  subtract('-', textColor: Colors.green),
  four('4'),
  five('5'),
  six('6'),
  add('+', textColor: Colors.green),
  one('1'),
  two('2'),
  three('3'),
  equals('=', backgroundColor: Colors.green),
  percentage('%', textColor: Colors.green),
  zero('0'),
  dot('.');

  final dynamic value;
  final Color? textColor;
  final Color? backgroundColor;
  const Operator(
    this.value, {
    this.textColor,
    this.backgroundColor,
  });
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _resultController = "0";
  Operator currentOperator = Operator.equals;
  Operator signOperator = Operator.equals;
  Operator previousOperator = Operator.equals;
  late List<Operator> expressions = [];

  String _getExpression() {
    return expressions.map((operator) => operator.value).join(' ');
  }

  void _getResult() {
    if (expressions.elementAt(1) == Operator.add) {
      _resultController = ((int.tryParse(expressions.elementAt(0).value) ?? 0) +
              (int.tryParse(expressions.elementAt(2).value) ?? 0))
          .toString();
    } else if (expressions.elementAt(1) == Operator.subtract) {
      _resultController = ((int.tryParse(expressions.elementAt(0).value) ?? 0) -
              (int.tryParse(expressions.elementAt(2).value) ?? 0))
          .toString();
    } else if (expressions.elementAt(1) == Operator.multiply) {
      _resultController = ((int.tryParse(expressions.elementAt(0).value) ?? 0) *
              (int.tryParse(expressions.elementAt(2).value) ?? 0))
          .toString();
    } else if (expressions.elementAt(1) == Operator.divide) {
      _resultController = ((int.tryParse(expressions.elementAt(0).value) ?? 0) /
              (int.tryParse(expressions.elementAt(2).value) ?? 0))
          .toString();
    } else if (expressions.elementAt(1) == Operator.percentage) {
      _resultController = ((int.tryParse(expressions.elementAt(0).value) ?? 0) %
              (int.tryParse(expressions.elementAt(2).value) ?? 0))
          .toString();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size viewportSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _resultController,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.end,
              ),
              Text(
                _getExpression(),
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: SizedBox(
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    axisDirection: AxisDirection.down,
                    children: [
                      ...Operator.values.map(
                        (operator) {
                          return StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount:
                                operator == Operator.equals ? 2 : 1,
                            child: IconButton.filledTonal(
                              style: IconButton.styleFrom(
                                backgroundColor: operator.backgroundColor,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    if (operator == Operator.equals) {
                                      _getResult();
                                    } else if (operator == Operator.delete) {
                                      expressions.removeLast();
                                      return;
                                    } else if (operator == Operator.c) {
                                      expressions.clear();
                                      _resultController = "0";
                                    } else {
                                      if (expressions.any((expression) {
                                        bool isOperation = [
                                          Operator.add,
                                          Operator.subtract,
                                          Operator.multiply,
                                          Operator.divide,
                                          Operator.percentage
                                        ].contains(operator);
                                        if (isOperation == false) {
                                          return false;
                                        }
                                        return expression == operator;
                                      })) {
                                        return;
                                      }

                                      expressions.add(operator);
                                    }
                                    setState(() {});
                                  },
                                );
                              },
                              icon: Text(
                                operator.value,
                                style: TextStyle(
                                  color: operator.textColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CalculatorButton {
//   static Map<String, dynamic> ac = {
//     'operator': Operator.c,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> divide = {
//     'operator': Operator.divide,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> multiply = {
//     'operator': Operator.multiply,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> delete = {
//     'operator': Operator.delete,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> seven = {
//     'operator': '7',
//   };
//   static Map<String, dynamic> eight = {
//     'operator': '8',
//   };
//   static Map<String, dynamic> nine = {
//     'operator': '9',
//   };
//   static Map<String, dynamic> subtract = {
//     'operator': Operator.subtract,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> four = {
//     'operator': '4',
//   };
//   static Map<String, dynamic> five = {
//     'operator': '5',
//   };
//   static Map<String, dynamic> six = {
//     'operator': '6',
//   };
//   static Map<String, dynamic> add = {
//     'operator': Operator.add,
//     'textColor': Colors.green,
//   };
//   static Map<String, dynamic> one = {
//     'operator': '1',
//   };
//   static Map<String, dynamic> two = {
//     'operator': '2',
//   };
//   static Map<String, dynamic> three = {
//     'operator': '3',
//   };
//   static Map<String, dynamic> equals = {
//     'operator': Operator.equals,
//     'backgroundColor': Colors.green,
//   };
//   static Map<String, dynamic> percentage = {
//     'operator': Operator.percentage,
//   };
//   static Map<String, dynamic> zero = {
//     'operator': '0',
//   };
//   static Map<String, dynamic> dot = {
//     'operator': Operator.dot,
//   };
//   static List<Map<String, dynamic>> buttons = [
//     ac,
//     divide,
//     multiply,
//     delete,
//     seven,
//     eight,
//     nine,
//     subtract,
//     four,
//     five,
//     six,
//     add,
//     one,
//     two,
//     three,
//     equals,
//     percentage,
//     zero,
//     dot,
//   ];
// }
