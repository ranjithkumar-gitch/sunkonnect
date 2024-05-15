import 'package:flutter/material.dart';
import 'package:sunkonnect/myprofilepage.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/tickets/ticketstabview.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';
import 'package:expandable/expandable.dart';

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
        category: "Enclosure MOD- shop Package",
        daysOpen: "3",
        title: 'Dropdown issue in dashboard'),
    Ticket(
        id: 'TICK-410',
        dateTime: '2024-02-18 10:30',
        status: 'Assigned',
        assignedTo: 'Uday',
        priority: 'Low',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        category: "Enclosure MOD- shop Package",
        daysOpen: "2",
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
        daysOpen: "3",
        category: "Enclosure MOD- shop Package",
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
        daysOpen: "1",
        category: "Enclosure MOD- shop Package",
        title: 'Dropdown issue in dashboard.'),
    Ticket(
        id: 'TICK-411',
        dateTime: '2024-02-18 10:30',
        status: 'Completed',
        assignedTo: 'Kumar',
        priority: 'High',
        message: 'Another sample ticket for demonstration purposes.',
        attachments: [],
        raisedBy: 'Ranjith',
        daysOpen: "4",
        category: "Enclosure MOD- shop Package",
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
        category: "Enclosure MOD- shop Package",
        daysOpen: "1",
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
        category: "Enclosure MOD- shop Package",
        daysOpen: "2",
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
        category: "Enclosure MOD- shop Package",
        daysOpen: "3",
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
        category: "Enclosure MOD- shop Package",
        daysOpen: "5",
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
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomText(
            text: 'Konnect @ Sun KPO',
            fontSize: 21,
            fontWeight: FontWeight.w500,
            textcolor: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
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
              title: const Text('My profile'),
              onTap: () {
                // Add navigation to item 1 here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                // Add navigation to item 2 here
              },
            ),
            ListTile(
              title: const Text('Terms and conditions'),
              onTap: () {
                // Add navigation to item 2 here
              },
            ),
            ListTile(
              title: const Text('Logout'),
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
        items: const [
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
        return ExpandableNotifier(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: <Widget>[
                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        iconColor: Color(0xffFFA500),
                      ),
                      header: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  tickets[index].id,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Color(0xffFFA500),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: Image(
                                        image: AssetImage(tickets[index]
                                                    .priority ==
                                                "High"
                                            ? "assets/highpriority.png"
                                            : tickets[index].priority ==
                                                    "Medium"
                                                ? 'assets/medpriority.png'
                                                : 'assets/lowpriority.png')))
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Customer Name   : ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Text(
                                  tickets[index].assignedTo.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Raised By   : ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Text(
                                  tickets[index].raisedBy,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Text(
                              tickets[index].title,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      collapsed: const Text(
                        "More details",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xffFFA500),
                          fontFamily: 'poppins',
                        ),
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Color(0xffCCCCCC),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Assigned To         : ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].assignedTo,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Days Open            : ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].daysOpen,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Created On           : ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].dateTime,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Closed On             : ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].dateTime,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Divider(
                            height: 2.0,
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          const Row(
                            children: [
                              Text(
                                " Category",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            tickets[index].category,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontFamily: 'poppins',
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          CustomButton(
                              text: "View Details",
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TicketTabView()),
                                );
                              },
                              color: Colors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          const SizedBox(
                            height: 4.0,
                          ),
                        ],
                      ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
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
  final String category;
  final String daysOpen;

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
    required this.category,
    required this.daysOpen,
  });
}
