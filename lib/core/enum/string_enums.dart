enum GoEnum {
  econom,
  comfort,
}

extension GoEnumString on GoEnum {
  String get rawValue {
    switch (this) {
      case GoEnum.econom:
        return 'Econom';
      case GoEnum.comfort:
        return 'Comfort';
      default:
        return 'Econom';
    }
  }
}
