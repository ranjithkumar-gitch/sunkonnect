import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/tickets/model/get_ticket_log_responsemodel.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';

class TicketLogScreen extends StatefulWidget {
  const TicketLogScreen({super.key});

  @override
  State<TicketLogScreen> createState() => _TicketLogScreenState();
}

class _TicketLogScreenState extends State<TicketLogScreen> {
  // String formatDate(String date) {
  //   DateTime dateTime = DateTime.parse(date);

  //   DateFormat formatter = DateFormat('MM-dd-yyyy, HH:mm:ss');

  //   return formatter.format(dateTime);
  // }

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

  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();

    myTicketsListProvider.getticketlistLog();
    return SizedBox(
      child: Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: " Ticket Log ",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textcolor: Colours.kheadertext,
            ),
            const SizedBox(
              height: 10,
            ),
            // _searchFilters(),
            Selector<MyTicketsListProvider,
                ApiResponse<GetticketLogResponseModel>?>(
              selector: (_, apiResponse) =>
                  apiResponse.getticketLogResponseModel,
              builder: (_, instance, __) {
                if (instance?.status == Status.error) {
                  return FittedBox(
                      child: Text(instance?.errorMessage ?? "error"));
                } else if (instance?.status == Status.loading) {
                  return const Expanded(child: ProgressBarHUD());
                } else if (instance?.status == Status.completed) {
                  List<Datum?> getticketlistLog = instance?.data?.data ?? [];
                  print("now printing my tickts list data");
                  print(getticketlistLog);
                  inspect(getticketlistLog);

                  return getticketlistLog.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            Text(
                              "data NOT recieved. EMPTY",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 33),
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
                              itemCount: getticketlistLog.length,
                              itemBuilder: (context, index) {
                                return ExpandableNotifier(
                                    child: Column(
                                  children: [
                                    Card(
                                        elevation: 1,
                                        color: Colours.kcardbgColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colours.kcardbgColor,
                                          ),
                                          child: Container(
                                            color: Colours.kcardbgColor,
                                            margin: const EdgeInsets.only(
                                                right: 10, left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomText(
                                                  text: getticketlistLog[index]!
                                                      .emailBody
                                                      .toString(),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  textcolor:
                                                      Colours.kheadertext,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    formatDate(
                                                      getticketlistLog[index]!
                                                          .createdAt
                                                          .toString(),
                                                    ),
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        color: Colours
                                                            .ksubheadertext),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
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
          ])),
    );

// class TicketLog {
//   final String ticketId;
//   final String date;
//   final String message;

//   TicketLog({
//     required this.ticketId,
//     required this.date,
//      required this.message,

//   });
  }
}
