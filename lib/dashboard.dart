// import 'package:flutter/material.dart';

// class DashboardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DashboardScreen(),
//     );
//   }
// }

// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   List<Ticket> myTickets = [
//     Ticket(
//       id: '123',
//       dateTime: '2024-02-19 09:00',
//       status: 'Open',
//       assignedTo: 'John Doe',
//       details: 'This is a sample ticket for demonstration purposes.',
//     ),
//     Ticket(
//       id: '123',
//       dateTime: '2024-02-19 09:00',
//       status: 'Open',
//       assignedTo: 'John Doe',
//       details: 'This is a sample ticket for demonstration purposes.',
//     ),
//     // Add more tickets as needed
//   ];

//   List<Ticket> allTickets = [
//     Ticket(
//       id: '456',
//       dateTime: '2024-02-18 10:30',
//       status: 'Closed',
//       assignedTo: 'Jane Smith',
//       details: 'Another sample ticket for demonstration purposes.',
//     ),
//     // Add more tickets as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Sunkonnect'),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.notifications),
//               onPressed: () {
//                 // Add notification functionality here
//               },
//             ),
//           ],
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'My Tickets'),
//               Tab(text: 'All Tickets'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildTicketList(myTickets),
//             _buildTicketList(allTickets),
//           ],
//         ),
//         drawer: Drawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               DrawerHeader(
//                 child: Text(
//                   'Side Menu',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                 ),
//               ),
//               ListTile(
//                 title: Text('Item 1'),
//                 onTap: () {
//                   // Add navigation to item 1 here
//                 },
//               ),
//               ListTile(
//                 title: Text('Item 2'),
//                 onTap: () {
//                   // Add navigation to item 2 here
//                 },
//               ),
//               // Add more list items as needed
//             ],
//           ),

//         ),
//       ),
//     );
//   }

//   Widget _buildTicketList(List<Ticket> tickets) {
//     return ListView.builder(
//       itemCount: tickets.length,
//       itemBuilder: (context, index) {
//         return Card(
//           margin: EdgeInsets.all(10),
//           child: ListTile(
//             title: Text('Ticket ID: ${tickets[index].id}'),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Date-Time: ${tickets[index].dateTime}'),
//                 Text('Status: ${tickets[index].status}'),
//                 Text('Assigned To: ${tickets[index].assignedTo}'),
//                 Text('Details: ${tickets[index].details}'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class Ticket {
//   final String id;
//   final String dateTime;
//   final String status;
//   final String assignedTo;
//   final String details;

//   Ticket({
//     required this.id,
//     required this.dateTime,
//     required this.status,
//     required this.assignedTo,
//     required this.details,
//   });
// }
import 'package:flutter/material.dart';
import 'package:sunkonnect/myprofilepage.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/ticketdetailsscreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  String _selectedStatus = 'All';

  List<Ticket> myTickets = [
    Ticket(
        id: 'TICK-409',
        dateTime: '2024-02-19 09:00',
        status: 'New',
        assignedTo: 'ranjith',
        priority: 'High',
        message: 'This is a sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard'),
    Ticket(
        id: 'TICK-410',
        dateTime: '2024-02-18 10:30',
        status: 'Assigned',
        assignedTo: 'Uday',
        priority: 'High',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'Acknoledged',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'In process',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'Completed',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    // Add more tickets as needed
  ];

  List<Ticket> allTickets = [
    Ticket(
        id: 'TICK-410',
        dateTime: '2024-02-18 10:30',
        status: 'Assigned',
        assignedTo: 'Uday',
        priority: 'High',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'Acknoledged',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'In process',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'Completed',
        assignedTo: 'Kumar',
        priority: 'Medium',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        title: 'Dropdown issue in dashboard.'),
    // Add more tickets as needed
  ];

  @override
  Widget build(BuildContext context) {
    List<Ticket> filteredTickets;
    if (_selectedStatus == 'All') {
      filteredTickets = _currentIndex == 0 ? myTickets : allTickets;
    } else {
      filteredTickets = (_currentIndex == 0 ? myTickets : allTickets)
          .where((ticket) => ticket.status == _selectedStatus)
          .toList();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Connect@SunKpo',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {
              // Add notification functionality here
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationListScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 40,
                      child: TextFormField(
                          decoration: InputDecoration(
                        hintText: "Search by ID..",
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        // suffixIcon:
                        //     const Icon(Icons.edit, size: 18, color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    value: _selectedStatus,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedStatus = newValue!;
                      });
                    },
                    items: [
                      'All',
                      'New',
                      'Assigned',
                      'Acknoledged',
                      'In process',
                      'Completed'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: _buildTicketList(
                  _currentIndex == 0 ? myTickets : allTickets)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  SizedBox(
                      height: 40,
                      width: 250,
                      child: Image(image: AssetImage('assets/LOGO.png'))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Connect@SunKpo',
                    style: TextStyle(color: Colors.orange, fontSize: 24),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('My profile'),
              onTap: () {
                // Add navigation to item 1 here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              title: Text('Privacy Policy'),
              onTap: () {
                // Add navigation to item 2 here
              },
            ),
            ListTile(
              title: Text('Terms and conditions'),
              onTap: () {
                // Add navigation to item 2 here
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Add navigation to item 2 here
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        // selectedLabelStyle: TextStyle(color: Colors.white),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'My Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: 'All Tickets',
          ),
        ],
      ),
    );
  }

  Widget _buildTicketList(List<Ticket> tickets) {
    // return ListView.builder(
    //   itemCount: tickets.length,
    //   itemBuilder: (context, index) {
    //     Color cardColor;
    //     switch (tickets[index].status) {
    //       case 'Closed':
    //         cardColor = Colors.green;
    //         break;
    //       case 'Open':
    //         cardColor = Colors.red;
    //         break;
    //       case 'OnGoing':
    //         cardColor = Colors.orange;
    //         break;
    //       default:
    //         cardColor = Colors.white;
    //         break;
    //     }
    //     return Card(
    //       margin: EdgeInsets.all(10),
    //       child: ListTile(
    //         onTap: () {
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) =>
    //                   TicketDetailsScreen(ticket: tickets[index]),
    //             ),
    //           );
    //         },
    //         title: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       '${tickets[index].id}',
    //                       style: TextStyle(color: Colors.orange),
    //                     ),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text('Assigned To: ${tickets[index].assignedTo}'),
    //                         Text('Raised by: Uday'),
    //                         SizedBox(
    //                           height: 5,
    //                         ),
    //                         Text('${tickets[index].dateTime}'),
    //                         // Text('Details: ${tickets[index].details}'),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //                 Column(
    //                   children: [
    //                     Container(
    //                       width: 100.0,
    //                       alignment: Alignment.center,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: Colors.green),
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(8.0),
    //                         ),
    //                       ),
    //                       child: Text(
    //                         '${tickets[index].status}',
    //                         style: TextStyle(color: cardColor),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       height: 10,
    //                     ),
    //                     Container(
    //                       width: 100.0,
    //                       alignment: Alignment.center,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(color: Colors.red),
    //                         borderRadius: BorderRadius.all(
    //                           Radius.circular(8.0),
    //                         ),
    //                       ),
    //                       child: Text(
    //                         'High',
    //                         style: TextStyle(
    //                           color: cardColor,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
    // Widget _buildTicketList(List<Ticket> tickets) {
    Map<String, Color> priorityColors = {
      'High': Colors.red,
      'Medium': Colors.orange,
      // 'Low': Colors.green,
    };
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        Color priorityColor =
            priorityColors[tickets[index].priority] ?? Colors.white;

        Color cardColor;
        switch (tickets[index].status) {
          case 'New':
            cardColor = Colors.deepOrange;
            break;
          case 'Assigned':
            cardColor = Colors.blueAccent;
            break;
          case 'Acknoledged':
            cardColor = Colors.orangeAccent;
            break;
          case 'In process':
            cardColor = Colors.purple;
            break;
          case 'Completed':
            cardColor = Colors.green;
            break;
          default:
            cardColor = Colors.white;
            break;
        }

        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TicketDetailsScreen(ticket: tickets[index]),
                ),
              );
            },
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${tickets[index].id}',
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Assigned To: ${tickets[index].assignedTo}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Raised by: ${tickets[index].raisedBy}',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${tickets[index].dateTime}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text(
                        'Days Open: 2',
                        style: TextStyle(fontSize: 12, color: Colors.orange),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: cardColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        '${tickets[index].status}',
                        style: TextStyle(color: cardColor),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: priorityColor),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        '${tickets[index].priority}',
                        style: TextStyle(color: priorityColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Ticket {
  final String id;
  final String title;
  late final String status;
  final String priority;
  final String assignedTo;
  final String raisedBy;
  late final String message;
  final List<String> attachments;
  final String dateTime;

  Ticket({
    required this.id,
    required this.title,
    required this.status,
    required this.priority,
    required this.assignedTo,
    required this.raisedBy,
    required this.message,
    required this.attachments,
    required this.dateTime,
  });
}
