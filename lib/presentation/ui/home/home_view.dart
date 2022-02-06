import 'package:flutter/material.dart';
import '../../../core/constants/fonts.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/enum/string_enums.dart';
import '../../../core/extension/context_extension.dart';
import '../../../data/dummy.dart';
import '../../../models/go_model.dart';
import '../modal/modal_bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PageController _pageController = PageController(initialPage: 1);

  late GoModel selectedGoes;

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
      onTap: () async {
        selectedGoes = goes.where((element) => element.id == go.id).first;
        _pageController = PageController(initialPage: selectedGoes.id);
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          context: context,
          isScrollControlled: true,
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          builder: (context) =>
              ModalBottomSheet(go: selectedGoes, controller: _pageController),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              ImageConstants.instance.carImageTransparent,
              width: 50,
            ),
            SizedBox(width: context.lowValue),
            Text(
              go.type == 1 ? GoEnum.econom.rawValue : GoEnum.comfort.rawValue,
              style: normalTextStyle(),
            ),
            SizedBox(width: context.lowValue),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
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
            const Spacer(),
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
