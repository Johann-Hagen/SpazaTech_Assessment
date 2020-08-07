import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/simple/simple_calc_cubit.dart';

class SimpleCalcView extends StatelessWidget {
  final TextEditingController costController = TextEditingController(text: '25.50');
  final TextEditingController tenderController = TextEditingController(text: '50');

  void _calculateChange(BuildContext context) {
    BlocProvider.of<SimpleCalcCubit>(context).calculateWithMod(
      double.tryParse(costController.text),
      double.tryParse(tenderController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calc')),
      body: BlocBuilder<SimpleCalcCubit, SimpleCalcState>(
        builder: (context, state) {
          if (state is SimpleCalcCalculated) {
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Product Cost:'),
                      Expanded(child: TextField(controller: costController)),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Tender Amount:'),
                      Expanded(child: TextField(controller: tenderController)),
                    ],
                  ),
                  Text('${state.values ?? ''}'),
                  Expanded(child: Container()),
                  FlatButton(
                    onPressed: () => _calculateChange(context),
                    child: Text('Calculate change'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
