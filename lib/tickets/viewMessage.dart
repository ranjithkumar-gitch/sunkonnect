import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/loginflow/model/view_messagelog_response_model.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';

class ViewMessage extends StatefulWidget {
  const ViewMessage({super.key});

  @override
  State<ViewMessage> createState() => _ViewMessageState();
}

bool isApiCallProcess = false;
final scaffoldKey = GlobalKey<ScaffoldState>();

class _ViewMessageState extends State<ViewMessage> {
  @override
  Widget build(BuildContext context) {
    var selectedMyticketsProvider = context.watch<MyTicketsListProvider>();

    selectedMyticketsProvider.viewmessageLog();
    return SizedBox(
      child: Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          appBar: const CustomAppbar(title: 'View Message'),
          body: Column(children: [
            Selector<MyTicketsListProvider,
                ApiResponse<ViewMessageLogResponseModel>?>(
              selector: (_, apiResponse) =>
                  apiResponse.viewMessageLogResponseModel,
              builder: (_, instance, __) {
                if (instance?.status == Status.error) {
                  return FittedBox(
                      child: Text(instance?.errorMessage ?? "error"));
                } else if (instance?.status == Status.loading) {
                  return const Expanded(child: ProgressBarHUD());
                } else if (instance?.status == Status.completed) {
                  List<Datum?> viewmessagelog = instance?.data?.data ?? [];
                  print("now printing my tickts list data");
                  print(viewmessagelog);
                  inspect(viewmessagelog);

                  return viewmessagelog.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "data NOT recieved. EMPTY",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 33),
                            )
                            // Image.asset(
                            //   'images/nodatafound.png',
                            //   height: 250,
                            //   width: 250,
                            // ),
                          ],
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 10, left: 10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ContentCard(
                                            title: 'Message Id',
                                            content: viewmessagelog[0]!
                                                .datumTicketId
                                                .toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ContentCard(
                                            title: 'Sender',
                                            content: viewmessagelog[0]!
                                                .raisebyObjectId
                                                .toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ContentCard(
                                            title: 'Date',
                                            content: viewmessagelog[0]!
                                                .createdAt
                                                .toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ContentCard(
                                            title: 'Message',
                                            content: viewmessagelog[0]!
                                                .description
                                                .toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        UrlCard(
                                          title: 'Attachments',
                                          urls: [
                                            'https://firebasestorage.googleapis.com/v0/b/billpro-9711c.appspot.com/o/MultiFiles%2F1717492020753?alt=media&token=d666321a-1941-4c47-bdf1-0f93d8284db7',
                                            'https://www.clickdimensions.com/links/TestPDFfile.pdf',
                                            'https://images.news18.com/ibnlive/uploads/2022/01/tata-safari-dark-edition-feature.jpg',
                                            'https://cpget.tsche.ac.in/PDF/CPGETPDF/3%20Examination%20Schedule.pdf',
                                            'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_2mb.mp4',
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Text(
                                //     viewmessagelog[0]!.datumTicketId.toString())
                              ],
                            ),
                          ),

                          // CustomText(
                          //   text: selectedmyticketview[0]!.ticketId!.toString(),
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.w500,
                          //   textcolor: Colours.kheadertext,
                          // ),
                        );
                } else {
                  return const Expanded(
                    child: ProgressBarHUD(),
                  );
                }
              },
            )
          ])),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'View Message'),
      body: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              ContentCard(title: 'Message Id', content: 'TLG202404151488'),
              SizedBox(
                height: 10,
              ),
              ContentCard(title: 'Sender', content: 'Sai Sharad Raj'),
              SizedBox(
                height: 10,
              ),
              ContentCard(title: 'Date', content: '05-09-2024 14:03:46'),
              SizedBox(
                height: 10,
              ),
              ContentCard(
                  title: 'Message',
                  content:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '),
              SizedBox(
                height: 10,
              ),
              UrlCard(
                title: 'Attachments',
                urls: [
                  'https://firebasestorage.googleapis.com/v0/b/billpro-9711c.appspot.com/o/MultiFiles%2F1717492020753?alt=media&token=d666321a-1941-4c47-bdf1-0f93d8284db7',
                  'https://www.clickdimensions.com/links/TestPDFfile.pdf',
                  'https://images.news18.com/ibnlive/uploads/2022/01/tata-safari-dark-edition-feature.jpg',
                  'https://cpget.tsche.ac.in/PDF/CPGETPDF/3%20Examination%20Schedule.pdf',
                  'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_2mb.mp4',
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String title;
  final dynamic content;

  const ContentCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: CustomText(
            text: title,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            textcolor: Colours.ksubheadertext,
          ),
        ),
        Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colours.ktextfeildbgColor,
            elevation: 0,
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(right: 10, left: 10),
                color: Colours.ktextfeildbgColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      content is String
                          ? Text(
                              content,
                              style: GoogleFonts.poppins(
                                color: Colours.kresponsivetext,
                                height: 1.5,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 10,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: (content as List<String>).map((line) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      line,
                                      style: GoogleFonts.poppins(
                                        color: Colours.kresponsivetext,
                                        height: 1.5,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                );
                              }).toList(),
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]))),
      ],
    );
  }
}

class UrlCard extends StatefulWidget {
  final String title;
  final List<String> urls;

  const UrlCard({
    Key? key,
    required this.title,
    required this.urls,
  }) : super(key: key);

  @override
  State<UrlCard> createState() => _UrlCardState();
}

class _UrlCardState extends State<UrlCard> {
  final Map<String, double?> _progressMap = {};
  late Map<String, String> downloadedFiles;
  Map<String, IconData> fileIcons = {
    'pdf': Icons.picture_as_pdf,
    'jpg': Icons.image,
    'png': Icons.image,
    'mp4': Icons.video_collection,
    'mp3': Icons.music_note,
  };

  @override
  void initState() {
    super.initState();

    downloadedFiles = {};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            widget.title,
            style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colours.ksubheadertext),
          ),
        ),
        Card(
          color: Colours.ktextfeildbgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          child: Container(
            width: double.infinity,
            color: Colours.ktextfeildbgColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                for (String url in widget.urls)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      url,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: downloadedFiles.containsKey(url)
                        ? Icon(fileIcons[downloadedFiles[url]] ??
                            Icons.insert_drive_file)
                        : _buildDownloadButton(url),
                  ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //

  Widget _buildDownloadButton(String url) {
    return downloadedFiles.containsKey(url)
        ? GestureDetector(
            onTap: () {
              String? localFilePath = downloadedFiles[url];
              if (localFilePath != null) {
                OpenFile.open(localFilePath);
              }
            },
            child: Icon(
                fileIcons[downloadedFiles[url]] ?? Icons.insert_drive_file))
        : _progressMap.containsKey(url) && _progressMap[url] != null
            ? CircularProgressIndicator(
                color: Colours.kbuttonpurple,
                value: _progressMap[url],
              )
            : IconButton(
                icon: const Icon(Icons.download),
                onPressed: () {
                  _downloadFile(url);
                },
              );
  }

  void _downloadFile(String url) {
    FileDownloader.downloadFile(
      url: url,
      onProgress: (name, progress) {
        setState(() {
          _progressMap[url] = progress;
        });
      },
      onDownloadCompleted: (filePath) {
        setState(() {
          _progressMap.remove(url);
          String extension = filePath.split('.').last;
          downloadedFiles[url] = extension;
          OpenFile.open(filePath);

          print(filePath.split('/').last);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('File downloaded : ${filePath.split('/').last}'),
              duration: const Duration(seconds: 2),
            ),
          );
        });
      },
      onDownloadError: (String error) {
        print('Download error: $error');
      },
    );
  }
}
