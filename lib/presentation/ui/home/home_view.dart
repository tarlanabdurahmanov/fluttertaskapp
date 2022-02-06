import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/fonts.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/core/enum/string_enums.dart';
import 'package:fluttertaskapp/core/extension/context_extension.dart';
import 'package:fluttertaskapp/data/dummy.dart';
import 'package:fluttertaskapp/models/go_model.dart';
import 'package:fluttertaskapp/presentation/ui/modal/modal_bottom_sheet.dart';
import 'package:fluttertaskapp/presentation/ui/modal/modal_view.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();
  late GoModel selectedGoes;

  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: context.paddingLow,
        child: ListView.builder(
          itemCount: goes.length,
          itemBuilder: ((context, index) {
            var go = goes[index];
            return _listItem(go, context);
          }),
        ),
      ),
    );
  }

  GestureDetector _listItem(GoModel go, BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedGoes = goes.where((element) => element.id == go.id).first;
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          isScrollControlled: true,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          builder: (context) =>
              ModalBottomSheet(go: selectedGoes, controller: _pageController),
        );
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              ImageConstants.instance.carImage,
              width: 60,
            ),
            SizedBox(width: context.lowValue),
            Text(
              go.type == 1 ? GoEnum.ECONOM.rawValue : GoEnum.COMFORT.rawValue,
              style: normalTextStyle(),
            ),
            SizedBox(width: context.lowValue),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 15,
                  ),
                  Text(
                    go.count.toString(),
                    style: lowTextStyle(),
                  )
                ],
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "~",
                      style: normalTextStyle(),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: go.price.toString(),
                            style: normalTextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          TextSpan(
                            text: '₼',
                            style: normalTextStyle(
                              fontFamily: "",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "more info",
                  style: lowTextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        "Task App",
        style: normalTextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
