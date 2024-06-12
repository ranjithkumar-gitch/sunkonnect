import 'package:flutter/material.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/sidemenu/sidemenu.dart';
import 'package:sunkonnect/tickets/all_tickets_new.dart';
import 'package:sunkonnect/tickets/my_tickets_new.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  List children = const [
    MyTicketsList(),
    AllTicketsList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colours.korange,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationListScreen()),
              );
            },
          ),
        ],
      ),
      body: children[selectIndex],
      drawer: const SideMenu(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colours.kbuttonpurple,
        currentIndex: selectIndex,
        selectedItemColor: Colours.kwhiteColor,
        unselectedItemColor: Colors.grey.shade400,
        onTap: _onItemTapped,
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
}
