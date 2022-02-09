import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TextToPDF extends StatefulWidget {
  const TextToPDF({Key? key}) : super(key: key);

  @override
  _TextToPDFState createState() => _TextToPDFState();
}

class _TextToPDFState extends State<TextToPDF> {

 viewFile() async {
    final _url =
        'https://www.kindacode.com/wp-content/uploads/2021/07/test.pdf';
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      print('Something went wrong');
    }
    print("Function");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
        title: Text("URL to PDF"),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                RaisedButton(
                  onPressed: (){
                    viewFile();
                    print("pressed");
                  },

                  child: Text('URL PDF'),
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

