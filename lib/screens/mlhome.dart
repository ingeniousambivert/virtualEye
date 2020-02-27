import 'package:flutter/material.dart';

// For using the BaseAppBar and BaseBottomBar
import 'package:virtualeye/components/appbar.dart';
import 'package:virtualeye/components/bottombar.dart';

class MLVisionList extends StatefulWidget {
  @override
  __MLVisionListState createState() => __MLVisionListState();
}

class __MLVisionListState extends State<MLVisionList> {
  static final List<String> _mlVisionList = <String>[
    'camera_preview_scanner',
    'material_barcode_scanner',
    'picture_scanner',
  ];

  static final List<String> _mlVisionListTitles = <String>[
    'Camera Preview Scanner',
    'Material barcode Scanner',
    'Picture Scanner',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text(
          'Vision',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(),
      ),
      body: ListView.builder(
        itemCount: _mlVisionList.length,
        itemBuilder: (BuildContext context, int index) {
          final String widgetName = _mlVisionListTitles[index];
          final String widgetIndex = _mlVisionList[index];

          return Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: ListTile(
              title: Text(widgetName),
              onTap: () => Navigator.pushNamed(context, '/$widgetIndex'),
            ),
          );
        },
      ),
      bottomNavigationBar: BaseBottomBar(),
    );
  }
}
