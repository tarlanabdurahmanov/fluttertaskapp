import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/extension/context_extension.dart';
import 'modal_view.dart';

import '../../../data/dummy.dart';
import '../../../models/go_model.dart';

class ModalBottomSheet extends StatefulWidget {
  final GoModel go;
  final PageController controller;
  const ModalBottomSheet({Key? key, required this.go, required this.controller})
      : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  int _currentIndex = 1;
  bool isLoading = false;
  late GoModel currentGo;

  @override
  void initState() {
    currentGo = widget.go;
    _currentIndex = widget.go.id;
    widget.controller.addListener(() {
      setState(() {
        isLoading = true;
        currentGo = goes
            .where(
                (element) => element.id == widget.controller.page!.toInt() + 1)
            .first;
        delayed();
      });
    });
    super.initState();
  }

  delayed() async {
    await Future.delayed(const Duration(milliseconds: 100));
    setState(() {
      isLoading = false;
    });
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
          return !isLoading
              ? ModalView(go: currentGo)
              : Center(
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                );
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
                margin: const EdgeInsets.only(right: 5),
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
