import 'package:research_20_06_2023/big_number_model/cost_value.dart';

class LastMonth {
  CostValue? cost;
  CostValue? consumption;

  LastMonth({this.cost, this.consumption});

  LastMonth.fromJson(Map<String, dynamic> json) {
    cost = json['cost'] != null ? CostValue.fromJson(json['cost']) : null;
    consumption = json['consumption'] != null ? CostValue.fromJson(json['consumption']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cost != null) {
      data['cost'] = cost!.toJson();
    }
    if (consumption != null) {
      data['consumption'] = consumption!.toJson();
    }
    return data;
  }
}
