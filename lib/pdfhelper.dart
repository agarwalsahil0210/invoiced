import 'dart:io';
import 'homepage.dart';
import 'openpdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';

class PdfHelper extends StatelessWidget {
  final String name, email, phone, cname;
  List<Item> itemList = [];
  PdfHelper(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.cname,
      required this.itemList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.deepPurple[500],
            child: Text('Generate Bill', style: TextStyle(color: Colors.white)),
            onPressed: () {
              _createPDF();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
        'Name: $name', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: const Rect.fromLTWH(0, 20, 500, 200));
    page.graphics.drawString(
        'Email: $email', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: const Rect.fromLTWH(0, 60, 500, 200));
    page.graphics.drawString(
        'Phone no: $phone', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: const Rect.fromLTWH(0, 100, 500, 200));
    page.graphics.drawString(
        'Comapny name : $cname', PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: const Rect.fromLTWH(0, 140, 500, 200));
    page.graphics.drawString('Item bought : ${itemList[0].title}',
        PdfStandardFont(PdfFontFamily.helvetica, 20),
        bounds: const Rect.fromLTWH(0, 300, 500, 200));
    List<int> bytes = document.save();
    document.dispose();

    saveandopen(bytes, 'Bill.pdf');
    print(itemList[0].title);
  }
}
