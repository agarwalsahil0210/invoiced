import 'dart:io';
import 'openpdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/material.dart';

class PdfHelper extends StatelessWidget {
  final String name, email, phone, cname;
  const PdfHelper(
      {Key? key,
      required this.name,
      required this.email,
      required this.phone,
      required this.cname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Generate PDF'),
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
        'Welcome $name', PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: const Rect.fromLTWH(0, 20, 500, 200));
    page.graphics.drawString(
        'Welcome $email', PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: const Rect.fromLTWH(0, 60, 500, 200));
    page.graphics.drawString(
        'Welcome $phone', PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: const Rect.fromLTWH(0, 100, 500, 200));
    page.graphics.drawString(
        'Welcome $cname', PdfStandardFont(PdfFontFamily.helvetica, 30),
        bounds: const Rect.fromLTWH(0, 140, 500, 200));
    List<int> bytes = document.save();
    document.dispose();

    saveandopen(bytes, 'Output.pdf');
  }
}
