import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/extension/context_extension.dart';
import 'package:fluttertaskapp/presentation/ui/modal/modal_view.dart';

import '../../../data/dummy.dart';
import '../../../models/go_model.dart';

class ModalBottomSheet extends StatefulWidget {
  final GoModel go;
  final PageController controller;
  ModalBottomSheet({Key? key, required this.go, required this.controller})
      : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  int _currentIndex = 1;
  int _index = 0;
  bool isLoading = false;
  late GoModel currentGo;

  @override
  void initState() {
    currentGo = widget.go;

    _currentIndex = widget.go.id;

    widget.controller
      ..addListener(() {
        setState(() {
          _index = widget.controller.page!.toInt();
          currentGo = goes.where((element) => element.id == _index + 1).first;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _headerLine(context),
          _body(context),
        ],
      ),
    );
  }

  SizedBox _body(BuildContext context) {
    return SizedBox(
      height: (context.height * 0.9) - 20,
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value + 1;
          });
        },
        controller: widget.controller,
        itemCount: goes.length,
        itemBuilder: ((context, index) {
          return ModalView(go: currentGo);
        }),
      ),
    );
  }

  Container _headerLine(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 1; i <= goes.length; i++)
            Flexible(
              child: Container(
                margin: EdgeInsets.only(right: 5),
                decoration: BoxDecoration(
                  color: _currentIndex == i ? Colors.white : greyColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                height: 3,
                width: ((context.width - context.normalValue) / goes.length),
              ),
            ),
        ],
      ),
    );
  }
}
