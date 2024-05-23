
import 'package:flutter/material.dart';
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
        child: const Column(
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

           ContentCard(title: 'Attachments', content: [
            'http://www.example.com/image1.pdf',
            'http://www.example.com/image1.jpg'
            ]),
           
             SizedBox(
              height: 10,
            ),
            
             SizedBox(
              height: 5,
            ),
           
          ],
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
