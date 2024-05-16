
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/tickets/addMessage.dart';
import 'package:sunkonnect/tickets/viewMessage.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class MessageLogScreen extends StatefulWidget {
  const MessageLogScreen({super.key});

  @override
  State<MessageLogScreen> createState() => _MessageLogScreenState();
}

class _MessageLogScreenState extends State<MessageLogScreen> {
  List<MessageLog> message = [
    MessageLog(
       
        logDate: '10 min ago',
        messageId: 'TLG202404151489',
        sender: 'Sai Sharad Raj',
        message: 'drawing complete, please verify,testing how to drawing complete, please verify.',
       ),
       MessageLog(
       
        logDate: '6 hr ago',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

       MessageLog(
       
        logDate: '14 hr ago',
        messageId: 'TLG202404151489',
        sender: 'Sai Sharad Raj',
        message: 'drawing complete, please verify.',
       ),
       MessageLog(
       
        logDate: '1 day ago',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'Dropdown issue, please verify,testing how to drawing complete, please verify.',
       ),

        MessageLog(
       
        logDate: '2 days ago',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'Png Images issue , please verify,testing how to drawing complete, please verify.',
       ),

       MessageLog(
       
        logDate: '13-05-2024',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

       MessageLog(
       
        logDate: '13-05-2024',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),
       MessageLog(
       
        logDate: '10-05-2024',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),
       MessageLog(
       
        logDate: '05-05-2024',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

 
      
      

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
   floatingActionButton: Padding(
     padding: const EdgeInsets.only(bottom: 15),
     child: SizedBox(
      height: 45, width: double.infinity,
       child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
            onPressed: () {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMessage()));
            },
            label: const CustomText(text: 'Add Message', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colours.kwhiteColor),
            icon: const Icon(Icons.add,color: Colours.kwhiteColor,),
            backgroundColor: Colours.kbuttonpurple, 
          ),
     ),
   ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10,),
         const CustomText(
            text: " Message Log ",
            fontSize: 16,
            fontWeight: FontWeight.w500,
            textcolor: Colours.kheadertext,
              ),
           const SizedBox(height: 10,),
      
      
            Expanded(
        child: ListView.builder(
          itemCount: message.length,
          itemBuilder: (context, index) {
          
            return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewMessage()));
          },
          child: Card(
            elevation: 1,
            color: Colours.kcardbgColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),   color: Colours.kcardbgColor,),
              child: Container(
                 color: Colours.kcardbgColor,
                margin: const EdgeInsets.only(right: 10,left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: message[index].messageId,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textcolor:Colors.black,),
                    
                     Text(message[index].logDate,style: GoogleFonts.poppins(fontSize: 10,color: Colours.ksubheadertext),),
                    
                
                  ],
                  ),
                  
              
                   const SizedBox(height: 5,),

                   CustomText(
                      text:message[index].message.length <= 25 ? message[index].message : '${message[index].message.substring(0,25)} . . . . . . . .',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      textcolor: Colours.kheadertext,),
                        
                       const SizedBox(height: 5,),
                                  
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: message[index].sender,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      textcolor: Colours.kheadertext,),
                  ),
              
                   const SizedBox(height: 5,),
                        
                 
                  
                 ],
                ),
              ),
            )
            
          ),
        ),
          const SizedBox(height: 10,),
      ],
            );
            
          },
        ),
      ),
      
      const SizedBox(height: 50,),
      
      ],
      ),
    );
  
  }
}

class MessageLog {
  
  final String messageId;
  final String sender;
  final String message;
  final String logDate;

  MessageLog({
    required this.messageId,
    required this.sender,
    required this.message,
    required this.logDate,
    
  });
}