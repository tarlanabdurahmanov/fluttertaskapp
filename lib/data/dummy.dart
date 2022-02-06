import 'package:fluttertaskapp/core/constants/colors.dart';
import 'package:fluttertaskapp/core/constants/image/image_constants.dart';
import 'package:fluttertaskapp/models/go_info_model.dart';
import 'package:fluttertaskapp/models/go_model.dart';
import 'package:fluttertaskapp/models/ride_model.dart';

final goes = [
  GoModel(
    id: 1,
    type: 1,
    count: 4,
    price: 2.25,
    goInfoModel: GoInfoModel(
      title: "The most affordable way to ride",
      subTitle: "Toyota Prius, Chevrolet Volt, Kia Rio and others.",
      baseFare: 0.70,
      distance: 0.25,
      minimumFare: 1.3,
      paidWaiting: 0.15,
      timeFare: 0.02,
      type: 0,
    ),
  ),
  GoModel(
    id: 2,
    type: 2,
    count: 4,
    price: 3.25,
    goInfoModel: GoInfoModel(
      title: "Ride to the office or meetings",
      subTitle: "Toyota Prius, Chevrolet Volt, Kia Rio and others.",
      baseFare: 0.70,
      distance: 0.25,
      minimumFare: 1.3,
      paidWaiting: 0.15,
      timeFare: 0.02,
      type: 1,
    ),
  ),
  GoModel(
    id: 3,
    type: 1,
    count: 4,
    price: 2.36,
    goInfoModel: GoInfoModel(
      title: "The most affordable way to ride",
      subTitle: "Toyota Camry, Kia Optima, Hyundai Sonata and others",
      baseFare: 0.80,
      distance: 0.35,
      minimumFare: 1.50,
      paidWaiting: 0.20,
      timeFare: 0.03,
      type: 0,
    ),
  ),
];

final rides = [
  RideModel(
    image: ImageConstants.instance.driver,
    backImage: ImageConstants.instance.driver3x,
    title: "Drivers",
    subTitle: "Drivers pass professional training",
    color: yellowColor,
  ),
  RideModel(
    image: ImageConstants.instance.speedclock,
    backImage: ImageConstants.instance.speedclock3x,
    title: "Speed",
    subTitle: "Drivers arrive to pickup location faster",
    color: blueColor,
  ),
  RideModel(
    image: ImageConstants.instance.manat,
    backImage: ImageConstants.instance.manat3x,
    title: "Price",
    subTitle: "Affordable trip price every day",
    color: greenColor,
  ),
];
