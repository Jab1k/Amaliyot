import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  dynamic data;
  String flag;
  MyWidget({
    super.key,
    required this.data,
    required this.flag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              flag,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 6),
              child: Center(
                child: Text(
                  'Soft Price: ${data.cbPrice}',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Nbu Bankining Ushbu Qiymatni Oldi Sottisi: ',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                data.nbuBuyPrice == ''
                    ? 'Biz ushbu pul birligi bilan oldi sotti qilmaymiz !'
                    : 'Sotib Olish narxi: ${data.nbuBuyPrice}',
                style: TextStyle(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              data.nbuBuyPrice == ''
                  ? ''
                  : 'Sotish narxi: ${data.nbuCellPrice}',
              style: TextStyle(color: Colors.black, fontSize: 25),
            )
          ],
        ),
      ),
    );
    ;
  }
}
