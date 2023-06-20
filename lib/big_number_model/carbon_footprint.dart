class CarbonFootprint {
  num? lastMonth;
  num? current;
  num? forecast;
  String? percentage;
  double? carbonFootprintFactor;

  CarbonFootprint(
      {this.lastMonth, this.current, this.forecast, this.percentage});

  CarbonFootprint.fromJson(Map<String, dynamic> json) {
    lastMonth = json['last_month'];
    current = json['current'];
    forecast = json['forecast'];
    percentage = json['percentage'];
    carbonFootprintFactor = json['carbon_footprint_factor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_month'] = lastMonth;
    data['current'] = current;
    data['forecast'] = forecast;
    data['percentage'] = percentage;
    data['carbon_footprint_factor'] = carbonFootprintFactor;
    return data;
  }
}
