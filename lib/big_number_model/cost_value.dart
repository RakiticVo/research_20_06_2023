class CostValue {
  num? value;
  String? percentage;

  CostValue({this.value, this.percentage});

  CostValue.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['percentage'] = percentage;
    return data;
  }
}
