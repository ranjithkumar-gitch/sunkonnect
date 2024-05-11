// import 'package:flutter/material.dart';
// import 'package:sunkonnect/dashboard.dart';

// // class TicketDetailsScreen extends StatefulWidget {
// //   final Ticket ticket;

// //   TicketDetailsScreen({required this.ticket});

// //   @override
// //   _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
// // }

// // class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
// //   TextEditingController _detailsController = TextEditingController();
// //   String _selectedStatus = '';

// //   bool _isEditing = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _detailsController.text = widget.ticket.details;
// //     _selectedStatus = widget.ticket.status;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Ticket Details'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: <Widget>[
// //             Text(
// //               'Ticket ID: ${widget.ticket.id}',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             SizedBox(height: 10),
// //             Divider(color: Colors.grey),
// //             SizedBox(height: 10),
// //             Text(
// //               'Date-Time:',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             Text(
// //               widget.ticket.dateTime,
// //               style: TextStyle(fontSize: 16),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Status:',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             _isEditing
// //                 ? DropdownButtonFormField<String>(
// //                     value: _selectedStatus,
// //                     onChanged: (newValue) {
// //                       setState(() {
// //                         _selectedStatus = newValue!;
// //                       });
// //                     },
// //                     items: <String>['Open', 'Closed'].map((String value) {
// //                       return DropdownMenuItem<String>(
// //                         value: value,
// //                         child: Text(value),
// //                       );
// //                     }).toList(),
// //                   )
// //                 : Text(
// //                     widget.ticket.status,
// //                     style: TextStyle(fontSize: 16),
// //                   ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Assigned To:',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             Text(
// //               widget.ticket.assignedTo,
// //               style: TextStyle(fontSize: 16),
// //             ),
// //             SizedBox(height: 10),
// //             Text(
// //               'Details:',
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             _isEditing
// //                 ? TextFormField(
// //                     controller: _detailsController,
// //                     maxLines: 5,
// //                     decoration: InputDecoration(
// //                       hintText: 'Enter details...',
// //                       border: OutlineInputBorder(),
// //                     ),
// //                   )
// //                 : Text(
// //                     widget.ticket.details,
// //                     style: TextStyle(fontSize: 16),
// //                   ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomAppBar(
// //         child: Container(
// //           padding: EdgeInsets.symmetric(vertical: 10.0),
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               _isEditing
// //                   ? ElevatedButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           // Save changes
// //                           widget.ticket.details = _detailsController.text;
// //                           widget.ticket.status = _selectedStatus;
// //                           // Perform save operation
// //                           // After saving, disable editing mode
// //                           _isEditing = false;
// //                         });
// //                       },
// //                       child: Text('Save'),
// //                     )
// //                   : ElevatedButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           // Enable editing mode
// //                           _isEditing = true;
// //                         });
// //                       },
// //                       child: Text('Edit'),
// //                     ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Ticket {
// //   String id;
// //   String dateTime;
// //   String status;
// //   String assignedTo;
// //   String details;

// //   Ticket({
// //     required this.id,
// //     required this.dateTime,
// //     required this.status,
// //     required this.assignedTo,
// //     required this.details,
// //   });
// // }
// import 'package:flutter/material.dart';
// import 'package:sunkonnect/widgets/customtextviews.dart';

// class TicketDetailsScreen extends StatefulWidget {
//   final Ticket ticket;

//   TicketDetailsScreen({required this.ticket});

//   @override
//   _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
// }

// class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
//   TextEditingController _detailsController = TextEditingController();
//   String _selectedStatus = '';

//   bool _isEditing = false;

//   @override
//   void initState() {
//     super.initState();
//     _detailsController.text = widget.ticket.details;
//     _selectedStatus = widget.ticket.status;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Ticket Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(5.0),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '${widget.ticket.id}',
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.orange,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       '${widget.ticket.dateTime}',
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),

//                 Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Title :',
//                       style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       'Dropdown issue in Ticket details screen',
//                       style: TextStyle(fontSize: 12, color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 // Divider(color: Colors.grey),

//                 Row(
//                   children: [
//                     Text(
//                       'Status:',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     _isEditing
//                         ? DropdownButtonFormField<String>(
//                             value: _selectedStatus,
//                             onChanged: (newValue) {
//                               setState(() {
//                                 _selectedStatus = newValue!;
//                               });
//                             },
//                             items:
//                                 <String>['Open', 'Closed'].map((String value) {
//                               return DropdownMenuItem<String>(
//                                 value: value,
//                                 child: Text(value),
//                               );
//                             }).toList(),
//                           )
//                         : Text(
//                             widget.ticket.status,
//                             style: TextStyle(fontSize: 12),
//                           ),
//                   ],
//                 ),

//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text(
//                       'Assigned To:',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       widget.ticket.assignedTo,
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Text(
//                       'Raised By:',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       widget.ticket.assignedTo,
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),

//                 SizedBox(height: 10),

//                 Row(
//                   children: [
//                     Text(
//                       'Message:',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     _isEditing
//                         ? TextFormField(
//                             controller: _detailsController,
//                             maxLines: 5,
//                             decoration: InputDecoration(
//                               hintText: 'Enter details...',
//                               border: OutlineInputBorder(),
//                             ),
//                           )
//                         : SizedBox(
//                             width: 250,
//                             child: Text(
//                               widget.ticket.details,
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       'Attachments:',
//                       style:
//                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Text(
//                       widget.ticket.assignedTo,
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//             // padding: EdgeInsets.symmetric(vertical: 10.0),
//             child: _isEditing
//                 ?
//                 // ElevatedButton(
//                 //     style: ButtonStyle(
//                 //       backgroundColor: MaterialStateProperty.all<Color>(
//                 //           Colors.orange), // Set button background color to orange
//                 //       minimumSize: MaterialStateProperty.all<Size>(Size(
//                 //           double.infinity,
//                 //           50)), // Set button width to double.infinity and height to 50
//                 //     ),
//                 //     onPressed: () {
//                 //       setState(() {
//                 //         // Save changes
//                 //         widget.ticket.details = _detailsController.text;
//                 //         widget.ticket.status = _selectedStatus;
//                 //         // Perform save operation
//                 //         // After saving, disable editing mode
//                 //         _isEditing = false;
//                 //       });
//                 //     },
//                 //     child: Text(
//                 //       'Save',
//                 //       style: TextStyle(color: Colors.white),
//                 //     ),
//                 //   )
//                 Center(
//                     child: CustomButton(
//                         text: "Save",
//                         textColor: Colors.white,
//                         onPressed: () {
//                           setState(() {
//                             // Save changes
//                             widget.ticket.details = _detailsController.text;
//                             widget.ticket.status = _selectedStatus;
//                             // Perform save operation
//                             // After saving, disable editing mode
//                             _isEditing = false;
//                           });

//                           // updateProfile();
//                         },
//                         color: Colors.orange,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600))
//                 :
//                 // ElevatedButton(
//                 //     style: ButtonStyle(
//                 //       backgroundColor: MaterialStateProperty.all<Color>(
//                 //           Colors.orange), // Set button background color to orange
//                 //       minimumSize: MaterialStateProperty.all<Size>(Size(
//                 //           double.infinity,
//                 //           50)), // Set button width to double.infinity and height to 50
//                 //     ),
//                 //     onPressed: () {
//                 //       setState(() {
//                 //         // Enable editing mode
//                 //         _isEditing = true;
//                 //       });
//                 //     },
//                 //     child: Text('Edit', style: TextStyle(color: Colors.white)),
//                 //   ),
//                 Center(
//                     child: CustomButton(
//                         text: "Edit",
//                         textColor: Colors.white,
//                         onPressed: () {
//                           setState(() {
//                             // Enable editing mode
//                             _isEditing = true;
//                           });

//                           // updateProfile();
//                         },
//                         color: Colors.orange,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600))),
//       ),
//     );
//   }
// }

// // class Ticket {
// //   String id;
// //   String dateTime;
// //   String status;
// //   String assignedTo;
// //   String details;

// //   Ticket({
// //     required this.id,
// //     required this.dateTime,
// //     required this.status,
// //     required this.assignedTo,
// //     required this.details,
// //   });
// // }
import 'package:flutter/material.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sunkonnect/editscreen.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class TicketDetailsScreen extends StatelessWidget {
  final Ticket ticket;

  TicketDetailsScreen({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                elevation: 8.0,
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
                          Column(
                            children: [
                              Text(
                                '${ticket.id}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              Text(
                                "",
                                // '${ticket.id}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              Text(
                                "",
                                // '${ticket.id}',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Date and Time: ${ticket.dateTime}',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 100.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.amber),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  '${ticket.status}',
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 100.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Text(
                                  '${ticket.priority}',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Tittle: ',
                            style:
                                TextStyle(fontSize: 16, color: Colors.orange),
                          ),
                          SizedBox(child: Text('${ticket.title}'))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Customer Name: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            'ORBEX',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Branch Name: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            'Orbex - Okland',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Text(
                      //   'Status: ${ticket.status}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // SizedBox(height: 10),
                      // Text(
                      //   'Priority: ${ticket.priority}',
                      //   style: TextStyle(fontSize: 18),
                      // ),
                      // SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Assigned To: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            '${ticket.assignedTo}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Raised By: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            '${ticket.raisedBy}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Days open: ',
                            style:
                                TextStyle(fontSize: 14, color: Colors.orange),
                          ),
                          Text(
                            '2',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Text(
                        'Message: ',
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      DottedBorder(
                        child: SizedBox(
                          child: Text(
                            '${ticket.message}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Attachments:',
                        style: TextStyle(
                            fontSize: 14,
                            // fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
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
                                    builder: (context) =>
                                        EditTicketScreen(ticket: ticket),
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
