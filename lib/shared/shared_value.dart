part of 'shared.dart';

class SizeDevice {
  late BuildContext ctx;
  late double heightDevice = MediaQuery.of(ctx).size.height;
  late double widthDevice = MediaQuery.of(ctx).size.width;

  SizeDevice(this.ctx);
}