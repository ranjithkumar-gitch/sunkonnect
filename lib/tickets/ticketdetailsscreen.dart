import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/editstatus.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class TicketDetailsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
     floatingActionButton: Padding(
     padding: const EdgeInsets.only(bottom: 5),
     child: SizedBox(
      height: 45, width: double.infinity,
       child: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
            onPressed: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddMessage()));
            },
            label: const CustomText(text: 'EDIT', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.white),
            icon: const Icon(Icons.add,color: Colors.white,),
            backgroundColor: Colours.kbuttonpurple, 
          ),
          
     ),
   ),
   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                color: Colours.klightpink,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                
                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),   color: Colours.klightpink,),
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: 'TICK-409', fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colours.korange),
                            CustomText(text: ' 2024-02-19, 09:00', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colours.korange),
                          ],
                        ),
                             
                         SizedBox(height: 10),
                         ContentCard(title: 'Company', content: 'SunKpo'),
                         ContentCard(title: 'Customer', content: 'REXEL USA '),
                         ContentCard(title: 'Branch Name', content: 'Rexel-Santa-Clara '),
                         ContentCard(title: 'Requested By', content: '31-05-2024 '),
                         ContentCard(title: 'Title', content: 'Test panelboard - 2nd revision required '),
                         ContentCard(title: 'Category', content: 'Panel Build - Shop Package '),
                         ContentCard(title: 'Priority', content: 'Medium'),
                        ContentCard(title: 'Status', content: 'Closed'),
                         ContentCard(title: 'Raised By', content: 'Ranjith'),
                         ContentCard(title: 'Assigned To', content: 'Uday Teja'),
                         ContentCard(title: 'Date Closed', content: '11-05-2024, 4:30'),
                  
                    
                  
                         SizedBox(height: 10),
                        
                        CustomText(text: 'Message', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.orange),
                        
                         SizedBox(
                          height: 10,
                        ),
                         SizedBox(
                          child: CustomText(
                text: 'This is a sample ticket for demonstration purposes.',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textcolor:Colors.black,),
                         
                        ),
                         SizedBox(height: 10),
                         CustomText(text: 'Attachments', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.orange),
                        
                         SizedBox(height: 5),

                 SizedBox(height: 10,),
                   CustomText(
                text: 'http://www.example.com/image1.jpg',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textcolor:Colors.black,),
                   SizedBox(height: 10,),
                   CustomText(
                text: 'http://www.example.com/image1.pdf',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                textcolor:Colors.black,),
                   SizedBox(height: 10,), 
                        // AttachmentsGrid(),
                         SizedBox(height: 10),
                            
                        // Center(
                        //     child: CustomButton(
                        //         text: "Update Status",
                        //         textColor: Colors.white,
                        //         onPressed: () async {
                        //           final updatedTicket = await Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //               builder: (context) => EditTicketScreen(),
                        //             ),
                        //           );
                            
                        //           // Update ticket if it's not null (i.e., if user saved changes)
                        //           if (updatedTicket != null) {
                        //             // setState(() {
                        //             //   ticket = updatedTicket;
                        //             // });
                        //           }
                        //           // updateProfile();
                        //         },
                        //         color: Colors.orange,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
              ),
                const SizedBox(
          height: 80,
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
        SizedBox(
          width: double.infinity,
          
          child:  CustomText(text: title, fontSize: 13, fontWeight: FontWeight.w400, textcolor: Colors.grey.shade600),
        ),
     

        SizedBox(
          width: double.infinity,
          
          child: CustomText(text: content, fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colors.black),
        ),

           const SizedBox(
          height: 10,
        ),
        
      ],
    );
  }

  


}

class AttachmentsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      child: GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), 
        children: List.generate(10, (index) {
          
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/img.jpeg', 
              fit: BoxFit.cover,
            ),
          );
        }),
      ),
    );
  }
}



//  OutlinedButton(
//         onPressed: () {
//        Navigator.pop(context);
//        },
//      style: OutlinedButton.styleFrom(
//     side:
//       const BorderSide(color: Colours.kbuttonpurple,),
//     shape: RoundedRectangleBorder(
//     borderRadius:
//     BorderRadius.circular(10)),
//   ),
//    child: const Text(
//    "Edit",
//    style: TextStyle(color: Colours.kbuttonpurple,),
//    ))
                             



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
