import 'package:flutter/material.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/extension/context_extension.dart';
import '../../../models/go_model.dart';
import '../../component/modal/modal_about_ride_section.dart';
import '../../component/modal/modal_about_scroll_list.dart';
import '../../component/modal/modal_app_bar.dart';
import '../../component/modal/modal_button.dart';
import '../../component/modal/modal_header_section.dart';

class ModalView extends StatelessWidget {
  const ModalView({Key? key, required this.go}) : super(key: key);
  final GoModel go;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _modalAppBar(),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ModalHeaderSection(go: go),
              SizedBox(height: context.lowValue),
              _aboutSection(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ModalButton(go: go),
    );
  }

  AppBar _modalAppBar() {
    return AppBar(
      elevation: 2,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      centerTitle: false,
      title: ModalAppBarTitle(go: go),
    );
  }

  Container _aboutSection(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text("About ride", style: normalTextStyle(fontSize: 20)),
          ),
          SizedBox(height: context.lowValue),
          const ModalAboutScrollList(),
          SizedBox(height: context.lowValue),
          ModalAboutRideSection(go: go),
        ],
      ),
    );
  }
}
