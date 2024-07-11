import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/model/get_emailNotifications_responcemodel.dart';
import 'package:sunkonnect/tickets/model/get_email_notification_lis_request_Modelt.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';

class NotificationListScreen extends StatefulWidget {
  NotificationListScreen({super.key});

  @override
  State<NotificationListScreen> createState() => _NotificationListScreenState();
}

class _NotificationListScreenState extends State<NotificationListScreen> {
  late GetEmailNotificationListRequestModel notificationrequestModelId;

  bool isApiCallProcess = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    notificationrequestModelId = GetEmailNotificationListRequestModel(
      userId: SharedPrefServices.getuserId().toString(),
      generatedId: "",
      startDate: "",
      endDate: "",
    );
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 2) {
      return DateFormat('MM-dd-yyyy, HH:mm:ss ').format(dateTime);
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hr${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();

    myTicketsListProvider.loadEmailNotificationList(
        requestmodel: notificationrequestModelId.toJson());
    return Scaffold(
        key: scaffoldKey,
        appBar: const CustomAppbar(title: 'Notifications'),
        body: Column(children: [
          // _searchFilters(),
          Selector<MyTicketsListProvider,
              ApiResponse<GetEmailNotifiactonsResponseModel>?>(
            selector: (_, apiResponse) =>
                apiResponse.getEmailNotificationListResponseModel,
            builder: (_, instance, __) {
              if (instance?.status == Status.error) {
                return FittedBox(
                    child: Text(instance?.errorMessage ?? "error"));
              } else if (instance?.status == Status.loading) {
                return const Expanded(child: ProgressBarHUD());
              } else if (instance?.status == Status.completed) {
                List<Datum?> emailnotificationListData =
                    instance?.data?.data?.data ?? [];
                print("now printing email notifications list data");
                print(emailnotificationListData);
                inspect(emailnotificationListData);

                return emailnotificationListData.isEmpty
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "data NOT recieved. EMPTY",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                          // Image.asset(
                          //   'images/nodatafound.png',
                          //   height: 250,
                          //   width: 250,
                          // ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: emailnotificationListData.length,
                            itemBuilder: (context, index) {
                              return ExpandableNotifier(
                                  child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Card(
                                  elevation: 1,
                                  color: Colours.kcardbgColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: ListTile(
                                    title: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundColor:
                                              Colours.kbuttonpurple,
                                          child: Icon(
                                            Icons.notifications,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        CustomText(
                                            text: emailnotificationListData[
                                                    index]!
                                                .generatedId
                                                .toString()
                                                .toString(),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            textcolor: Colors.black),
                                      ],
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 4.0),
                                        Text(
                                          emailnotificationListData[index]!
                                              .emailBody
                                              .toString()
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Colours.kheadertext,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4.0),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            formatDate(
                                              emailnotificationListData[index]!
                                                  .createdAt
                                                  .toString()
                                                  .toString(),
                                            ),
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                color: Colours.ksubheadertext),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      // Add action to handle notification tap
                                    },
                                  ),
                                ),
                              ));
                            }),
                      );
              } else {
                return const Expanded(
                  child: ProgressBarHUD(),
                );
              }
            },
          )
        ]));
  }
}
