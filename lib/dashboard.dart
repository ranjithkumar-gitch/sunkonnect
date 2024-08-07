import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/sidemenu/sidemenu.dart';
import 'package:sunkonnect/tickets/all_tickets_new.dart';
import 'package:sunkonnect/tickets/model/get_email_notification_lis_request_Modelt.dart';
import 'package:sunkonnect/tickets/my_tickets_new.dart';
import 'package:sunkonnect/tickets/viewMessage.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  int selectIndex = 0;
  late GetEmailNotificationListRequestModel requestModel;
  bool isApiCallProcess = false;
  bool readNotification = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    requestModel = GetEmailNotificationListRequestModel(
      userId: SharedPrefServices.getuserId().toString(),
      generatedId: "",
      startDate: "",
      endDate: "",
    );
    getFlag();
    updateNotificationStatus();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      updateNotificationStatus();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List children = const [
    MyTicketsList(),
    AllTicketsList(),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateNotificationStatus();
  }

  //  Future<void> updateNotificationStatus() async {
  //   await notificationBadge();
  //   setState(() {
  //     readNotification = SharedPrefServices.getreadStatus() ?? false;
  //   });
  // }

  Future<void> updateNotificationStatus() async {
    String? userId = SharedPrefServices.getuserId();
    if (userId == null || userId.isEmpty) {
      _timer.cancel();
      return;
    }

    await notificationBadge();
    setState(() {
      readNotification = SharedPrefServices.getreadStatus() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();
    readNotification = SharedPrefServices.getreadStatus() ?? false;
    print('Testing Notification $readNotification');
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
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Icons.notifications,
                  color: readNotification ? Colors.white : Colors.white,
                ),
                if (!readNotification)
                  Positioned(
                    right: 0,
                    top: 2,
                    left: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              setState(() {
                myTicketsListProvider.clearEmailNotificationList();
                myTicketsListProvider.clearSelectedTicketDetails();
                myTicketsListProvider.clearmessagelogDetails();
                myTicketsListProvider.clearticketlogDetails();

                // myTicketsListProvider.clearTicketList();
                readNotification = false;
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
      } else {
        showToast("Failed to fetch email flag");
      }
    }).catchError((error) {
      showToast("Error: ${error.toString()}");
    });
  }

  Future<void> notificationBadge() async {
    if (isApiCallProcess) return;
    setState(() {
      isApiCallProcess = true;
    });

    try {
      ApiService apiService = ApiService();
      var response = await apiService.notificationFlag(requestModel);

      if (response.status == 200 || response.status == 201) {
        if (response.data?.data != null && response.data!.data!.isNotEmpty) {
          var userReadStatus = response.data!.data![0].userReadStatus;
          if (userReadStatus != null) {
            SharedPrefServices.setreadStatus(userReadStatus.read ?? false);
            print('User read status: ${userReadStatus.read}');
          }
        }
        // showToast("Read Status Successfully");
      } else {
        showToast("Failed to update read");
      }
    } catch (error) {
      print("Error updating userRead: $error");
      showToast("An error occurred");
    } finally {
      setState(() {
        isApiCallProcess = false;
      });
    }
  }
}
