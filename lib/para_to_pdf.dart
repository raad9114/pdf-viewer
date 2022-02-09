import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_app/mobile.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ParaToPDF extends StatefulWidget {
  const ParaToPDF({Key? key}) : super(key: key);
 // final pdf = pw.Document();

  @override
  _ParaToPDFState createState() => _ParaToPDFState();
}

class _ParaToPDFState extends State<ParaToPDF> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Paragraph to PDF"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: FlatButton(
              child:Text("Create PDF") ,
            onPressed: _createPDF,
            ),
          ),
        ),
      ),    
    );
  }
  Future<void> _createPDF() async {
    PdfDocument document= PdfDocument();
    final page= document.pages.add();

    page.graphics.drawString('Welcome PDF',
    PdfStandardFont(PdfFontFamily.helvetica, 30));

    page.graphics.drawImage(PdfBitmap(await _readImageData('iron.jpg')), Rect.fromLTWH(0, 100, 440,550));

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
Future<Uint8List> _readImageData(String name) async {
  final data= await rootBundle.load('images/iron.jpg');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

}


