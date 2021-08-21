import 'package:flutter/cupertino.dart';
import 'package:provide/future/home/model/weight_model.dart';

class WeightViewModel with ChangeNotifier {
  List<Weight> _weights = [
    Weight(value: 1, time: DateTime.utc(2019, 1, 4)),
    Weight(value: 2, time: DateTime.utc(2019, 2, 4)),
    Weight(value: 3, time: DateTime.utc(2019, 3, 4)),
    Weight(value: 7, time: DateTime.utc(2019, 4, 4)),
    Weight(value: 8, time: DateTime.utc(2019, 5, 4)),
    Weight(value: 9, time: DateTime.utc(2019, 6, 4)),
    Weight(value: 10, time: DateTime.utc(2019, 7, 4)),
    Weight(value: 11, time: DateTime.utc(2019, 8, 4)),
  ];

  List<Weight> get weight =>_weights;
 Weight get currentWeight => _weights.first;
  add(Weight model) {
    _weights.insert(0, model);
    notifyListeners();
  }
}
