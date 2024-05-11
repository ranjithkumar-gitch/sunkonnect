
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sunkonnect/tickets/addMessage.dart';
import 'package:sunkonnect/tickets/viewMessage.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class MessageLogScreen extends StatefulWidget {
  const MessageLogScreen({super.key});

  @override
  State<MessageLogScreen> createState() => _MessageLogScreenState();
}

class _MessageLogScreenState extends State<MessageLogScreen> {
  List<MessageLog> message = [
    MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:46',
        messageId: 'TLG202404151489',
        sender: 'Sai Sharad Raj',
        message: 'drawing complete, please verify.',
       ),
       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:46',
        messageId: 'TLG202404151489',
        sender: 'Sai Sharad Raj',
        message: 'drawing complete, please verify.',
       ),
       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

        MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),

       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),
       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
        messageId: 'TLG202404151488',
        sender: 'Sandy Johnson',
        message: 'what\'s the status now ?',
       ),
       MessageLog(
        ticketId: 'TICK-431',
        logDate: '05-09-2024 14:03:11',
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
            label: const CustomText(text: 'Add Message', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.white),
            icon: const Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colors.orange, 
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
            fontSize: 20,
            fontWeight: FontWeight.w500,
            textcolor: Colors.black,
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewMessage()));
          },
          child: Card(
            child: Container(
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
                    fontWeight: FontWeight.w500,
                    textcolor:Colors.orange,),
              
                  CustomText(
                    text: message[index].ticketId,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    textcolor: Colors.black,),
              
                ],
                ),
                

                 const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: message[index].logDate,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.grey.shade700,),
              
                  CustomText(
                    text: message[index].sender,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.grey.shade700,),
                ],
                ),

                 const SizedBox(height: 5,),
          
                 CustomText(
                    text: message[index].message,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black,),
          
                     const SizedBox(height: 5,),
                
               ],
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
  final String ticketId;
  final String messageId;
  final String sender;
  final String message;
  final String logDate;

  MessageLog({
    required this.ticketId,
    required this.messageId,
    required this.sender,
    required this.message,
    required this.logDate,
    
  });
}