import 'package:flutter/material.dart';

import 'GameButton.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> board = ['', '', '', '', '', '', '', '', ''];

  int player1Score = 0;
  int player2Score = 0;
  List<Color> color = [
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0.2,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Player X  :    Player O",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("$player1Score",
                        style: const TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),),
                      Text(
                        "$player2Score",
                        style: const TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        clearBoard();
                        player1Score = 0;
                        player2Score = 0;
                        setState(() {});
                      },
                      child: const Text(
                        "Reset Score",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  index: 0,
                  symbol: board[0],
                  fun: onButtonClick,
                  color: color[0],
                ),
                GameButton(
                  color: color[1],
                  index: 1,
                  symbol: board[1],
                  fun: onButtonClick,
                ),
                GameButton(
                  color: color[2],
                  index: 2,
                  symbol: board[2],
                  fun: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  color: color[3],
                  index: 3,
                  symbol: board[3],
                  fun: onButtonClick,
                ),
                GameButton(
                  color: color[4],
                  index: 4,
                  symbol: board[4],
                  fun: onButtonClick,
                ),
                GameButton(
                  color: color[5],
                  index: 5,
                  symbol: board[5],
                  fun: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameButton(
                  color: color[6],
                  index: 6,
                  symbol: board[6],
                  fun: onButtonClick,
                ),
                GameButton(
                  color: color[7],
                  index: 7,
                  symbol: board[7],
                  fun: onButtonClick,
                ),
                GameButton(
                  color: color[8],
                  index: 8,
                  symbol: board[8],
                  fun: onButtonClick,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
              child: Container(
                width: double.infinity,
                child: MaterialButton(
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      clearBoard();
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (board[index] != "") {
      return;
    }
    if (counter % 2 == 0) {
      board[index] = "O";
      color[index] = Colors.blue;
    } else {
      board[index] = "X";
      color[index] = Colors.red;
    }
    if (checkWinner(board[index])) {
      if (counter % 2 == 0) {
        player1Score++;
        showDialog(
            context: context,
            builder: (context) =>
            const AlertDialog(
              title: Text("Player O Winner"),
            ));
      } else {
        player2Score++;
        showDialog(
            context: context,
            builder: (context) =>
            const AlertDialog(
              title: Text("Player X Winner"),
            ));
      }

      clearBoard();
    } else {
      counter++;
      if (counter == 9) {
        clearBoard();
      }
    }

    print(counter);

    setState(() {});
  }

  void clearBoard() {
    board = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    color = [
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
      Colors.blueGrey,
    ];
    setState(() {});
  }

  bool checkWinner(String symbol) {
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    } else if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == symbol &&
          board[i + 1] == symbol &&
          board[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (board[i] == symbol &&
          board[i + 3] == symbol &&
          board[i + 6] == symbol) {
        return true;
      }
    }
    return false;
  }
}
