import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class TicketLogScreen extends StatefulWidget {
  const TicketLogScreen({super.key});

  @override
  State<TicketLogScreen> createState() => _TicketLogScreenState();
}

class _TicketLogScreenState extends State<TicketLogScreen> {
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
        
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
             
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const CustomText(
                                         text: " TICK-410 ",
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.orange,
                                           ),

                                     CustomText(
                                         text: "2024-02-18 10:30",
                                         fontSize: 13,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.grey.shade600,
                                           ),


                                  
                           ],
                         ),
                        
                        SizedBox(height: 5),
                           const CustomText(
                           text: "Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.",
                          fontSize: 13,
                           fontWeight: FontWeight.w400,
                         textcolor: Colors.black,
                          ),
                        
                       
                        SizedBox(height: 5),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
             
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const CustomText(
                                         text: " TICK-410 ",
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.orange,
                                           ),

                                     CustomText(
                                         text: "2024-02-18 10:30",
                                         fontSize: 13,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.grey.shade600,
                                           ),
                           ],
                         ),
                        
                        SizedBox(height: 5),
                           const CustomText(
                           text: "Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.",
                          fontSize: 13,
                           fontWeight: FontWeight.w400,
                         textcolor: Colors.black,
                          ),
                        
                       
                        SizedBox(height: 5),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
             
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const CustomText(
                                         text: " TICK-410 ",
                                         fontSize: 15,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.orange,
                                           ),

                                     CustomText(
                                         text: "2024-02-18 10:30",
                                         fontSize: 13,
                                         fontWeight: FontWeight.w500,
                                         textcolor: Colors.grey.shade600,
                                           ),     
                           ],
                         ),
                        
                        SizedBox(height: 5),
                           const CustomText(
                           text: "Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.",
                          fontSize: 13,
                           fontWeight: FontWeight.w400,
                         textcolor: Colors.black,
                          ),
                        
                       
                    
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
