import 'package:flutter/material.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class EditTicketScreen extends StatefulWidget {
  // final Ticket ticket;

  // EditTicketScreen({required this.ticket});

  @override
  _EditTicketScreenState createState() => _EditTicketScreenState();
}

class _EditTicketScreenState extends State<EditTicketScreen> {
  late TextEditingController _messageController;
  late TextEditingController _statusController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _statusController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Ticket'),
      ),
      body: Container(
          margin: EdgeInsets.only(right: 5,left: 5),
        child: Column(
          children: [
            SizedBox(height: 15,),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(labelText: 'Message'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _statusController,
                      decoration: InputDecoration(labelText: 'Status'),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: SizedBox(width: double.infinity,height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            // Update the ticket object with edited values
                            // widget.ticket.message = _messageController.text;
                            // widget.ticket.status = _statusController.text;
                        
                            // Navigate back to TicketDetailsScreen with updated ticket
                            // Navigator.pop(context, widget.ticket);
                          },
                          child: const Text('Save',style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
