import 'package:flutter/material.dart';
import 'package:research_20_06_2023/services/get_image_service.dart';

class TabViewImage extends StatefulWidget {
  final Function callBackNumber;
  const TabViewImage({super.key, required this.callBackNumber});

  @override
  State<TabViewImage> createState() => _TabViewImageState();
}

class _TabViewImageState extends State<TabViewImage> {
  List<String> imagesUrl = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    imagesUrl = await fetchImageFromApi();
    setState(() {
      print(imagesUrl.length);
      widget.callBackNumber(imagesUrl.length * 110.0);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imagesUrl = [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: imagesUrl.isEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          imagesUrl.isEmpty
          ? Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: CircularProgressIndicator(),
          )
          : Expanded(
            child: ListView.builder(
              itemCount: imagesUrl.length,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Image.network(imagesUrl[index], width: 100.0, height: 100.0, fit: BoxFit.fitHeight,);
              },
            ),
          )
        ],
      ),
    );
  }
}
