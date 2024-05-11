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
      appBar: AppBar(
        title: Text('Edit Ticket'),
      ),
      body: Card(
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
                child: ElevatedButton(
                  onPressed: () {
                    // Update the ticket object with edited values
                    // widget.ticket.message = _messageController.text;
                    // widget.ticket.status = _statusController.text;

                    // Navigate back to TicketDetailsScreen with updated ticket
                    // Navigator.pop(context, widget.ticket);
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
