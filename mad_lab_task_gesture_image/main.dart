import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Uint8List? image;
  void takeMyPicture() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }


  Future<Uint8List?> pickImage(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      return image.readAsBytes();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              takeMyPicture();
                            },
                            child: Container(
                              width: 110,
                              height: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: image != null
                                  ? Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: MemoryImage(image!),
                                      fit: BoxFit.cover,
                                    )
                                ),
                              )
                                  : const Padding(
                                padding: EdgeInsets.only(
                                    top: 40, right: 10, left: 10),
                                child: Text(
                                  "Click here to add Passport Size Photo",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
