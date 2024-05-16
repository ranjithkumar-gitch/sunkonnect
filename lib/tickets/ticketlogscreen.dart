import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class TicketLogScreen extends StatefulWidget {
  const TicketLogScreen({super.key});

  @override
  State<TicketLogScreen> createState() => _TicketLogScreenState();
}

class _TicketLogScreenState extends State<TicketLogScreen> {

  List<TicketLog> ticketlog = [
    TicketLog(
        ticketId: 'TICK-431',
        date: '05-09-2024 , 14:03:46',
        message: 'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
       ),

      TicketLog(
        ticketId: 'TICK-431',
        date: '05-09-2024 , 14:03:46',
        message: 'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
       ),
       
       TicketLog(
        ticketId: 'TICK-431',
        date: '05-09-2024 , 14:03:46',
        message: 'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
       ),
       
       
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
         const CustomText(
            text: " Ticket Log ",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            textcolor: Colors.black,
              ),

   const  SizedBox(height: 10,) ,
              Expanded(
        child: ListView.builder(
          itemCount: ticketlog.length,
          itemBuilder: (context, index) {
          
       return Column(
      children: [
        Card(
          elevation: 1,
          color: Colours.klightpink,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),   color: Colours.klightpink,),
            child: Container(
               color: Colours.klightpink,
              margin: const EdgeInsets.only(right: 10,left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 const SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: ticketlog[index].ticketId,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor:Colours.korange,),
              
                  CustomText(
                    text: ticketlog[index].date,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    textcolor: Colours.korange,),
              
                ],
                ),
                
            
                 const SizedBox(height: 5,),

                 CustomText(
                    text: ticketlog[index].message,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textcolor: Colors.black,),
                      
                     const SizedBox(height: 10,),
                
               ],
              ),
            ),
          )
          
        ),
          const SizedBox(height: 10,),
      ],
            );
            
          },
        ),
      ),
        
         
          
        ],
      ),
    );
  }
}
class TicketLog {
  final String ticketId;
  final String date;
  final String message;
 

  TicketLog({
    required this.ticketId,
    required this.date,
     required this.message,
    
    
  });
}
