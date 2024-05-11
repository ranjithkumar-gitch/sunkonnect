import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sunkonnect/dashboard.dart';

import 'package:sunkonnect/editscreen.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class TicketDetailsScreen extends StatelessWidget {
  // final Ticket ticket;

  // TicketDetailsScreen({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Ticket Details'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  const  SizedBox(height: 10,) ,
              const CustomText(
            text: " Ticket Details ",
            fontSize: 20,
            fontWeight: FontWeight.w500,
            textcolor: Colors.black,
              ),
             const  SizedBox(height: 10,) ,
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const  CustomText(text: 'TICK-409', fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colors.orange),
                            CustomText(text: ' 2024-02-19, 09:00', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                        ],
                      ),
                           
                                        
                      const SizedBox(height: 10),
                      CustomText(text: 'Company', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'SunKpo ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Customer', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'REXEL USA ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Branch Name', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Rexel-Santa-Clara ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Requested By', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: '31-05-2024 ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Title ', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Test panelboard - 2nd revision required ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                       const SizedBox(height: 10),
                      CustomText(text: 'Category', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Panel Build - Shop Package ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Priority', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Medium ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Status', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Closed ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Raised By', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Ranjith ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Assigned To', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: 'Uday Teja', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                      const SizedBox(height: 10),
                      CustomText(text: 'Date Closed', fontSize: 13, fontWeight: FontWeight.w500, textcolor: Colors.grey.shade600),
                      const  CustomText(text: '11-05-2024, 4:30 ', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
                       
                      
                      SizedBox(height: 10),
                      
           const CustomText(text: 'Message', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.orange),
                      
                      const SizedBox(
                        height: 10,
                      ),
                      DottedBorder(
                        child: const SizedBox(
                          child: Text(
                            'This is a sample ticket for demonstration purposes.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      const CustomText(text: 'Attachments', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.orange),
                      
                      SizedBox(height: 5),
                      AttachmentsGrid(),
                      SizedBox(height: 10),
          
                      Center(
                          child: CustomButton(
                              text: "Edit",
                              textColor: Colors.white,
                              onPressed: () async {
                                final updatedTicket = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditTicketScreen(),
                                  ),
                                );
          
                                // Update ticket if it's not null (i.e., if user saved changes)
                                if (updatedTicket != null) {
                                  // setState(() {
                                  //   ticket = updatedTicket;
                                  // });
                                }
                                // updateProfile();
                              },
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttachmentsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      child: GridView.count(
        crossAxisCount: 5, // Number of columns
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(), // Disable scrolling
        children: List.generate(10, (index) {
          // Generate 10 image widgets
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/img.jpeg', // Adjust image paths accordingly
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}







// previous code by ranjith 
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:sunkonnect/dashboard.dart';

// import 'package:sunkonnect/editscreen.dart';
// import 'package:sunkonnect/widgets/customtextviews.dart';

// class TicketDetailsScreen extends StatelessWidget {
//   // final Ticket ticket;

//   // TicketDetailsScreen({required this.ticket});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       // appBar: AppBar(
//       //   title: Text('Ticket Details'),
//       // ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//                   const  SizedBox(height: 10,) ,
//               const CustomText(
//             text: " Ticket Details ",
//             fontSize: 20,
//             fontWeight: FontWeight.w500,
//             textcolor: Colors.black,
//               ),
//              const  SizedBox(height: 10,) ,
//               Card(
//                 elevation: 3,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                      
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Column(
//                             children: [
//                               CustomText(text: 'TICK-409', fontSize: 18, fontWeight: FontWeight.w600, textcolor: Colors.orange),
                              
//                               Text(
//                                 "",
//                                 // '${ticket.id}',
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.orange),
//                               ),
//                               Text(
//                                 "",
//                                 // '${ticket.id}',
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.orange),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
                              
//                               Text(
//                                 'Date and Time: 2024-02-19 09:00',
//                                 style:
//                                     TextStyle(fontSize: 12, color: Colors.grey),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Container(
//                                 width: 100.0,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.amber),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'New',
//                                   style: TextStyle(color: Colors.amber),
//                                 ),
//                               ),
//                               SizedBox(height: 10),
//                               Container(
//                                 width: 100.0,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.red),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(8.0),
//                                   ),
//                                 ),
//                                 child: Text(
//                                   'High',
//                                   style: TextStyle(color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Tittle: ',
//                             style:
//                                 TextStyle(fontSize: 16, color: Colors.orange),
//                           ),
//                           SizedBox(child: Text('Dropdown issue in dashboard'))
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Customer Name: ',
//                             style:
//                                 TextStyle(fontSize: 14, color: Colors.orange),
//                           ),
//                           Text(
//                             'ORBEX',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Branch Name: ',
//                             style:
//                                 TextStyle(fontSize: 14, color: Colors.orange),
//                           ),
//                           Text(
//                             'Orbex - Okland',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       // Text(
//                       //   'Status: ${ticket.status}',
//                       //   style: TextStyle(fontSize: 18),
//                       // ),
//                       // SizedBox(height: 10),
//                       // Text(
//                       //   'Priority: ${ticket.priority}',
//                       //   style: TextStyle(fontSize: 18),
//                       // ),
//                       // SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Assigned To: ',
//                             style:
//                                 TextStyle(fontSize: 14, color: Colors.orange),
//                           ),
//                           Text(
//                             'ranjith',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Raised By: ',
//                             style:
//                                 TextStyle(fontSize: 14, color: Colors.orange),
//                           ),
//                           Text(
//                             'Ranjith',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Text(
//                             'Days open: ',
//                             style:
//                                 TextStyle(fontSize: 14, color: Colors.orange),
//                           ),
//                           Text(
//                             '2',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
          
//                       Text(
//                         'Message: ',
//                         style: TextStyle(fontSize: 14, color: Colors.orange),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       DottedBorder(
//                         child: SizedBox(
//                           child: Text(
//                             'This is a sample ticket for demonstration purposes.',
//                             style: TextStyle(fontSize: 14),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         'Attachments:',
//                         style: TextStyle(
//                             fontSize: 14,
//                             // fontWeight: FontWeight.bold,
//                             color: Colors.orange),
//                       ),
//                       SizedBox(height: 5),
//                       AttachmentsGrid(),
//                       SizedBox(height: 10),
          
//                       Center(
//                           child: CustomButton(
//                               text: "Edit",
//                               textColor: Colors.white,
//                               onPressed: () async {
//                                 final updatedTicket = await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => EditTicketScreen(),
//                                   ),
//                                 );
          
//                                 // Update ticket if it's not null (i.e., if user saved changes)
//                                 if (updatedTicket != null) {
//                                   // setState(() {
//                                   //   ticket = updatedTicket;
//                                   // });
//                                 }
//                                 // updateProfile();
//                               },
//                               color: Colors.orange,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AttachmentsGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//       child: GridView.count(
//         crossAxisCount: 5, // Number of columns
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(), // Disable scrolling
//         children: List.generate(10, (index) {
//           // Generate 10 image widgets
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               'assets/img.jpeg', // Adjust image paths accordingly
//               fit: BoxFit.cover,
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
