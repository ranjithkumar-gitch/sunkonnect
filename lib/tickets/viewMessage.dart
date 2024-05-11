import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

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
     appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
            Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.black,))
          ),
         
          title: const CustomText(
              text: "View Message",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textcolor: Colors.black),
          centerTitle: false,
          
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 10,left: 10),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
           const ContentCard(
          title: 'Message Id',
         content: 'TLG202404151489'),

        const SizedBox(height: 10,),
        const ContentCard(
          title: 'Sender',
         content: 'Sai Sharad Raj'),

        const  SizedBox(height: 10,),
        const ContentCard(
          title: 'Date',
         content: '05-09-2024 14:03:46'),

         const  SizedBox(height: 10,),
        const ContentCard(
          title: 'Ticket Id',
         content: 'TICK-431'),

       const SizedBox(height: 10,),

           CustomText(
              text: " Message ",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textcolor: Colors.grey.shade600),

             const SizedBox(height: 5,),

            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey.shade100,
              elevation: 0,
            child: Container(
              width: double.infinity,height: 55,
              margin: const EdgeInsets.only(right: 10,left: 10),
              color: Colors.grey.shade100,
              child: 
                 
                const Padding(
                  padding:  EdgeInsets.only(top: 10,),
                  child: CustomText(
                    text: 'drawing complete, please verify.',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor:Colors.black,),
                ),
                
  
              )),

              const SizedBox(height: 10,),

           CustomText(
              text: " Attachments ",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              textcolor: Colors.grey.shade600),

             const SizedBox(height: 10,),

               AttachmentsGrid()   
                               
           ],
          ),
        ),
      
    );
  }
}

class AttachmentsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, width: double.infinity,
      child: DottedBorder(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(Icons.description,size: 60,color: Colors.grey.shade600,),
        ),
        // child: GridView.count(
        //   crossAxisCount: 1, 
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: List.generate(10, (index) {
            
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Image.asset(
        //         'assets/img.jpeg',
        //         fit: BoxFit.cover,
        //         height: 100, width: 100,
        //       ),
        //     );
        //   }),
        // ),
      ),
    );
  }
}


class ContentCard extends StatelessWidget {
  final String title;
  final String content;

  const ContentCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
          Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.grey.shade100,
              elevation: 0,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 10,left: 10),
              color: Colors.grey.shade100,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 5,),
                CustomText(
                  text: title,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  textcolor:Colors.grey.shade500,),
                const SizedBox(height: 10,),
                 CustomText(
                  text: content,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  textcolor: Colors.black,),

                  const SizedBox(height: 10,),
               ]))),
      ],
    );
  }
   }