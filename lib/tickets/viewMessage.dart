
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class ViewMessage extends StatefulWidget {
  const ViewMessage({super.key});

  @override
  State<ViewMessage> createState() => _ViewMessageState();
}

class _ViewMessageState extends State<ViewMessage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbar(title: 'View Message'),
      body: Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: const SingleChildScrollView(
          child:  Column(
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
             
          
                ContentCard(title: 'Message', content: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. '),
          
                 SizedBox(
                height: 10,
              ),
             
              UrlCard(title: 'Attachments', 
              urls: [
              'https://images.news18.com/ibnlive/uploads/2022/01/tata-safari-dark-edition-feature.jpg',
              'https://cpget.tsche.ac.in/PDF/CPGETPDF/3%20Examination%20Schedule.pdf',
              'https://sample-videos.com/video321/mp4/720/big_buck_bunny_720p_2mb.mp4',
              
              ],),

           
             
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
              color: Colours.ksubheadertext
            ),
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
                        ? Icon(fileIcons[downloadedFiles[url]])
                        : _buildDownloadButton(url),
                  ),
               const  SizedBox(height: 5),
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
        ? Icon(fileIcons[downloadedFiles[url]])
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
      onDownloadCompleted: (value) {
        setState(() {
          _progressMap.remove(url);
          String extension = value.split('.').last;
          downloadedFiles[url] = extension;
        });
      },
      onDownloadError: (String error) {
        print('Download error: $error');
        
      },
    );
  }

}






