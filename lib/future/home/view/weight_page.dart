import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provide/future/home/view_model/weight_view_model.dart';
import 'package:provider/provider.dart';

class WeightPage extends StatelessWidget {
  const WeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        title: const Text(
          'Weight Tracker',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<WeightViewModel>(
        builder: (context, state, widget) {
          return Container(
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Current",
                          textScaleFactor: 1.4,
                        ),
                        const Text(
                          "Weight",
                          textScaleFactor: 1.4,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: state.weight.length,
                      itemBuilder: (BuildContext context, int index) {
                        var val = state.weight[index];
                        return ListTile(
                          title: Text(
                              "${val.time!.month}.${val.time!.day}.${val.time!.year}"),
                          trailing: Text(
                            "${val.value}",
                            textScaleFactor: 2,
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var state = Provider.of<WeightViewModel>(context, listen: false);

            var result = await _showDiyalog(context, state.currentWeight.value);
            if (result != null && result > 0) {
              print(result);
            }
          },
          child: const Icon(Icons.add)),
    );
  }

  Future<double?> _showDiyalog(BuildContext context, double currentWeight) {
    return showDialog<double>(
        barrierColor: Colors.white,
        context: context,
        builder: (context) {
          return DecimalNumberPicker(
            minValue: 0,
            maxValue: 250,
            decimalPlaces: 2,
            value: currentWeight,
            onChanged: (value) {
              print(value);
            },
          );
        });
  }
}
