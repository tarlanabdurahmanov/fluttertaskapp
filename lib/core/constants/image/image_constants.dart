class ImageConstants {
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

  String get carImageTransparent => toPng('carImagetransparent');
  String get carImage => toPng('carImage');
  String get calendar => toPng('calendar');
  String get driver => toPng('driver');
  String get driver3x => toPng('driver@3x');
  String get manat => toPng('manat');
  String get manat3x => toPng('manat@3x');
  String get speedclock => toPng('speedclock');
  String get speedclock3x => toPng('speedclock@3x');
  String get lightning => toPng('lightning');

  String toPng(String name) => 'assets/images/$name.png';
  String toJpeg(String name) => 'assets/images/$name.jpeg';
}
