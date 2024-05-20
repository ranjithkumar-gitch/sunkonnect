import 'package:flutter/material.dart';
import 'package:sunkonnect/notification.dart';
import 'package:sunkonnect/sidemenu/sidemenu.dart';
import 'package:sunkonnect/tickets/ticketdata.dart';
import 'package:sunkonnect/tickets/ticketstabview.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:expandable/expandable.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  String _selectedStatus = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFA500),
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
              // Add notification functionality here
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NotificationListScreen()),
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
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colours.kheadertext,
                            fontFamily: 'poppins',
                          ),
                        ),
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
        backgroundColor: Color(0xff464667),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        // selectedLabelStyle: TextStyle(color: Colors.white),
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
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (context, index) {
        return ExpandableNotifier(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 0,
            color: Colours.ktextfeildbgColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side:  const BorderSide(color: Colours.kcardborder,width: 0.7)),
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
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                        iconColor: Colours.kbuttonpurple,
                      ),
                      header: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                            CustomText(text: tickets[index].id, fontSize: 14, fontWeight: FontWeight.bold, textcolor: Colours.kheadertext,),
                                
                                Row(
                                  children: [
                                    Container(
                                      // width: 135.0,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: tickets[index].status == "New"
                                              ? const Color(0xff22B6D0)
                                              : tickets[index].status ==
                                                      "Assigned"
                                                  ? const Color(0xff52C41A)
                                                  : tickets[index].status ==
                                                          "Acknowledged"
                                                      ? const Color(0xff662C91)
                                                      : tickets[index].status ==
                                                              "In process"
                                                          ? const Color(0xffFFA500)
                                                          : tickets[index]
                                                                      .status ==
                                                                  "Completed"
                                                              ? const Color(
                                                                  0xff0DA12E)
                                                              : tickets[index]
                                                                          .status ==
                                                                      "On Hold"
                                                                  ? const Color(
                                                                      0xff007CBE)
                                                                  : tickets[index]
                                                                              .status ==
                                                                          "Closed"
                                                                      ? const Color(
                                                                          0xff15182E)
                                                                      : tickets[index].status ==
                                                                              "Cancelled"
                                                                          ? const Color(
                                                                              0xffD92F1B)
                                                                          : Colors
                                                                              .black,
                                        ),
                                        color: tickets[index].status == "New"
                                            ? const Color(0xffF0FDFF)
                                            : tickets[index].status ==
                                                    "Assigned"
                                                ? const Color(0xffEDFFE4)
                                                : tickets[index].status ==
                                                        "Acknowledged"
                                                    ? const Color(0xffF8EFFF)
                                                    : tickets[index].status ==
                                                            "In process"
                                                        ? const Color(0xffFFF4DF)
                                                        : tickets[index]
                                                                    .status ==
                                                                "Completed"
                                                            ? const Color(0xffE6FFEC)
                                                            : tickets[index]
                                                                        .status ==
                                                                    "On Hold"
                                                                ? const Color(
                                                                    0xffF3FBFF)
                                                                : tickets[index]
                                                                            .status ==
                                                                        "Closed"
                                                                    ? const Color(
                                                                        0xffF5F5F5)
                                                                    : tickets[index].status ==
                                                                            "Cancelled"
                                                                        ? const Color(
                                                                            0xffFFF2F0)
                                                                        : Colors
                                                                            .white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            top: 5.0,
                                            bottom: 5.0),
                                        child: Text(
                                         tickets[index].status,
                                         style: TextStyle(
                                           fontSize: 12.0,
                                           color: tickets[index].status ==
                                                   "New"
                                               ? const Color(0xff22B6D0)
                                               : tickets[index].status ==
                                                       "Assigned"
                                                   ? const Color(0xff52C41A)
                                                   : tickets[index].status ==
                                                           "Acknowledged"
                                                       ? const Color(0xff662C91)
                                                       : tickets[index]
                                                                   .status ==
                                                               "In process"
                                                           ? const Color(
                                                               0xffFFA500)
                                                           : tickets[index]
                                                                       .status ==
                                                                   "Completed"
                                                               ? const Color(
                                                                   0xff0DA12E)
                                                               : tickets[index]
                                                                           .status ==
                                                                       "On Hold"
                                                                   ? const Color(
                                                                       0xff007CBE)
                                                                   : tickets[index].status ==
                                                                           "Closed"
                                                                       ? const Color(
                                                                           0xff15182E)
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
                                    SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: Image(
                                            image: AssetImage(tickets[index]
                                                        .priority ==
                                                    "High"
                                                ? "assets/highpriority.png"
                                                : tickets[index].priority ==
                                                        "Medium"
                                                    ? 'assets/medpriority.png'
                                                    : 'assets/lowpriority.png'))),
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
                                  tickets[index].assignedTo.toUpperCase(),
                                  style: const
                                   TextStyle(
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
                                const Text(
                                  "Raised By   :  ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colours.ksubheadertext,
                                    fontFamily: 'poppins',
                                  ),
                                ),
                                Text(
                                  tickets[index].raisedBy,
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
                            Text(
                              tickets[index].title,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colours.kheadertext,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      collapsed: const Text(
                        "More details",
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colours.kheadertext,
                          fontFamily: 'poppins',
                        ),
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
                              const Text(
                                "Assigned To   :   ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colours.ksubheadertext,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].assignedTo,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
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
                              const Text(
                                "Days Open   :   ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colours.ksubheadertext,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].daysOpen,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
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
                              const Text(
                                "Created   :   ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colours.ksubheadertext,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].dateTime,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
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
                              const Text(
                                "Closed   :   ",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colours.ksubheadertext,
                                  fontFamily: 'poppins',
                                ),
                              ),
                              Text(
                                tickets[index].dateTime,
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
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
                          const Row(
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colours.kheadertext,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            tickets[index].category,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colours.kheadertext,
                              fontFamily: 'poppins',
                            ),
                          ),
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
                            theme:
                                const ExpandableThemeData(crossFadePoint: 0.7),
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
      },
    );
  }
}
