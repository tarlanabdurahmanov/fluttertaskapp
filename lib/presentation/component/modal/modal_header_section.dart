import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/core/extension/context_extension.dart';
import 'package:fluttertaskapp/models/go_model.dart';

class ModalHeaderSection extends StatelessWidget {
  final GoModel go;
  const ModalHeaderSection({Key? key, required this.go}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(go.goInfoModel.title, style: normalTextStyle()),
                // Description
                Text(go.goInfoModel.subTitle,
                    style: lowTextStyle(color: greyColor)),
                Image.asset(ImageConstants.instance.carImage,
                    height: context.height * 0.22),
                SizedBox(height: context.lowValue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
