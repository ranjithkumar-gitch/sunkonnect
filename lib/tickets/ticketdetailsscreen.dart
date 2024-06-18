import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/load_data/api_response.dart';

import 'package:sunkonnect/loginflow/model/selected_ticket_response_model.dart.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isEdited = false;
  String status = 'Select Status';
  var items = [
    'Select Status',
    'All',
    'New',
    'Acknowledge',
    'Assigned',
    'In process',
    'Completed',
    'Closed',
    'Cancelled',
    'On Hold'
  ];

  String assigned = 'Select Assigned To';
  var name = [
    'Select Assigned To',
    'Vishal',
    'Sai Sharad Raj',
    'Uday Teja',
    'Ranjith',
    'Hiranya',
    'Balaji',
    'Srikanth',
  ];

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    DateFormat formatter = DateFormat('MM-dd-yyyy, HH:mm:ss');

    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var selectedMyticketsProvider = context.watch<MyTicketsListProvider>();

    selectedMyticketsProvider.selectedmytickets();
    return SizedBox(
      child: Scaffold(
          backgroundColor: Colors.white,
          key: scaffoldKey,
          body: Column(children: [
            Selector<MyTicketsListProvider,
                ApiResponse<SelectedticketResponseModel>?>(
              selector: (_, apiResponse) =>
                  apiResponse.selectedticketResponseModel,
              builder: (_, instance, __) {
                if (instance?.status == Status.error) {
                  return FittedBox(
                      child: Text(instance?.errorMessage ?? "error"));
                } else if (instance?.status == Status.loading) {
                  return const Expanded(child: ProgressBarHUD());
                } else if (instance?.status == Status.completed) {
                  List<Datum?> selectedmyticketview =
                      instance?.data?.data ?? [];
                  print("now printing my tickts list data");
                  print(selectedmyticketview);
                  inspect(selectedmyticketview);

                  return selectedmyticketview.isEmpty
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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                const CustomText(
                                  text: " Ticket Details ",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  textcolor: Colours.kheadertext,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colours.kwhiteColor,
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 0,
                                        left: 0,
                                        top: 10,
                                        bottom: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colours.kcardbgColor,
                                              border: Border.all(
                                                color: Colours.kcardborder,
                                              )),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10, left: 10, top: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: ContentCard(
                                                      title: 'Company',
                                                      content:
                                                          selectedmyticketview[
                                                                  0]!
                                                              .companyId!
                                                              .companyName
                                                              .toString(),
                                                    )),
                                                    SizedBox(
                                                      height: 40,
                                                      width: 110,
                                                      child: isEdited
                                                          ? ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              const DashboardScreen()),
                                                                );
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colours
                                                                        .kbuttonpurple,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                              ),
                                                              child:
                                                                  const CustomText(
                                                                text: 'Update',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                textcolor: Colours
                                                                    .kwhiteColor,
                                                              ),
                                                            )
                                                          : OutlinedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  isEdited =
                                                                      true;
                                                                });
                                                              },
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                side:
                                                                    const BorderSide(
                                                                  color: Colours
                                                                      .kbuttonpurple,
                                                                ),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                              ),
                                                              child: const Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .border_color,
                                                                    color: Colours
                                                                        .kbuttonpurple,
                                                                    size: 15,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  CustomText(
                                                                    text:
                                                                        'Edit',
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    textcolor:
                                                                        Colours
                                                                            .kbuttonpurple,
                                                                  ),
                                                                ],
                                                              )),
                                                    ),
                                                  ],
                                                ),
                                                ContentCard(
                                                  title: 'Customer',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .customerId!
                                                          .customerName
                                                          .toString(),
                                                ),
                                                ContentCard(
                                                  title: 'Branch Name',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .branchObjectId!
                                                          .branchName
                                                          .toString(),
                                                ),
                                                ContentCard(
                                                    title: 'Created On',
                                                    content: formatDate(
                                                      selectedmyticketview[0]!
                                                          .createdAt!
                                                          .toString(),
                                                    )),
                                                ContentCard(
                                                    title: 'Requested By',
                                                    content: formatDate(
                                                      selectedmyticketview[0]!
                                                          .requestedBy
                                                          .toString(),
                                                    )),
                                                ContentCard(
                                                  title: 'Title',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .title!
                                                          .toString(),
                                                ),
                                                ContentCard(
                                                  title: 'Category',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .category!
                                                          .toString(),
                                                ),
                                                ContentCard(
                                                  title: 'Priority',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .severity!
                                                          .toString(),
                                                ),
                                                ContentCard(
                                                  title: 'Raised By',
                                                  content:
                                                      selectedmyticketview[0]!
                                                          .raisebyObjectId!
                                                          .name
                                                          .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),

                                        SharedPrefServices.getroleCode()
                                                        .toString() ==
                                                    'CUSTOMER ADMIN' ||
                                                SharedPrefServices.getroleCode()
                                                            .toString() ==
                                                        'CUSTOMER USER' &&
                                                    isEdited
                                            ? Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colours
                                                            .kcardbgColor,
                                                        border: Border.all(
                                                            color: Colours
                                                                .kcardborder)),
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10,
                                                              left: 10,
                                                              top: 10,
                                                              bottom: 10),
                                                      child: const Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          ContentCard(
                                                              title:
                                                                  'Assigned To',
                                                              content:
                                                                  'Uday Teja'),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                               const   SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                        // todo//

                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: isEdited == true
                                                  ? Colours.kwhiteColor
                                                  : Colours.kcardbgColor,
                                              border: Border.all(
                                                  color: Colours.kcardborder)),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 10,
                                                bottom: 10),
                                            child: isEdited
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                        const Row(
                                                          children: [
                                                            CustomText(
                                                                text:
                                                                    ' Status ',
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                textcolor: Colours
                                                                    .ksubheadertext),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Icon(
                                                              Icons.edit,
                                                              color: Colours
                                                                  .ksubheadertext,
                                                              size: 12,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        SizedBox(
                                                            height: 40,
                                                            width:
                                                                double.infinity,
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border
                                                                      .all(
                                                                    color: Colours
                                                                        .kbordergrey,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child:
                                                                    DropdownButtonHideUnderline(
                                                                        child: DropdownButton<
                                                                            String>(
                                                                  icon:
                                                                      const Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: Colours
                                                                        .kheadertext,
                                                                    size: 40,
                                                                  ),
                                                                  value: status,
                                                                  onChanged:
                                                                      (newvalue) {
                                                                    setState(
                                                                        () {
                                                                      status =
                                                                          newvalue!;
                                                                    });
                                                                  },
                                                                  items: items
                                                                      .map((String
                                                                          item) {
                                                                    return DropdownMenuItem<
                                                                            String>(
                                                                        value:
                                                                            item,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              8.0),
                                                                          child:
                                                                              Text(
                                                                            item,
                                                                            style: const TextStyle(
                                                                                color: Colours.kresponsivetext,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ));
                                                                  }).toList(),
                                                                )))),
                                                        const SizedBox(
                                                            height: 10),
                                                        SharedPrefServices.getroleCode()
                                                                        .toString() ==
                                                                    'COMPANY USER' ||
                                                                SharedPrefServices
                                                                            .getroleCode()
                                                                        .toString() ==
                                                                    'COMPANY ADMIN'
                                                            ?Container(
                                                                child: Column(
                                                                  children: [
                                                                    const Row(
                                                                      children: [
                                                                        CustomText(
                                                                            text:
                                                                                ' Assigned To ',
                                                                            fontSize:
                                                                                10,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            textcolor: Colours.ksubheadertext),
                                                                        SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              Colours.ksubheadertext,
                                                                          size:
                                                                              12,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    SizedBox(
                                                                        height:
                                                                            40,
                                                                        width: double
                                                                            .infinity,
                                                                        child: Container(
                                                                            decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              border: Border.all(
                                                                                color: Colours.kbordergrey,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child: DropdownButtonHideUnderline(
                                                                                child: DropdownButton<String>(
                                                                              icon: const Icon(
                                                                                Icons.arrow_drop_down,
                                                                                color: Colours.kheadertext,
                                                                                size: 40,
                                                                              ),
                                                                              value: assigned,
                                                                              onChanged: (newvalue) {
                                                                                setState(() {
                                                                                  assigned = newvalue!;
                                                                                });
                                                                              },
                                                                              items: name.map((String item) {
                                                                                return DropdownMenuItem<String>(
                                                                                    value: item,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        item,
                                                                                        style: const TextStyle(color: Colours.kresponsivetext, fontSize: 14, fontWeight: FontWeight.w400),
                                                                                      ),
                                                                                    ));
                                                                              }).toList(),
                                                                            )))),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(),
                                                        const SizedBox(
                                                            height: 5),
                                                      ])
                                                : Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ContentCard(
                                                        title: 'Status',
                                                        content:
                                                            selectedmyticketview[
                                                                    0]!
                                                                .status!
                                                                .toString(),
                                                      ),
                                                      ContentCard(
                                                          title: 'Assigned To',
                                                          content:
                                                              selectedmyticketview[
                                                                      0]!
                                                                  .assignedtoObjectId
                                                                  .toString()),
                                                    ],
                                                  ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colours.kcardbgColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colours.kcardborder)),
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10,
                                                left: 10,
                                                top: 10,
                                                bottom: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ContentCard(
                                                  title: 'Date Closed',
                                                  content:
                                                     formatDate( selectedmyticketview[0]!
                                                          .endDate
                                                          .toString(),),
                                                ),
                                                const CustomText(
                                                    text: 'Message',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    textcolor:
                                                        Colours.ksubheadertext),
                                             const   SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  child: CustomText(
                                                    text:
                                                        selectedmyticketview[0]!
                                                            .description
                                                            .toString(),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    textcolor:
                                                        Colours.kresponsivetext,
                                                  ),
                                                ),
                                               const SizedBox(height: 10),
                                               const CustomText(
                                                    text: 'Attachments',
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w400,
                                                    textcolor:
                                                        Colours.ksubheadertext),
                                               const SizedBox(
                                                  height: 5,
                                                ),
                                                // CustomText(
                                                //   text: selectedmyticketview[0]!
                                                //       .images![0]
                                                //       .fileName
                                                //       .toString(),
                                                //   fontSize: 13,
                                                //   fontWeight: FontWeight.w500,
                                                //   textcolor:
                                                //       Colours.kresponsivetext,
                                                // ),
                                               const SizedBox(
                                                  height: 10,
                                                ),
                                                CustomText(
                                                  text: selectedmyticketview[0]!
                                                      .images![0]
                                                      .fileName
                                                      .toString(),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500,
                                                  textcolor:
                                                      Colours.kresponsivetext,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),

                          // CustomText(
                          //   text: selectedmyticketview[0]!.ticketId!.toString(),
                          //   fontSize: 16,
                          //   fontWeight: FontWeight.w500,
                          //   textcolor: Colours.kheadertext,
                          // ),
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

class ContentCard extends StatelessWidget {
  final String title;
  final String content;

  const ContentCard({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomText(
              text: title,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              textcolor: Colours.ksubheadertext),
        ),
        SizedBox(
          width: double.infinity,
          child: CustomText(
              text: content,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              textcolor: Colours.kresponsivetext),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

// class AttachmentsGrid extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // return DottedBorder(
//     //   child: GridView.count(
//     //     crossAxisCount: 5,
//     //     shrinkWrap: true,
//     //     physics: const NeverScrollableScrollPhysics(),
//     //     children: List.generate(10, (index) {
//     //       return Padding(
//     //         padding: const EdgeInsets.all(8.0),
//     //         child: Image.asset(
//     //           'assets/img.jpeg',
//     //           fit: BoxFit.cover,
//     //         ),
//     //       );
//     //     }),
//     //   ),
//     );
//   }
// }
