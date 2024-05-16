
import 'dart:io';
 import 'package:file_picker/file_picker.dart';
 import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
class AddMessage extends StatefulWidget {
  const AddMessage({super.key});

  @override
  State<AddMessage> createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {

   final ImagePicker picker = ImagePicker();
    
  List<File> selectedImages = [];
   String? pdfFilePath;

  File? file;
   File? media;
    late TextEditingController dateController = TextEditingController();

    @override
  void initState() {
    super.initState();
    dateController = TextEditingController();

    String currentDateTime =
        DateFormat('dd-MM-yyyy , HH:mm a').format(DateTime.now());
    dateController.text = currentDateTime;
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    appBar: const CustomAppbar(title: 'Add Message'),
        body: Container(
          margin: const EdgeInsets.only(right: 10,left: 10),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
             const SizedBox(height: 15,),
          
           const Heading(title: 'Sender'),
             Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colours.ktextfeildbgColor,
                elevation: 0,
              child: Container(
                width: double.infinity,height: 45,
                margin: const EdgeInsets.only(right: 10,left: 10),
                color: Colours.ktextfeildbgColor,
                child: 
                   
                  const Padding(
                    padding:  EdgeInsets.only(top: 15,),
                    child: CustomText(
                      text: 'Vishal K.',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textcolor:Colors.black,),
                  ),
                
                )),
                 const SizedBox(height: 10,),
            
             const Heading(title: 'Date'),
                     Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
            color: Colours.kbordergrey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
            color: Colours.ktextfeildbgColor,
            borderRadius:  BorderRadius.all(
              Radius.circular(10.0),
            ),
                    ),
                    child: TextFormField(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
            controller: dateController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xffFDFDFD),
                  // #FFF7F7
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffFDFDFD),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(
                fontSize: 14.0,
                color: Color(0xff979797),
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (pickeddate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickeddate);
                    String formattedTime = DateFormat('HH:mm a').format(
                      DateTime(
                        pickeddate.year,
                        pickeddate.month,
                        pickeddate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      ),
                    );
                    dateController.text = '$formattedDate, $formattedTime';
                  });
                }
              }
            },
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
            
                    const SizedBox(height: 10,),
                    
            
               const Heading(title: 'Message'),
            
               const SizedBox(height: 5,),
            
                   Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colours.ktextfeildbgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 6,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:  const BorderSide(
                                    color: Colours.kbordergrey,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const  BorderSide(
                                  color: Colours.kbordergrey,
                                  width: 1.0,
                                ),
                              ),
                             
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
            
              // 
                const SizedBox(height: 10,),

                   const Heading(title: 'Add Images'),
            
               const SizedBox(height: 15,),
             
                    Center(
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              imagePicker();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colours.kbuttonpurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10))),
                            child: const Text(
                              "Add Images +",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  SizedBox( height: (selectedImages.isNotEmpty || media != null) ? 10 : 0,
                     child: Container(),
                     ), 
                            
                     Container(
                      child: selectedImages.isEmpty && media == null 
                    ? Container()
                    : SizedBox(
                        height: ((selectedImages.length + (media != null ? 1 : 0)) <= 3) ? 130 : 250,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: selectedImages.length + (media != null ? 1 : 0),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            if (index == selectedImages.length) {
                              return buildImageWidget(media!, onDelete: () {
                                deleteImage();
                              });
                            } else {
                              return buildImageWidget(selectedImages[index], onDelete: () {
                                deleteMultiImage(index);
                              });
                            }
                          },
                        ),
                      ),
                     ),

                      const SizedBox(height: 10,),

                   const Heading(title: 'Add Attachments/Documents'),
            
               const SizedBox(height: 15,),



               Center(
                      child: SizedBox(
                        height: 35,
                        child: ElevatedButton(
                            onPressed: () {
                              pickFile();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colours.kbuttonpurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10))),
                            child: const Text(
                              "Add Attachments +",
                              style: TextStyle(
                                  fontFamily: 'poppins',
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ),
       const SizedBox(height: 15,),
     Container(
    child: (pdfFilePath == null && file == null) || (pdfFilePath?.isEmpty ?? true)
    ? Container() 
    : Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: pdfFilePath != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    PDFView(
                      filePath: pdfFilePath,
                      autoSpacing: true,
                      enableSwipe: true,
                      pageSnap: true,
                    ),
                    GestureDetector(
                      onTap: () {
                        deletePdf();
                        setState(() {
                          pdfFilePath = null;
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.all(7),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Container(),
              ),
      ),
             ),
                       const SizedBox(height: 20,),
                            
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side:
                                        const BorderSide(color: Colours.kbuttonpurple,),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colours.kbuttonpurple,),
                                  )),
                                  SizedBox(
                                    height: 40, width: 100,
                                    child: ElevatedButton(onPressed: (){}, 
                                    style: ElevatedButton.styleFrom(backgroundColor: Colours.kbuttonpurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                      child: const CustomText(text: 'Add', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colors.white)),
                                  )
                                ],
                               ),
                                  const SizedBox(height: 15,),
        ]),
      
    )));
  }  
  

     void deletePdf() {
    setState(() {
      pdfFilePath = null;
    });
  }

   Widget buildImageWidget(File imageFile, {required VoidCallback onDelete}) {
  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => FullImageView(image: imageFile),
          //   ),
          // );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.file(imageFile, fit: BoxFit.cover, height: 180, width: double.infinity),
        ),
      ),
      Positioned(
        top: 5,
        right: 5,
        child: GestureDetector(
          onTap: onDelete,
          child: const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.delete,
              color: Colours.kbuttonpurple,
            ),
          ),
        ),
      ),
    ],
  );
}





   void deleteMultiImage(int indexToDelete) {
  setState(() {
    selectedImages.removeAt(indexToDelete);
  });
}

  void deleteImage() {
    setState(() {
      media = null;
    });
  }
  void pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowMultiple: true,
    allowedExtensions: ['pdf'],
  );
  
   if (result != null) {
     setState(() {
    pdfFilePath = result.files.single.path;
      file = null;
        });} }

  void pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    setState(() {
      media = File(photo.path);
    });
  }
Future<void> getImages() async {
    final pickedFileList =
        await picker.pickMultiImage(imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    
    setState(() {
      if (pickedFileList.isNotEmpty) {
        for (var pickedFile in pickedFileList) {
          selectedImages.add(File(pickedFile.path));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Nothing is selected')));
      }
    });
  }

 void imagePicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      pickImageFromCamera();
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.camera),
                        Text(
                          "Camera",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // pickImageFromGallery();
                      getImages();
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.photo),
                        Text(
                          "Gallery",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  

}





class Heading extends StatelessWidget {
  final String title;
  const Heading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: CustomText(
         text: title,
         fontSize: 12,
       fontWeight: FontWeight.w500,
      textcolor: Colours.ksubheadertext),
    );
  }
   }