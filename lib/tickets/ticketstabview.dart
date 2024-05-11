import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/ticketdetailsscreen.dart';
import 'package:sunkonnect/tickets/messagelogscreen.dart';
import 'package:sunkonnect/tickets/ticketdetails.dart';
import 'package:sunkonnect/tickets/ticketlogscreen.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';
import 'package:hexcolor/hexcolor.dart';

class TicketTabView extends StatefulWidget {
  const TicketTabView({super.key});

  @override
  State<TicketTabView> createState() => _TicketTabViewState();
}

class _TicketTabViewState extends State<TicketTabView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))),
          title: const CustomText(
              text: "TICK-431",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              textcolor: Colors.black),
          centerTitle: false,
        ),
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.black,
                        labelStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        )),
                        controller: tabController,
                        indicatorColor: HexColor("#FFA500"),
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2,
                        dividerColor: Colors.grey.shade300,
                        tabs: const [
                          Tab(
                            text: 'Ticket Details',
                          ),
                          Tab(
                            text: 'Message Log',
                          ),
                          Tab(
                            text: 'Ticket Log',
                          )
                        ]),
                    Expanded(
                        child: TabBarView(controller: tabController, children: [
                      TicketDetailsScreen(),
                      MessageLogScreen(),
                      TicketLogScreen()
                    ]))
                  ])),
        ));
  }
}
