import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/tickets/ticketdetailsscreen.dart';
import 'package:sunkonnect/tickets/messagelogscreen.dart';
import 'package:sunkonnect/tickets/ticketlogscreen.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
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
                    Icons.arrow_back_ios,
                    color: Colours.korange,
                  ))),
              
          title: const CustomText(
              text: "TICK-431",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              textcolor: Colours.korange),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.only(right: 10, left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colours.korange,
                        labelStyle: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          color: Colours.korange,
                          fontFamily: 'poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                        controller: tabController,
                        indicatorColor: Colours.korange,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 2,
                        dividerColor: Colors.grey.shade300,
                        tabs: const [
                          Tab(
                            text: 'Details',
                          ),
                          Tab(
                            text: 'Messages',
                          ),
                          Tab(
                            text: 'Logs',
                          )
                        ]),
                    Expanded(
                        child: TabBarView(controller: tabController, children: [
                      TicketDetailsScreen(),
                      const MessageLogScreen(),
                      const TicketLogScreen()
                    ]))
                  ])),
        ));
  }
}
