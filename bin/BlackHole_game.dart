import 'dart:io';


class BHGame{
  // String? input;
  // BHGame(
  //     this.input
  //     );
  // && input[0] != input[1] && input[1] != input[2] && input[2] != input[3] && input[3] != input[4]
  start(){
    String? input = stdin.readLineSync();
    if (input != null && input[0] != "0" ) {
      int? parsedInput = int.tryParse(input); //tryParse是轉成數字int
      if (parsedInput != null){
        var r = blackHoleNumber( parsedInput );
        while ( r != 6174 ){
          r = blackHoleNumber(r);
          print(r);
        }
      }else{
        print("請輸入純數字");
      }
    }else{
      print("請輸入有效字");
    }
  }
  int getUnit( int value ){
    double t1 = value / 10;
    int v1 = value - t1.toInt() * 10;
    return v1;
  }

  int blackHoleNumber(int number) {
    int v1 = getUnit(number);

    double t2 = number / 10;
    int number2 = t2.toInt();
    int v2 = getUnit(number2);

    double t3 = number2 / 10;
    int number3 = t3.toInt();
    int v3 = getUnit(number3);

    double t4 = number3 / 10;
    int number4 = t4.toInt();
    int v4 = getUnit(number4);

    var numbers = [v1, v2, v3, v4];
    numbers.sort();

    int sum = 0;
    for (int i = 0; i < 4; i++) {
      sum = sum * 10 + numbers[i];
    }

    int maxSum = 0;
    for (int i = 3; i > -1; i--) {
      maxSum = maxSum * 10 + numbers[i];
    }

    int sumAll = maxSum - sum;
    return sumAll;
  }


}




void main() {
  BHGame bhGame = BHGame();
  bhGame.start();
}