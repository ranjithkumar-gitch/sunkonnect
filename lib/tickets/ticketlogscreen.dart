import 'package:flutter/material.dart';

class TicketLogScreen extends StatefulWidget {
  const TicketLogScreen({super.key});

  @override
  State<TicketLogScreen> createState() => _TicketLogScreenState();
}

class _TicketLogScreenState extends State<TicketLogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => TicketTabView()

              //         // TicketDetailsScreen(ticket: tickets[index]),
              //         ),
              //   );
              // },
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TICK-410',
                          style: TextStyle(color: Colors.orange),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        // Text(
                        //   'Raised by: ${tickets[index].raisedBy}',
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Text(
                          '2024-02-18 10:30',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => TicketTabView()

              //         // TicketDetailsScreen(ticket: tickets[index]),
              //         ),
              //   );
              // },
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TICK-410',
                          style: TextStyle(color: Colors.orange),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        // Text(
                        //   'Raised by: ${tickets[index].raisedBy}',
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Text(
                          '2024-02-18 10:30',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => TicketTabView()

              //         // TicketDetailsScreen(ticket: tickets[index]),
              //         ),
              //   );
              // },
              title: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TICK-410',
                          style: TextStyle(color: Colors.orange),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Sandy Johnson has changed status of #TICK-431 Test panelboard - 2nd revision required from Completed to Closed.',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        // Text(
                        //   'Raised by: ${tickets[index].raisedBy}',
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Text(
                          '2024-02-18 10:30',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
