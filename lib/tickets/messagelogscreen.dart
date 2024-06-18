import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/loginflow/model/message_log_reponseModel.dart';

import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/addMessage.dart';
import 'package:sunkonnect/tickets/viewMessage.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';

class MessageLogScreen extends StatefulWidget {
  const MessageLogScreen({super.key});

  @override
  State<MessageLogScreen> createState() => _MessageLogScreenState();
}

class _MessageLogScreenState extends State<MessageLogScreen> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();

    myTicketsListProvider.messageLog();
    return SizedBox(
      child: Scaffold(
          key: scaffoldKey,
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            const CustomText(
              text: " Message Log ",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textcolor: Colours.kheadertext,
            ),
            const SizedBox(
              height: 10,
            ),
            // _searchFilters(),
            Selector<MyTicketsListProvider,
                ApiResponse<MessageLogResponseModel>?>(
              selector: (_, apiResponse) => apiResponse.messageLogResponseModel,
              builder: (_, instance, __) {
                if (instance?.status == Status.error) {
                  return FittedBox(
                      child: Text(instance?.errorMessage ?? "error"));
                } else if (instance?.status == Status.loading) {
                  return const Expanded(child: ProgressBarHUD());
                } else if (instance?.status == Status.completed) {
                  List<Datum?> messageloglistdata =
                      instance?.data?.data!.data ?? [];
                  print("now printing my tickts list data");
                  print(messageloglistdata);
                  inspect(messageloglistdata);

                  return messageloglistdata.isEmpty
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
                              itemCount: messageloglistdata.length,
                              itemBuilder: (context, index) {
                                return ExpandableNotifier(
                                  child: GestureDetector(
                                    onTap: () {
                                      myTicketsListProvider
                                          .clearviewmessagelogDetails();
                                      setState(() {
                                        SharedPrefServices.setDatumTicketId(
                                          messageloglistdata[index]!
                                              .datumTicketId
                                              .toString(),
                                        );
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ViewMessage()));
                                    },
                                    child: SingleChildScrollView(
                                      child:
                                          //  Text(messageloglistdata[index]!
                                          //     .ticketId
                                          //     .toString())
                                          Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Card(
                                              elevation: 1,
                                              color: Colours.kcardbgColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CustomText(
                                                            text: messageloglistdata[
                                                                    index]!
                                                                .datumTicketId
                                                                .toString(),
                                                            // message[index].messageId,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            textcolor:
                                                                Colors.black,
                                                          ),
                                                          Text(
                                                            messageloglistdata[
                                                                    index]!
                                                                .dateOfLog
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colours
                                                                        .ksubheadertext),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      CustomText(
                                                        text:
                                                            // messageloglistdata[
                                                            //                 index]!
                                                            //             .description!
                                                            //             .length <=
                                                            //         25
                                                            //     ?
                                                            messageloglistdata[
                                                                    index]!
                                                                .description
                                                                .toString(),
                                                        // : '${messageloglistdata[index]!.description.toString().substring(0, 25)} . . . . . . . .',
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textcolor:
                                                            Colours.kheadertext,
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: CustomText(
                                                          text: messageloglistdata[
                                                                  index]!
                                                              .raisebyObjectId!
                                                              .name
                                                              .toString(),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          textcolor: Colours
                                                              .kheadertext,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //                               floatingActionButton:
                                  //                               Padding(
                                  //    padding: const EdgeInsets.only(bottom: 15),
                                  //    child: SizedBox(
                                  //     height: 45, width: double.infinity,
                                  //      child: FloatingActionButton.extended(
                                  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  //       elevation: 0,
                                  //           onPressed: () {
                                  //            Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddMessage()));
                                  //           },
                                  //           label: const CustomText(text: 'Add Message', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colours.kwhiteColor),
                                  //           icon: const Icon(Icons.add,color: Colours.kwhiteColor,),
                                  //           backgroundColor: Colours.kbuttonpurple,
                                  //         ),
                                  //    ),
                                  //  ),
                                  //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                                );
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
  }
}
