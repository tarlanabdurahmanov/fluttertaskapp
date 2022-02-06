class GoInfoModel {
  int type;
  String title;
  String subTitle;
  double minimumFare;
  double baseFare;
  double distance;
  double timeFare;
  double paidWaiting;

  GoInfoModel({
    required this.type,
    required this.title,
    required this.subTitle,
    required this.minimumFare,
    required this.baseFare,
    required this.distance,
    required this.timeFare,
    required this.paidWaiting,
  });
}
