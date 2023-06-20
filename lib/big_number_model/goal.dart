class Goal {
  num? percentGoalSavings;
  num? value;
  String? percentage;

  Goal({this.percentGoalSavings, this.value, this.percentage});

  Goal.fromJson(Map<String, dynamic> json) {
    percentGoalSavings = json['percent_goal_savings'];
    value = json['value'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['percentage'] = percentage;
    data['percent_goal_savings'] = percentGoalSavings;
    return data;
  }
}
