import 'package:research_20_06_2023/big_number_model/carbon_footprint.dart';
import 'package:research_20_06_2023/big_number_model/cost_value.dart';
import 'package:research_20_06_2023/big_number_model/goal.dart';
import 'package:research_20_06_2023/big_number_model/last_month.dart';

class BigNumberModel {
  LastMonth? lastMonth;
  LastMonth? current;
  LastMonth? forecast;
  CostValue? localAverage;
  CarbonFootprint? carbonFootprint;
  Goal? goal;

  BigNumberModel(
      {this.lastMonth,
        this.current,
        this.forecast,
        this.localAverage,
        this.carbonFootprint,
        this.goal});

  BigNumberModel.fromJson(Map<String, dynamic> json) {
    lastMonth = json['last_month'] != null
        ? LastMonth.fromJson(json['last_month'])
        : null;
    current = json['current'] != null
        ? LastMonth.fromJson(json['current'])
        : null;
    forecast = json['forecast'] != null
        ? LastMonth.fromJson(json['forecast'])
        : null;
    localAverage = json['local_average'] != null
        ? CostValue.fromJson(json['local_average'])
        : null;
    carbonFootprint = json['carbon_footprint'] != null
        ? CarbonFootprint.fromJson(json['carbon_footprint'])
        : null;
    goal = json['goal'] != null ? Goal.fromJson(json['goal']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lastMonth != null) {
      data['last_month'] = lastMonth!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    if (localAverage != null) {
      data['local_average'] = localAverage!.toJson();
    }
    if (carbonFootprint != null) {
      data['carbon_footprint'] = carbonFootprint!.toJson();
    }
    if (goal != null) {
      data['goal'] = goal!.toJson();
    }
    return data;
  }
}