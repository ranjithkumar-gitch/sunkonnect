import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunkonnect/load_data/api_response.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/get_ticketslist_request_model.dart';
import 'package:sunkonnect/providers/my_tickets_list_provider.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/tickets/ticketstabview.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progress_bar.dart';
import 'package:flutter/src/widgets/image.dart' as _image;

class MyTicketsList extends StatefulWidget {
  const MyTicketsList({super.key});

  @override
  State<MyTicketsList> createState() => _MyTicketsListState();
}

class _MyTicketsListState extends State<MyTicketsList> {
  String _selectedStatus = 'All';
  late GetTicketListRequestModel requestModelId;

  bool isApiCallProcess = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    requestModelId = GetTicketListRequestModel(
      userId: SharedPrefServices.getuserId().toString(),
      roleCode: SharedPrefServices.getroleCode().toString(),
      selectedDropdownValue: "",
      searchKey: "",
      pageSize: "10",
      pageNo: "1",
      ticketId: "",
      status: "",
      severity: "",
      startDate: "",
      category: "",
      daysOpen: "",
      limit: "20",
      page: "1",
    );
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);

    DateFormat formatter = DateFormat('MM-dd-yyyy, HH:mm:ss');

    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    var myTicketsListProvider = context.watch<MyTicketsListProvider>();

    myTicketsListProvider.loadMyTicketsList(
        requestmodel: requestModelId.toJson());

    return SizedBox(
      child: Scaffold(
          key: scaffoldKey,
          body: Column(children: [
            _searchFilters(),
            Selector<MyTicketsListProvider,
                ApiResponse<GetTicketListResponseModel>?>(
              selector: (_, apiResponse) =>
                  apiResponse.getTicketListResponseModel,
              builder: (_, instance, __) {
                if (instance?.status == Status.error) {
                  return FittedBox(
                      child: Text(instance?.errorMessage ?? "error"));
                } else if (instance?.status == Status.loading) {
                  return const Expanded(child: ProgressBarHUD());
                } else if (instance?.status == Status.completed) {
                  List<Datum?> myTicketsListData =
                      instance?.data?.data?.data ?? [];
                  print("now printing my tickts list data");
                  print(myTicketsListData);
                  inspect(myTicketsListData);

                  return myTicketsListData.isEmpty
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
                              itemCount: myTicketsListData.length,
                              itemBuilder: (context, index) {
                                return ExpandableNotifier(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Card(
                                    elevation: 0,
                                    color: Colours.ktextfeildbgColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colours.kcardborder,
                                            width: 0.7)),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      color: Colours.ktextfeildbgColor,
                                      child: Column(
                                        children: <Widget>[
                                          ScrollOnExpand(
                                            scrollOnExpand: true,
                                            scrollOnCollapse: false,
                                            child: ExpandablePanel(
                                              theme: const ExpandableThemeData(
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                tapBodyToCollapse: true,
                                                iconColor:
                                                    Colours.kbuttonpurple,
                                              ),
                                              header: Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 0, 10),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        CustomText(
                                                          text:
                                                              myTicketsListData[
                                                                      index]!
                                                                  .ticketId!
                                                                  .toString()
                                                                  .toString(),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textcolor:
                                                              Colours.korange,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: myTicketsListData[index]!
                                                                              .status ==
                                                                          "New"
                                                                      ? const Color(
                                                                          0xff22B6D0)
                                                                      : myTicketsListData[index]!.status ==
                                                                              "Assigned"
                                                                          ? const Color(
                                                                              0xff52C41A)
                                                                          : myTicketsListData[index]!.status == "Acknowledged"
                                                                              ? const Color(0xff662C91)
                                                                              : myTicketsListData[index]!.status == "In process"
                                                                                  ? const Color(0xffFFA500)
                                                                                  : myTicketsListData[index]!.status == "Completed"
                                                                                      ? const Color(0xff0DA12E)
                                                                                      : myTicketsListData[index]!.status == "On Hold"
                                                                                          ? const Color(0xff007CBE)
                                                                                          : myTicketsListData[index]!.status == "Closed"
                                                                                              ? const Color(0xff15182E)
                                                                                              : myTicketsListData[index]!.status == "Cancelled"
                                                                                                  ? const Color(0xffD92F1B)
                                                                                                  : Colors.black,
                                                                ),
                                                                color: myTicketsListData[index]!
                                                                            .status ==
                                                                        "New"
                                                                    ? const Color(
                                                                        0xffF0FDFF)
                                                                    : myTicketsListData[index]!.status ==
                                                                            "Assigned"
                                                                        ? const Color(
                                                                            0xffEDFFE4)
                                                                        : myTicketsListData[index]!.status ==
                                                                                "Acknowledged"
                                                                            ? const Color(0xffF8EFFF)
                                                                            : myTicketsListData[index]!.status == "In process"
                                                                                ? const Color(0xffFFF4DF)
                                                                                : myTicketsListData[index]!.status == "Completed"
                                                                                    ? const Color(0xffE6FFEC)
                                                                                    : myTicketsListData[index]!.status == "On Hold"
                                                                                        ? const Color(0xffF3FBFF)
                                                                                        : myTicketsListData[index]!.status == "Closed"
                                                                                            ? const Color(0xffF5F5F5)
                                                                                            : myTicketsListData[index]!.status == "Cancelled"
                                                                                                ? const Color(0xffFFF2F0)
                                                                                                : Colors.white,
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                  Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    left: 8.0,
                                                                    right: 8.0,
                                                                    top: 5.0,
                                                                    bottom:
                                                                        5.0),
                                                                child: Text(
                                                                  myTicketsListData[
                                                                          index]!
                                                                      .status
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.0,
                                                                    color: myTicketsListData[index]!.status ==
                                                                            "New"
                                                                        ? const Color(
                                                                            0xff22B6D0)
                                                                        : myTicketsListData[index]!.status ==
                                                                                "Assigned"
                                                                            ? const Color(0xff52C41A)
                                                                            : myTicketsListData[index]!.status == "Acknowledged"
                                                                                ? const Color(0xff662C91)
                                                                                : myTicketsListData[index]!.status == "In process"
                                                                                    ? const Color(0xffFFA500)
                                                                                    : myTicketsListData[index]!.status == "Completed"
                                                                                        ? const Color(0xff0DA12E)
                                                                                        : myTicketsListData[index]!.status == "On Hold"
                                                                                            ? const Color(0xff007CBE)
                                                                                            : myTicketsListData[index]!.status == "Closed"
                                                                                                ? const Color(0xff15182E)
                                                                                                : myTicketsListData[index]!.status == "Cancelled"
                                                                                                    ? const Color(0xffD92F1B)
                                                                                                    : Colors.black,
                                                                    fontFamily:
                                                                        'Poppins',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 10,
                                                            ),
                                                            SizedBox(
                                                                height: 24,
                                                                width: 24,
                                                                child: _image.Image(
                                                                    image: AssetImage(myTicketsListData[index]!.severity.toString() == "High"
                                                                        ? "assets/highpriority.png"
                                                                        : myTicketsListData[index]!.severity.toString() == "Medium"
                                                                            ? 'assets/medpriority.png'
                                                                            : 'assets/lowpriority.png'))),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: RichText(
                                                        text: TextSpan(
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 32),
                                                            children: [
                                                              const TextSpan(
                                                                text:
                                                                    "Customer Name  :  ",
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colours
                                                                      .ksubheadertext,
                                                                  fontFamily:
                                                                      'poppins',
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: myTicketsListData[
                                                                        index]!
                                                                    .customerId!
                                                                    .customerName
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize:
                                                                      14.0,
                                                                  color: Colours
                                                                      .kheadertext,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      'poppins',
                                                                ),
                                                              )
                                                            ]),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    RichText(
                                                      text: TextSpan(
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 32),
                                                          children: [
                                                            const TextSpan(
                                                              text:
                                                                  "Raised By  :  ",
                                                              style: TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colours
                                                                    .ksubheadertext,
                                                                fontFamily:
                                                                    'poppins',
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: myTicketsListData[
                                                                      index]!
                                                                  .raisebyObjectId!
                                                                  .name
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 14.0,
                                                                color: Colours
                                                                    .kheadertext,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'poppins',
                                                              ),
                                                            )
                                                          ]),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    Text(
                                                        myTicketsListData[
                                                                index]!
                                                            .title
                                                            .toString(),
                                                        style: GoogleFonts.poppins(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colours
                                                                .kheadertext)),
                                                  ],
                                                ),
                                              ),
                                              collapsed: Text(
                                                "More details",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 10,
                                                    color: Colours.kheadertext),
                                                softWrap: true,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              expanded: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                  RichText(
                                                    text: const TextSpan(
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 32),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "Assigned To   :   ",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colours
                                                                  .ksubheadertext,
                                                              fontFamily:
                                                                  'poppins',
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '',

                                                            // myTicketsListData[
                                                            //     index]!
                                                            // .assignedtoObjectId!
                                                            // .name
                                                            // .toString(),

                                                            style:
                                                                const TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colours
                                                                  .kheadertext,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'poppins',
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 6.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Days Open   :   ",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  color: Colours
                                                                      .ksubheadertext)),
                                                      Text(
                                                          myTicketsListData[
                                                                  index]!
                                                              .daysOpen
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black)),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 6.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 32),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "Created   :   ",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colours
                                                                  .ksubheadertext,
                                                              fontFamily:
                                                                  'poppins',
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text: formatDate(
                                                                  myTicketsListData[
                                                                          index]!
                                                                      .createdAt
                                                                      .toString()),
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black))
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 6.0,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 32),
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                "Closed   :    ",
                                                            style: TextStyle(
                                                              fontSize: 14.0,
                                                              color: Colours
                                                                  .ksubheadertext,
                                                              fontFamily:
                                                                  'poppins',
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text:
                                                                  "need to fix",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black)),
                                                        ]),
                                                  ),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                  const Divider(
                                                    height: 2.0,
                                                    color: Colors.white,
                                                  ),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("Category",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 14,
                                                            color: Colours
                                                                .kheadertext,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                  Text(
                                                      myTicketsListData[index]!
                                                          .category!
                                                          .toString(),
                                                      style: GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: Colours
                                                              .kheadertext)),
                                                  const SizedBox(
                                                    height: 6.0,
                                                  ),
                                                  CustomButton(
                                                      text: "View Details",
                                                      textColor: Colors.white,
                                                      onPressed: () {
                                                        setState(() {
                                                          myTicketsListProvider
                                                              .clearSelectedTicketDetails();
                                                          myTicketsListProvider
                                                              .clearmessagelogDetails();

                                                          SharedPrefServices
                                                              .setTicketId(
                                                                  myTicketsListData[
                                                                          index]!
                                                                      .ticketId!
                                                                      .toString());
                                                          SharedPrefServices
                                                              .setTicketobjId(
                                                                  myTicketsListData[
                                                                          index]!
                                                                      .id!
                                                                      .toString());
                                                        });
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  TicketTabView()),
                                                        );
                                                      },
                                                      color:
                                                          Colours.kbuttonpurple,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  const SizedBox(
                                                    height: 4.0,
                                                  ),
                                                ],
                                              ),
                                              builder:
                                                  (_, collapsed, expanded) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 10),
                                                  child: Expandable(
                                                    collapsed: collapsed,
                                                    expanded: expanded,
                                                    theme:
                                                        const ExpandableThemeData(
                                                            crossFadePoint:
                                                                0.7),
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

  _searchFilters() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
                height: 40,
                child: TextFormField(
                    decoration: InputDecoration(
                  hintText: "Search by Ticket Id..",
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
                      color: Colours.kbuttonpurple,
                      width: 1.0,
                    ),
                  ),
                ))),
          ),
          const SizedBox(
            width: 8,
          ),
          DropdownButton<String>(
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
              'Acknowledged',
              'In process',
              'Completed',
              "Cancelled",
              "On Hold",
              "Closed"
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(value,
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colours.kheadertext)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
