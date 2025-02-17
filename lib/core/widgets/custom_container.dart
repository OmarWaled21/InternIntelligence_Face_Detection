import 'package:face_detection/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String _label;
  final Widget _viewPage;
  final bool featureCompleted;

  const CustomContainer(
    this._label,
    this._viewPage, {
    super.key,
    this.featureCompleted = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.mainColor,
          style: BorderStyle.solid,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(30),
        color: AppColor.whiteColor,
      ),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: ListTile(
        title: Text(
          _label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColor.darkColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          if (!featureCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This feature has not been implemented yet'),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _viewPage),
            );
          }
        },
      ),
    );
  }
}
