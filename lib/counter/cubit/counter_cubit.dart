import 'package:bloc/bloc.dart';
import 'breakdown.dart';

class CounterCubit extends Cubit<Breakdown> {
  CounterCubit() : super(Breakdown('Change'));

  void calculateChange(double cost, double tender) {
    var runningTotal = tender - cost;
    var message = 'Change R$runningTotal breakdown: ';
    var twoHundredRCount = 0;
    var hundredRCount = 0;
    var fiftyRCount = 0;
    var twentyRCount = 0;
    var tenRCount = 0;
    var fiveRCount = 0;
    var twoRCount = 0;
    var oneRCount = 0;
    var fiftyCentCount = 0;
    var twenteCentCount = 0;

    while (runningTotal > 200) {
      runningTotal -= 200;
      twoHundredRCount++;
    }

    if (twoHundredRCount > 0) message += "R200's : $twoHundredRCount ";
    while (runningTotal > 100) {
      runningTotal -= 100;
      hundredRCount++;
    }
    if (hundredRCount > 0) message += "R100's : $hundredRCount ";
    while (runningTotal > 50) {
      runningTotal -= 50;
      fiftyRCount++;
    }
    if (fiftyRCount > 0) message += "R50's : $fiftyRCount ";
    while (runningTotal > 20) {
      runningTotal -= 20;
      twentyRCount++;
    }
    if (twentyRCount > 0) message += "R20's : $twentyRCount ";
    while (runningTotal > 10) {
      runningTotal -= 10;
      tenRCount++;
    }
    if (tenRCount > 0) message += "R10's : $tenRCount ";
    while (runningTotal > 5) {
      runningTotal -= 5;
      fiveRCount++;
    }
    if (fiveRCount > 0) message += "R5's : $fiveRCount ";
    while (runningTotal > 1) {
      runningTotal -= 1;
      oneRCount++;
    }
    if (oneRCount > 0) message += "R1's : $oneRCount ";
    while (runningTotal > 0.5) {
      runningTotal -= 0.5;
      fiftyCentCount++;
    }
    if (fiftyCentCount > 0) message += "50C's : $fiftyCentCount ";
    while (runningTotal > 0.2) {
      runningTotal -= 0.2;
      twenteCentCount++;
    }
    if (twenteCentCount > 0) message += "20C's : $twenteCentCount ";

    if (runningTotal < 0) {
      message = 'Insufficient funds!';
    }
    var breakdown = Breakdown(message);
    emit(breakdown);
  }
}
