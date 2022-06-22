import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  final audioPlayer = AudioPlayer();



  String _calculatorText = "0.00";
  String _selectedOperator = "none";
  bool _isDecimal = false;
  bool _isFinished = true;
  double _decimal = 0;
  double _lastValue = 0;

  void _changeSelectedOperator(String input)
  {
    if(_selectedOperator == "none"){
      setState((){
        _lastValue = double.tryParse(_calculatorText)!;
        _selectedOperator = input;
        _calculatorText = "0.00";
        _isFinished = true;
        _isDecimal;
      });
    }
  }

  void _calcul()
  {
    if(_lastValue == 0){
      return;
    }

    double result = 0;
    double value = double.tryParse(_calculatorText)!;
    switch(_selectedOperator)
    {
      case "+":
        result = _lastValue + value;
        break;
      case "-":
        result = _lastValue - value;
        break;
      case "*":
        result = _lastValue * value;
        break;
      case "/":
        result = _lastValue / value;
        break;
    }

    setState((){
      _calculatorText = "$result";
      _lastValue = 0;
      _selectedOperator = "none";
      _isFinished = true;
      _isDecimal = false;
    });
  }

  void _calculButtonPressed(String input){
    if(int.tryParse(input) != null)
    {
      if(_isFinished)
      {
        setState((){
          _calculatorText = input;
          _isFinished = false;
        });
      }
      else
      {
        setState((){
          if(_isDecimal)
          {
            List<String> splitted = _calculatorText.split(".");
            splitted.last == "0" ? _calculatorText = "${(double.tryParse(_calculatorText)!)+(int.tryParse(input))!/10}" : _calculatorText += input;

          }
          else
          {
            _calculatorText += input;
          }
          //_isDecimal ? _calculatorText += "${(int.tryParse(input))!/100}" : _calculatorText += input;
        });
      }
    }
    else
    {
        switch(input)
        {
          case "AC" :
            setState((){
              _selectedOperator = "none";
              _calculatorText = "0.00";
              _isFinished = true;
            });
            break;
          case "," :
            setState((){
              _isDecimal = true;
              _calculatorText += ".0";
            });
            break;
          case "/":
            _changeSelectedOperator(input);
            break;
          case "+":
            _changeSelectedOperator(input);
            break;
          case "-":
            _changeSelectedOperator(input);
            break;
          case "*":
            _changeSelectedOperator(input);
            break;
        }
    }



  }


  Widget calculatorButton(String buttonText, double largeur, {Color color = Colors.white}) {
    return Container(
      width: largeur / 4,
      height: largeur / 4,
      padding: const EdgeInsets.all(2),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 34,
            color: Colors.black87,
          ),
        ),
        onPressed: () {_calculButtonPressed(buttonText);},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largeur = (MediaQuery.of(context).size.width)-12;
    const customOrange = Color.fromRGBO(255, 165, 109, 1);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customOrange,
        title: const Text('Calculator'),
      ),
      body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                       Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          _calculatorText,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 80),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton("AC", largeur, color: Colors.red),
                      calculatorButton("√", largeur),
                      calculatorButton("%", largeur),
                      calculatorButton("/", largeur),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton("7", largeur),
                      calculatorButton("8", largeur),
                      calculatorButton("9", largeur),
                      calculatorButton("*", largeur),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton("4", largeur),
                      calculatorButton("5", largeur),
                      calculatorButton("6", largeur),
                      calculatorButton("-", largeur),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton("1", largeur),
                      calculatorButton("2", largeur),
                      calculatorButton("3", largeur),
                      calculatorButton("+", largeur),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calculatorButton(",", largeur),
                      calculatorButton("0", largeur),
                      SizedBox(
                        width: largeur /2,
                        height: largeur/4,
                        child: ElevatedButton(
                          onPressed: () {_calcul();},
                          //shape: StadiumBorder(),
                          child: const Text(
                            "=",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(customOrange),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),

      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
    );
  }
}
