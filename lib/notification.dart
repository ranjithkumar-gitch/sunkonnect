import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class NotificationListScreen extends StatelessWidget {
  const NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppbar(title: 'Notifications'),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: ListView.builder(
          itemCount: 10, 
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Card(
                elevation: 1,
                color: Colours.kcardbgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                 
                  title:const  Row(
                    children: [
                       CircleAvatar(
                        radius: 12,
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white, size: 16,
                    ),
                  ),
                  SizedBox(width: 10,),
                     CustomText(text: 'Ticket No: 410', fontSize: 15, fontWeight: FontWeight.bold, textcolor: Colors.black),
                    ],
                  ),
                  
                  subtitle:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    const  SizedBox(height: 4.0),
                      Text(
                        'Sandy Johnson has changed status of #TICK-409 Test panelboard - 2nd revision required from Completed to Closed.',
                          style: GoogleFonts.poppins(fontSize: 13, color: Colours.kheadertext,fontWeight:FontWeight.w400) ,maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                         
                        ),
                      
                      const SizedBox(height: 4.0),
                     Align(
                    alignment: Alignment.centerRight,
                    child:   Text('5 Hr ago',style: GoogleFonts.poppins(fontSize: 10,color: Colours.ksubheadertext),),
                    
                  ),
                    ],
                  ),
                  onTap: () {
                    // Add action to handle notification tap
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
