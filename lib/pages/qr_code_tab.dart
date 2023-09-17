import 'package:first_project/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRCodeTab extends StatefulWidget {
  const QRCodeTab({super.key});

  @override
  State<QRCodeTab> createState() => _QRCodeTabState();
}

class _QRCodeTabState extends State<QRCodeTab> with TickerProviderStateMixin {
  late TabController controller;
  late MobileScannerController qrController;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 2, vsync: this);

    qrController = MobileScannerController(
      facing: CameraFacing.back,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'QR Կոդ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.appBlack,
            ),
          ),
        ),
        centerTitle: true,
        bottom: tabBar(),
      ),
      body: body(),
    );
  }

  Widget body() {
    return TabBarView(
      controller: controller,
      children: [
        qrScanner(),
        const Placeholder(),
      ],
    );
  }

  Widget qrScanner() {
    return Stack(
      children: [
        MobileScanner(
          // fit: BoxFit.contain,
          controller: qrController,
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              debugPrint('Barcode found! ${barcode.rawValue}');
            }
          },
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.black.withOpacity(0.5),
                width: 150,
              ),
              vertical: BorderSide(
                color: Colors.black.withOpacity(0.5),
                width: 50,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              const Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 40, top: 40, bottom: 40),
                  child: Text(
                    'QR կոդը տեղադրեք քառակուսու կենտրոնում, \n եւ այն ավտոմատ կսկանավորվի',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      qrController.toggleTorch();
                    },
                    icon: const Icon(
                      Icons.flashlight_on_outlined,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Բացել Նկարադարանից',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Մուտքագրել Ստացողի դրամապանակի ID-ին',
                        style:
                            TextStyle(fontSize: 13, color: AppColors.appOrange),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  TabBar tabBar() {
    return TabBar(
      controller: controller,
      labelColor: AppColors.appBlack,
      indicatorWeight: 4,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.appOrange,
      tabs: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Սկանավորել կոդը'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('Իմ QR կոդը'),
        ),
      ],
    );
  }
}
