import 'package:fluttertaskapp/models/go_info_model.dart';

class GoModel {
  int id;
  int type;
  int count;
  double price;
  GoInfoModel goInfoModel;

  GoModel({
    required this.id,
    required this.type,
    required this.count,
    required this.goInfoModel,
    required this.price,
  });
}
