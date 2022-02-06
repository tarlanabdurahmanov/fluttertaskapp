enum GoEnum {
  ECONOM,
  COMFORT,
}

extension GoEnumString on GoEnum {
  String get rawValue {
    switch (this) {
      case GoEnum.ECONOM:
        return 'Econom';
      case GoEnum.COMFORT:
        return 'Comfort';
      default:
        return 'Econom';
    }
  }
}
