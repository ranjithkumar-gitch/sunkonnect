import 'package:flutter/material.dart';
import 'package:sunkonnect/dashboard.dart';

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
//         title: Text('Ticket Details'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Ticket ID: ${widget.ticket.id}',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Divider(color: Colors.grey),
//             SizedBox(height: 10),
//             Text(
//               'Date-Time:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               widget.ticket.dateTime,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Status:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             _isEditing
//                 ? DropdownButtonFormField<String>(
//                     value: _selectedStatus,
//                     onChanged: (newValue) {
//                       setState(() {
//                         _selectedStatus = newValue!;
//                       });
//                     },
//                     items: <String>['Open', 'Closed'].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   )
//                 : Text(
//                     widget.ticket.status,
//                     style: TextStyle(fontSize: 16),
//                   ),
//             SizedBox(height: 10),
//             Text(
//               'Assigned To:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               widget.ticket.assignedTo,
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Details:',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             _isEditing
//                 ? TextFormField(
//                     controller: _detailsController,
//                     maxLines: 5,
//                     decoration: InputDecoration(
//                       hintText: 'Enter details...',
//                       border: OutlineInputBorder(),
//                     ),
//                   )
//                 : Text(
//                     widget.ticket.details,
//                     style: TextStyle(fontSize: 16),
//                   ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 10.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               _isEditing
//                   ? ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           // Save changes
//                           widget.ticket.details = _detailsController.text;
//                           widget.ticket.status = _selectedStatus;
//                           // Perform save operation
//                           // After saving, disable editing mode
//                           _isEditing = false;
//                         });
//                       },
//                       child: Text('Save'),
//                     )
//                   : ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           // Enable editing mode
//                           _isEditing = true;
//                         });
//                       },
//                       child: Text('Edit'),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Ticket {
//   String id;
//   String dateTime;
//   String status;
//   String assignedTo;
//   String details;

//   Ticket({
//     required this.id,
//     required this.dateTime,
//     required this.status,
//     required this.assignedTo,
//     required this.details,
//   });
// }
import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';

class TicketDetailsScreen extends StatefulWidget {
  final Ticket ticket;

  TicketDetailsScreen({required this.ticket});

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  TextEditingController _detailsController = TextEditingController();
  String _selectedStatus = '';

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _detailsController.text = widget.ticket.details;
    _selectedStatus = widget.ticket.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ticket Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ID: ${widget.ticket.id}',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.ticket.dateTime}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(
                  'Status:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _isEditing
                    ? DropdownButtonFormField<String>(
                        value: _selectedStatus,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStatus = newValue!;
                          });
                        },
                        items: <String>['Open', 'Closed'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    : Text(
                        widget.ticket.status,
                        style: TextStyle(fontSize: 16),
                      ),
                SizedBox(height: 10),
                Text(
                  'Assigned To:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.ticket.assignedTo,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Comments:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                _isEditing
                    ? TextFormField(
                        controller: _detailsController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Enter details...',
                          border: OutlineInputBorder(),
                        ),
                      )
                    : Text(
                        widget.ticket.details,
                        style: TextStyle(fontSize: 16),
                      ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
            // padding: EdgeInsets.symmetric(vertical: 10.0),
            child: _isEditing
                ?
                // ElevatedButton(
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(
                //           Colors.orange), // Set button background color to orange
                //       minimumSize: MaterialStateProperty.all<Size>(Size(
                //           double.infinity,
                //           50)), // Set button width to double.infinity and height to 50
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         // Save changes
                //         widget.ticket.details = _detailsController.text;
                //         widget.ticket.status = _selectedStatus;
                //         // Perform save operation
                //         // After saving, disable editing mode
                //         _isEditing = false;
                //       });
                //     },
                //     child: Text(
                //       'Save',
                //       style: TextStyle(color: Colors.white),
                //     ),
                //   )
                Center(
                    child: CustomButton(
                        text: "Save",
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            // Save changes
                            widget.ticket.details = _detailsController.text;
                            widget.ticket.status = _selectedStatus;
                            // Perform save operation
                            // After saving, disable editing mode
                            _isEditing = false;
                          });

                          // updateProfile();
                        },
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600))
                :
                // ElevatedButton(
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(
                //           Colors.orange), // Set button background color to orange
                //       minimumSize: MaterialStateProperty.all<Size>(Size(
                //           double.infinity,
                //           50)), // Set button width to double.infinity and height to 50
                //     ),
                //     onPressed: () {
                //       setState(() {
                //         // Enable editing mode
                //         _isEditing = true;
                //       });
                //     },
                //     child: Text('Edit', style: TextStyle(color: Colors.white)),
                //   ),
                Center(
                    child: CustomButton(
                        text: "Edit",
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            // Enable editing mode
                            _isEditing = true;
                          });

                          // updateProfile();
                        },
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600))),
      ),
    );
  }
}

// class Ticket {
//   String id;
//   String dateTime;
//   String status;
//   String assignedTo;
//   String details;

//   Ticket({
//     required this.id,
//     required this.dateTime,
//     required this.status,
//     required this.assignedTo,
//     required this.details,
//   });
// }
