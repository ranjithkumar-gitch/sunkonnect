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
      // appBar: AppBar(
      //   title: Text('Ticket Details'),
      // ),
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
                                'TICK-409',
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
                                'Date and Time: 2024-02-19 09:00',
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
                                  'New',
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
                                  'High',
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
                          SizedBox(child: Text('Dropdown issue in dashboard'))
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
                            'ranjith',
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
                            'Ranjith',
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
                            'This is a sample ticket for demonstration purposes.',
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
