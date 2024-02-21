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
      id: 'T20240221123',
      dateTime: '2024-02-19 09:00',
      status: 'Open',
      assignedTo: 'ranjith',
      details: 'This is a sample ticket for demonstration purposes.',
    ),
    Ticket(
      id: 'T20240221456',
      dateTime: '2024-02-18 10:30',
      status: 'Closed',
      assignedTo: 'Uday',
      details: 'Another sample ticket for demonstration purposes.',
    ),
    Ticket(
      id: 'T20240221456',
      dateTime: '2024-02-18 10:30',
      status: 'OnGoing',
      assignedTo: 'Kumar',
      details: 'Another sample ticket for demonstration purposes.',
    ),
    // Add more tickets as needed
  ];

  List<Ticket> allTickets = [
    Ticket(
      id: 'T20240221456',
      dateTime: '2024-02-18 10:30',
      status: 'Closed',
      assignedTo: 'Uday',
      details: 'Another sample ticket for demonstration purposes.',
    ),
    Ticket(
      id: 'T20240221789',
      dateTime: '2024-02-18 10:30',
      status: 'Closed',
      assignedTo: 'Teja',
      details: 'Another sample ticket for demonstration purposes.',
    ),
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
          'SunKonnect',
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
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: OutlineInputBorder(),
                    ),
                  ),
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
                    items: ['All', 'Open', 'Closed', 'OnGoing']
                        .map<DropdownMenuItem<String>>((String value) {
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
                  Text(
                    'SunKonnect',
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
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        Color cardColor;
        switch (tickets[index].status) {
          case 'Closed':
            cardColor = Colors.green;
            break;
          case 'Open':
            cardColor = Colors.red;
            break;
          case 'OnGoing':
            cardColor = Colors.orange;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID: ${tickets[index].id}',
                  style: TextStyle(color: Colors.orange),
                ),
                Text(
                  '${tickets[index].status}',
                  style: TextStyle(color: cardColor),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Assigned To: ${tickets[index].assignedTo}'),
                SizedBox(
                  height: 5,
                ),
                Text('${tickets[index].dateTime}'),
                // Text('Details: ${tickets[index].details}'),
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
  final String dateTime;
  late final String status;
  final String assignedTo;
  late final String details;

  Ticket({
    required this.id,
    required this.dateTime,
    required this.status,
    required this.assignedTo,
    required this.details,
  });
}
