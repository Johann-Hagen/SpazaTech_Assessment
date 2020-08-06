import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/cubit/breakdown.dart';

import '../counter.dart';
import '../counter.dart';
import '../counter.dart';

// Text('$state', style: textTheme.headline2);
class CounterView extends StatelessWidget {
  final myControlTender = TextEditingController();
  final myControlCost = TextEditingController();
  final myBreakdown = Breakdown('');
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: const Text('Change Calculator')),
        body: SafeArea(
          child: Center(
            child: BlocBuilder<CounterCubit, Breakdown>(
              builder: (context, state) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text('Tender'),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller: myControlTender,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            const Expanded(
                              child: Text('Cost'),
                              flex: 1,
                            ),
                            Expanded(
                              flex: 3,
                              child: TextField(
                                controller: myControlCost,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text('${context.bloc<CounterCubit>().state.breakdown}',
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black)),
                        const SizedBox(height: 20),
                        ClipRect(
                          clipBehavior: Clip.hardEdge,
                          child: FlatButton(
                            color: Colors.yellow,
                            onPressed: () => context
                                .bloc<CounterCubit>()
                                .calculateChange(
                                    double.tryParse(myControlCost.text),
                                    double.tryParse(myControlTender.text)),
                            child: const Text(
                              'Calculate Change',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
