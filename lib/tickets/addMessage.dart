import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/model/add_message_request.dart';
import 'package:sunkonnect/tickets/model/uploadimage_responsemodel.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/constant.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';
import 'package:sunkonnect/widgets/snackbar.dart';
import 'package:http/http.dart' as http;

class AddMessage extends StatefulWidget {
  const AddMessage({super.key});

  @override
  State<AddMessage> createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
  final ImagePicker picker = ImagePicker();

  List<File> selectedFiles = [];
  List<File> selectedImages = [];

  File? file;
  File? media;
  bool isLoading = false;

  late TextEditingController dateController = TextEditingController();

  late TextEditingController messageController = TextEditingController();

  late AddMessageRequest addMessageRequestModel;

  late TicketLogImage imageRequestModel;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();

    String currentDateTime =
        // DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(DateTime.now());
        DateFormat('dd-MM-yyyy HH:mm a').format(DateTime.now());
    dateController.text = currentDateTime;

    addMessageRequestModel = AddMessageRequest(
      ticketId: "",
      accountCode: "",
      assignedtoObjectId: "",
      createdBy: "",
      description: "",
      ticketLogImages: [],
      projectCode: "",
      raisebyObjectId: "",
      title: "",
      raisebyObjectID: RaisebyObjectID(
        id: '',
        name: '',
      ),
      dateOfLog: "",
      ticketID: "",
      ticketObjId: " ",
    );

    imageRequestModel =
        TicketLogImage(fileName: '', fileUrl: '', extension: '');
  }

  @override
  void dispose() {
    dateController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppbar(title: 'Add Message'),
        body: Stack(children: [
          Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),

                      const Heading(title: 'Sender'),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Colours.ktextfeildbgColor,
                          elevation: 0,
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            color: Colours.ktextfeildbgColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                              ),
                              child: CustomText(
                                text: SharedPrefServices.getname().toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                textcolor: Colors.black,
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),

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
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                            readOnly: true,
                            controller: dateController,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    // DateTime? pickeddate = await showDatePicker(
                                    //   context: context,
                                    //   initialDate: DateTime.now(),
                                    //   firstDate: DateTime(1950),
                                    //   lastDate: DateTime.now(),
                                    // );
                                    // if (pickeddate != null) {
                                    //   TimeOfDay? pickedTime =
                                    //       await showTimePicker(
                                    //     context: context,
                                    //     initialTime: TimeOfDay.now(),
                                    //   );
                                    //   if (pickedTime != null) {
                                    //     setState(() {
                                    //       String formattedDate =
                                    //           DateFormat('dd-MM-yyyy')
                                    //               .format(pickeddate);
                                    //       String formattedTime =
                                    //           DateFormat('HH:mm a').format(
                                    //         DateTime(
                                    //           pickeddate.year,
                                    //           pickeddate.month,
                                    //           pickeddate.day,
                                    //           pickedTime.hour,
                                    //           pickedTime.minute,
                                    //         ),
                                    //       );
                                    //       dateController.text =
                                    //           '$formattedDate, $formattedTime';
                                    //     });
                                    //   }
                                    // }
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month,
                                    color: Colours.kbuttonpurple,
                                  )),
                              contentPadding: const EdgeInsets.all(10.0),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colours.kbordergrey,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colours.kbordergrey,
                                  width: 1.0,
                                ),
                              ),
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                color: Color(0xff979797),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            onTap: () async {},
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Heading(title: 'Message'),

                      const SizedBox(
                        height: 5,
                      ),

                      Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            color: Colours.ktextfeildbgColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 6,
                          maxLines: null,
                          controller: messageController,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colours.kbordergrey,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
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
                      const SizedBox(
                        height: 10,
                      ),

                      const Heading(title: 'Add Images'),

                      const SizedBox(
                        height: 15,
                      ),

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
                                      borderRadius: BorderRadius.circular(10))),
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
                      SizedBox(
                        height: (selectedImages.isNotEmpty || media != null)
                            ? 10
                            : 0,
                        child: Container(),
                      ),

                      Container(
                        color: Colours.ktextfeildbgColor,
                        child: selectedImages.isEmpty && media == null
                            ? Container()
                            : SizedBox(
                                height: ((selectedImages.length +
                                            (media != null ? 1 : 0)) <=
                                        3)
                                    ? 130
                                    : 250,
                                child: GridView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: selectedImages.length +
                                      (media != null ? 1 : 0),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 15,
                                  ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    if (index == selectedImages.length) {
                                      return buildImageWidget(media!,
                                          onDelete: () {
                                        deleteImage();
                                      });
                                    } else {
                                      return buildImageWidget(
                                          selectedImages[index], onDelete: () {
                                        deleteMultiImage(index);
                                      });
                                    }
                                  },
                                ),
                              ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      const Heading(title: 'Add Attachments/Documents'),

                      const SizedBox(
                        height: 15,
                      ),

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
                                      borderRadius: BorderRadius.circular(10))),
                              child: const CustomText(
                                  text: "Add Attachments +",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  textcolor: Colours.kwhiteColor)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      if (selectedFiles.isNotEmpty)
                        SizedBox(
                          width: double.infinity,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: selectedFiles.length,
                            itemBuilder: (context, index) {
                              return buildFileWidget(
                                  selectedFiles[index], index);
                            },
                          ),
                        )
                      else
                        Center(
                          child: Container(),
                        ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colours.kbuttonpurple,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(
                                  color: Colours.kbuttonpurple,
                                ),
                              )),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (messageController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Please enter your message')));
                                  } else if (messageController
                                      .text.isNotEmpty) {
                                    //additiona fields //

                                    setState(() {
                                      isLoading = true;
                                    });

                                    addMessageRequestModel.ticketId = '';
                                    addMessageRequestModel.raisebyObjectId =
                                        SharedPrefServices.getuserObjId()
                                            .toString();
                                    // addMessageRequestModel.dateOfLog =
                                    //     dateController.text;
                                    addMessageRequestModel.dateOfLog =
                                        DateTime.now().toString();
                                    addMessageRequestModel.description =
                                        messageController.text;
                                    addMessageRequestModel.ticketObjId =
                                        SharedPrefServices.getTicketobjId()
                                            .toString();
                                    addMessageRequestModel.ticketID =
                                        SharedPrefServices.getTicketId()
                                            .toString();
                                    addMessageRequestModel.companyId =
                                        SharedPrefServices.getcompanyId()
                                            .toString();
                                    addMessageRequestModel.assignedtoObjectId =
                                        SharedPrefServices
                                                .getassignedtoObjectId()
                                            .toString();
                                    addMessageRequestModel.createdBy =
                                        SharedPrefServices.getcreatedBy()
                                            .toString();

                                    addMessageRequestModel.raisebyObjectID =
                                        RaisebyObjectID(
                                      id: SharedPrefServices
                                              .getraisebyObjectID()
                                          .toString(),
                                      name: SharedPrefServices
                                              .getraisebyObjectName()
                                          .toString(),
                                    );

                                    addMessageRequestModel.title =
                                        SharedPrefServices.gettitle()
                                            .toString();
                                    addMessageRequestModel.accountCode =
                                        SharedPrefServices.getaccountCode()
                                            .toString();
                                    addMessageRequestModel.projectCode =
                                        SharedPrefServices.getprojectCode()
                                            .toString();

                                    if (selectedImages.isEmpty &&
                                        selectedFiles.isEmpty) {
                                      setState(() {
                                        addMessageRequestModel.ticketLogImages =
                                            [];
                                      });
                                      // addmessage post service //

                                      // ApiService apiService = ApiService();

                                      // apiService
                                      //     .addMessage(addMessageRequestModel)
                                      //     .then((value) {
                                      //   if (value.status == 200 ||
                                      //       value.status == 201) {
                                      //     showToast(
                                      //         "Message added Successfully");
                                      //   }

                                      // });

                                      postdatatoAddmessageservice(
                                          addMessageRequestModel);
                                    } else if (selectedImages.isNotEmpty ||
                                        selectedFiles.isNotEmpty) {
                                      List<File> imgstoupload = [];
                                      imgstoupload.addAll(selectedImages);
                                      imgstoupload.addAll(selectedFiles);
                                      print('New List,$imgstoupload');
                                      inspect(imgstoupload);

                                      await uploadMultipleImage(imgstoupload);
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colours.kbuttonpurple,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: const CustomText(
                                    text: 'Add',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    textcolor: Colors.white)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ]),
              )),
          if (isLoading) const Center(child: ProgressBarHUD()),
        ]));
  }

  //    void deletePdf() {
  //    setState(() {
  //     pdfFilePath = null;
  //   });
  // }

  Widget buildImageWidget(File imageFile, {required VoidCallback onDelete}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(imageFile,
                fit: BoxFit.cover, height: 180, width: double.infinity),
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
    setState(() {
      isLoading = true;
    });

    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    setState(() {
      isLoading = false;
    });

    if (result != null) {
      int totalFiles = selectedFiles.length + result.paths.length;
      if (totalFiles > 10) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You can only select up to 10 files.')));
      } else {
        // setState(() {
        //   selectedFiles.addAll(result.paths
        //       .map((path) => path != null ? File(path) : null)
        //       .toList());
        // });
        List<File> filesToAdd = result.paths
            .map((path) => File(path!)) // Convert path to File
            .where((file) => file.existsSync()) // Filter out non-existing files
            .toList();

        setState(() {
          selectedFiles.addAll(filesToAdd);
        });

        print('Selected Files: $selectedFiles');
      }
    }
  }

  void deleteFile(int index) {
    setState(() {
      selectedFiles.removeAt(index);
    });
  }

  Widget buildFileWidget(File file, int index) {
    String fileName = file.path.split('/').last;
    String extension = fileName.split('.').last.toLowerCase();
    IconData iconData;
    switch (extension) {
      case 'pdf':
        iconData = Icons.picture_as_pdf;
        break;
      case 'docx':
        iconData = Icons.description;
        break;
      case 'png':
      case 'jpg':
      case 'jpeg':
        iconData = Icons.image;
        break;
      case 'mp3':
        iconData = Icons.audiotrack;
        break;
      case 'mp4':
      case 'mkv':
      case 'avi':
      case '3gp':
      case 'wmv':
      case 'mov':
      case 'm4v':
        iconData = Icons.video_library;
        break;
      case 'xls':
      case 'xlsx':
        iconData = Icons.insert_drive_file;
        break;
      case 'ppt':
      case 'pptx':
        iconData = Icons.slideshow;
        break;
      case 'csv':
        iconData = Icons.table_chart;
      default:
        iconData = Icons.insert_drive_file;
        break;
    }
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colours.ktextfeildbgColor),
          child: ListTile(
            leading: Icon(
              iconData,
              color: Colours.kbuttonpurple,
            ),
            title: CustomText(
                text: file.path.split('/').last,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                textcolor: Colours.kresponsivetext),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colours.kbuttonpurple),
              onPressed: () {
                setState(() {
                  selectedFiles.removeAt(index);
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }

  void pickImageFromCamera() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    setState(() {
      media = File(photo.path);
    });
  }

  Future<void> getImages() async {
    final pickedFileList = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);

    setState(() {
      if (pickedFileList.isNotEmpty) {
        for (var pickedFile in pickedFileList) {
          selectedImages.add(File(pickedFile.path));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
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

  // uploadMultipleImage(List<File> imgstoupload) {}
  uploadMultipleImage(List<File> imgstoupload) async {
// string to uri
    var uri = Uri.parse(
        AppConstant.sunkonnectDevUrl + "imageUpload/multipleImageUploader");
    // print("image upload URL - $uri");
// create multipart request
    var request = new http.MultipartRequest("POST", uri);

    for (var file in imgstoupload) {
      String fileName = file.path.split("/").last;
      // var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
      var stream = http.ByteStream(file.openRead());
      stream.cast();

      // get file length

      var length = await file.length(); //imageFile is your image file
      // print("File lenght - $length");
      // print("fileName - $fileName");
      // multipart that takes file
      var multipartFileSign =
          http.MultipartFile('images', stream, length, filename: fileName);

      request.files.add(multipartFileSign);
    }

    Map<String, String> headers = {
      'reportProgress': 'true',
      'responseType': 'json',
      "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
      'Authorization': SharedPrefServices.getaccessToken().toString(),
    };
    // print("headers - $headers}");
    request.headers.addAll(headers);

    var response = await request.send();

    // print(response.statusCode);

    var res = await http.Response.fromStream(response);
    // print(response.statusCode);
    if (response.statusCode == 200) {
      List imglocations = updatedimagesFromJson(res.body)
          .response!
          .uploadedImagePath!
          .map((e) => {
                "fileName": e.originalname,
                "fileUrl": e.location,
                "extension": e.location!.split('.').last
              })
          .toList();

      // postdatatobooknowservice(booknowlist);

      setState(() {
        addMessageRequestModel.ticketLogImages = imglocations;
      });
      // addmessage post service //
      postdatatoAddmessageservice(addMessageRequestModel);

      return updatedimagesFromJson(res.body);
    }
    setState(() {
      isLoading = false;
    });
    const snackbar = SnackBar(
      content: Text('Error. Please try again later'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void postdatatoAddmessageservice(
      AddMessageRequest addMessageRequestModel) async {
    try {
      var headers = {
        'Authorization': SharedPrefServices.getaccessToken().toString(),
        'Content-Type': 'application/json'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://65.0.91.101:7390/api/ticketLog/insert-ticketLogInfo'));
      request.body = json.encode(addMessageRequestModel);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        final invalidsnackbar = SnackBar(
          content: Text('New Message Created Successfully.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(invalidsnackbar);
        print(await response.stream.bytesToString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      } else {
        setState(() {
          isLoading = false;
        });
        final invalidsnackbar = SnackBar(
          content: const Text('Something went wrong.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(invalidsnackbar);
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
      final snackbar = SnackBar(
        content: const Text('Error.Please try again later'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      throw e;
    }
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

// single pdf file pick code

// meathod
// void pickFile() async {
// FilePickerResult? result = await FilePicker.platform.pickFiles(
//   type: FileType.custom,
//   allowMultiple: true,
//   allowedExtensions: ['pdf'],
// );

//  if (result != null) {

//    setState(() {
//   pdfFilePath = result.files.single.path;
//     file = null;
//       });

//     } }

// block of code
//  Container(
// child: (pdfFilePath == null && file == null) || (pdfFilePath?.isEmpty ?? true)
// ? Container()
// : Container(
//     height: 180,
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: Colors.grey),
//     ),
//     child: pdfFilePath != null
//         ? ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Stack(
//               children: [
//                 PDFView(
//                   filePath: pdfFilePath,
//                   autoSpacing: true,
//                   enableSwipe: true,
//                   pageSnap: true,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     deletePdf();
//                     setState(() {
//                       pdfFilePath = null;
//                     });
//                   },
//                   child: Container(
//                     height: 25,
//                     width: 25,
//                     margin: const EdgeInsets.all(7),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.black,
//                     ),
//                     child: const Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Center(
//             child: Container(),
//           ),
//   ),
//          ),
