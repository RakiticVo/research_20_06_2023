import 'dart:math';

import 'package:flutter/material.dart';
import 'package:research_20_06_2023/big_number_model/big_number_model.dart';
import 'package:research_20_06_2023/services/get_data_service.dart';

class TabViewData extends StatefulWidget {
  final Function callBackNumber;
  const TabViewData({super.key, required this.callBackNumber,});

  @override
  State<TabViewData> createState() => _TabViewDataState();
}

class _TabViewDataState extends State<TabViewData> {
  BigNumberModel? bigNumberModel;

  List<String> avgItemName = [];
  List<Object> avgData = [];
  List<String> carbonItemName = [];
  List<Object> carbonData = [];
  List<String> goalItemName = [];
  List<Object> goalData = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    bigNumberModel = await fetchDataFromApi();
    setState(() {
      if(bigNumberModel != null){
        print('goal value = ${bigNumberModel?.goal?.value ?? -1}');
        widget.callBackNumber(5 * 2 * 110.0);

        // Get Avg data
        avgItemName.add('Value');
        avgItemName.add('Percentage');
        avgData.add(bigNumberModel!.localAverage!.value!);
        avgData.add(bigNumberModel!.localAverage!.percentage!);

        // Get Carbon Footprint data
        carbonItemName.add('Last month');
        carbonItemName.add('Current');
        carbonItemName.add('Forecast');
        carbonItemName.add('Carbon Footprint Factor');
        carbonItemName.add('Percentage');
        carbonData.add(bigNumberModel!.carbonFootprint!.lastMonth!);
        carbonData.add(bigNumberModel!.carbonFootprint!.current!);
        carbonData.add(bigNumberModel!.carbonFootprint!.forecast!);
        carbonData.add(bigNumberModel!.carbonFootprint!.carbonFootprintFactor!);
        carbonData.add(bigNumberModel!.carbonFootprint!.percentage!);

        //Get Goal data
        goalItemName.add('Percent Goal Savings');
        goalItemName.add('Value');
        goalItemName.add('Percentage');
        goalData.add(bigNumberModel!.goal!.percentGoalSavings!);
        goalData.add(bigNumberModel!.goal!.value!);
        goalData.add(bigNumberModel!.goal!.percentage!);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bigNumberModel = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: bigNumberModel != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          bigNumberModel != null
          ? Column(
            children: [
              SizedBox(height: 10.0,),
              getItem('Last month', bigNumberModel!.lastMonth!.cost!.value.toString(), bigNumberModel!.lastMonth!.consumption!.value.toString()),
              getItem('Current', bigNumberModel!.current!.cost!.value.toString(), bigNumberModel!.current!.consumption!.value.toString()),
              getItem('Forecast', bigNumberModel!.forecast!.cost!.value.toString(), bigNumberModel!.forecast!.consumption!.value.toString()),
              getOtherItem('Local Average', avgItemName, avgData),
              getOtherItem('Carbon Footprint', carbonItemName, carbonData),
              getOtherItem('Goal', goalItemName, goalData),
            ],
          )
          : const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CircularProgressIndicator(),
          )
        ],
      )
    );
  }

  Widget getItem(String title, String cost, String consumption){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cost: $cost',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                'Consumption: $consumption',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget getOtherItem(String title, List<String> itemName, List<Object> itemData){
    return Padding(
      padding: EdgeInsets.only(left: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          ListView.builder(
            itemCount: itemName.length,
            padding: const EdgeInsets.only(top: 8.0, left: 12.0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Text(
                '${itemName[index]}: ${itemData[index]}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
