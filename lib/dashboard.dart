import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/loginflow/model/get_ticketlist_response_model.dart';
import 'package:sunkonnect/loginflow/model/get_ticketslist_request_model.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/sidemenu/sidemenu.dart';
import 'package:sunkonnect/tickets/ticketdata.dart';
import 'package:sunkonnect/tickets/ticketstabview.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:expandable/expandable.dart';
import 'package:sunkonnect/widgets/progressbar.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  String _selectedStatus = 'All';

  late GetTicketListRequestModel requestModelId;

  bool isApiCallProcess = false;

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
    // getTicketsList();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: uiSetup(context),
    );
  }

  Widget uiSetup(BuildContext context) {
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
          ),
          Expanded(
              child: _buildTicketList(
                  _currentIndex == 0 ? myTickets : allTickets)),
        ],
      ),
      drawer: const SideMenu(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colours.kbuttonpurple,
        currentIndex: _currentIndex,
        selectedItemColor: Colours.kwhiteColor,
        unselectedItemColor: Colors.grey.shade400,
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
    return Container(
      child: FutureBuilder<GetTicketListResponseModel>(
        future: getTicketsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                "No data found",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data!.data!.length,
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
                              color: Colours.kcardborder, width: 0.7)),
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
                                      ExpandablePanelHeaderAlignment.center,
                                  tapBodyToCollapse: true,
                                  iconColor: Colours.kbuttonpurple,
                                ),
                                header: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: snapshot.data!.data!
                                                .data![index].ticketId
                                                .toString(),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            textcolor: Colours.kheadertext,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: tickets[index]
                                                                .status ==
                                                            "New"
                                                        ? const Color(
                                                            0xff22B6D0)
                                                        : tickets[index]
                                                                    .status ==
                                                                "Assigned"
                                                            ? const Color(
                                                                0xff52C41A)
                                                            : tickets[index]
                                                                        .status ==
                                                                    "Acknowledged"
                                                                ? const Color(
                                                                    0xff662C91)
                                                                : tickets[index]
                                                                            .status ==
                                                                        "In process"
                                                                    ? const Color(
                                                                        0xffFFA500)
                                                                    : tickets[index].status ==
                                                                            "Completed"
                                                                        ? const Color(
                                                                            0xff0DA12E)
                                                                        : tickets[index].status ==
                                                                                "On Hold"
                                                                            ? const Color(0xff007CBE)
                                                                            : tickets[index].status == "Closed"
                                                                                ? const Color(0xff15182E)
                                                                                : tickets[index].status == "Cancelled"
                                                                                    ? const Color(0xffD92F1B)
                                                                                    : Colors.black,
                                                  ),
                                                  color: tickets[index]
                                                              .status ==
                                                          "New"
                                                      ? const Color(0xffF0FDFF)
                                                      : tickets[index].status ==
                                                              "Assigned"
                                                          ? const Color(
                                                              0xffEDFFE4)
                                                          : tickets[index]
                                                                      .status ==
                                                                  "Acknowledged"
                                                              ? const Color(
                                                                  0xffF8EFFF)
                                                              : tickets[index]
                                                                          .status ==
                                                                      "In process"
                                                                  ? const Color(
                                                                      0xffFFF4DF)
                                                                  : tickets[index]
                                                                              .status ==
                                                                          "Completed"
                                                                      ? const Color(
                                                                          0xffE6FFEC)
                                                                      : tickets[index].status ==
                                                                              "On Hold"
                                                                          ? const Color(
                                                                              0xffF3FBFF)
                                                                          : tickets[index].status == "Closed"
                                                                              ? const Color(0xffF5F5F5)
                                                                              : tickets[index].status == "Cancelled"
                                                                                  ? const Color(0xffFFF2F0)
                                                                                  : Colors.white,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(8.0),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0,
                                                          right: 8.0,
                                                          top: 5.0,
                                                          bottom: 5.0),
                                                  child: Text(
                                                    tickets[index].status,
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: tickets[index]
                                                                  .status ==
                                                              "New"
                                                          ? const Color(
                                                              0xff22B6D0)
                                                          : tickets[index]
                                                                      .status ==
                                                                  "Assigned"
                                                              ? const Color(
                                                                  0xff52C41A)
                                                              : tickets[index]
                                                                          .status ==
                                                                      "Acknowledged"
                                                                  ? const Color(
                                                                      0xff662C91)
                                                                  : tickets[index]
                                                                              .status ==
                                                                          "In process"
                                                                      ? const Color(
                                                                          0xffFFA500)
                                                                      : tickets[index].status ==
                                                                              "Completed"
                                                                          ? const Color(
                                                                              0xff0DA12E)
                                                                          : tickets[index].status == "On Hold"
                                                                              ? const Color(0xff007CBE)
                                                                              : tickets[index].status == "Closed"
                                                                                  ? const Color(0xff15182E)
                                                                                  : tickets[index].status == "Cancelled"
                                                                                      ? const Color(0xffD92F1B)
                                                                                      : Colors.black,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              // SizedBox(
                                              //     height: 24,
                                              //     width: 24,
                                              //     child: Image(
                                              //         image: AssetImage(tickets[
                                              //                         index]
                                              //                     .priority ==
                                              //                 "High"
                                              //             ? "assets/highpriority.png"
                                              //             : tickets[index]
                                              //                         .priority ==
                                              //                     "Medium"
                                              //                 ? 'assets/medpriority.png'
                                              //                 : 'assets/lowpriority.png'))),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Customer Name  :  ",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colours.ksubheadertext,
                                              fontFamily: 'poppins',
                                            ),
                                          ),
                                          Text(
                                            tickets[index]
                                                .assignedTo
                                                .toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colours.kheadertext,
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
                                          Text("Raised By   :  ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  color:
                                                      Colours.ksubheadertext)),
                                          Text(tickets[index].raisedBy,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colours.kheadertext)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(tickets[index].title,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colours.kheadertext)),
                                    ],
                                  ),
                                ),
                                collapsed: Text(
                                  "More details",
                                  style: GoogleFonts.poppins(
                                      fontSize: 10, color: Colours.kheadertext),
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
                                        Text("Assigned To   :   ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colours.ksubheadertext)),
                                        Text(tickets[index].assignedTo,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        Text("Days Open   :   ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colours.ksubheadertext)),
                                        Text(tickets[index].daysOpen,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        Text("Created   :   ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colours.ksubheadertext)),
                                        Text(tickets[index].dateTime,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 6.0,
                                    ),
                                    Row(
                                      children: [
                                        Text("Closed   :   ",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                color: Colours.ksubheadertext)),
                                        Text(tickets[index].dateTime,
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ],
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
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colours.kheadertext,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(tickets[index].category,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color: Colours.kheadertext)),
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
                                        color: Colours.kbuttonpurple,
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
                                      theme: const ExpandableThemeData(
                                          crossFadePoint: 0.7),
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
                });
          } else
            return Container();
        },
      ),
    );
  }

  getTicketsList() {
    ApiService apiService = ApiService();

    print(requestModelId);
    inspect(requestModelId);

    apiService.getTicketList(requestModelId).then((value) {
      if (value.status == 203) {
        setState(() {
          isApiCallProcess = false;
        });
      } else if (value.status == 401) {
        setState(() {
          isApiCallProcess = false;
        });
      } else if (value.status == 400) {
        setState(() {
          isApiCallProcess = false;
        });
      } else if (value.status == 404) {
        setState(() {
          isApiCallProcess = false;
        });
      } else if (value.status == 200 || value.status == 201) {
        showToast("Tickets Show Successfully");

        setState(() {
          print(value.data?.currentPage ?? "");
          isApiCallProcess = false;
        });

        //              Navigator.push(context,
        // MaterialPageRoute(builder: (context) =>  OTPScreen(VerificationCode: value.data!.token.toString(),)));
      } else {
        setState(() {
          isApiCallProcess = false;
        });
      }
    });
  }
}
