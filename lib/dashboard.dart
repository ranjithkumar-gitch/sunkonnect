import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/sidemenu/sidemenu.dart';
import 'package:sunkonnect/tickets/all_tickets_new.dart';
import 'package:sunkonnect/tickets/my_tickets_new.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

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

  @override
  void initState() {
    super.initState();
    getFlag();
  }

  List children = const [
    MyTicketsList(),
    AllTicketsList(),
  ];

  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();

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
              setState(() {
                myTicketsListProvider.clearEmailNotificationList();
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationListScreen()),
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

  void getFlag() {
    ApiService apiService = ApiService();
    apiService.getEmailFlag().then((emailFlagValue) {
      if (emailFlagValue.status == 200 || emailFlagValue.status == 201) {
        print("Email flag is perfectly working");
        print(emailFlagValue.data?.first.fSendEmails.toString());

        SharedPrefServices.setemailFlag(
            emailFlagValue.data?.first.fSendEmails ?? false);
            print('Now Printing flag ${emailFlagValue.data?.first.fSendEmails}');
          // showToast('Now Printing flag ${emailFlagValue.data?.first.fSendEmails}');
      } else {
        // showToast("Failed to fetch email flag");
      }
    }).catchError((error) {
      // showToast("Error: ${error.toString()}");
    });
  }
}
