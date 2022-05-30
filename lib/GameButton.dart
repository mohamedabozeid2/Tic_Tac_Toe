import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {

  Color color;
  int index;
  String symbol;
  Function fun;

  GameButton({
    required this.color,
    required this.index,
    required this.symbol,
    required this.fun,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: MaterialButton(
              color: color,
              onPressed: () {
                fun(index);
              },
              child: Text(
                  symbol,
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white ,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        )
    );
  }
}
