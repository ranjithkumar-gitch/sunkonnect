import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';


class EditTicketScreen extends StatefulWidget {
  

  @override
  _EditTicketScreenState createState() => _EditTicketScreenState();
}

class _EditTicketScreenState extends State<EditTicketScreen> {
  late TextEditingController _messageController;


   String value = 'Select Status';
  var items = ['Select Status','All','New','Acknowledge','Assigned','In process','Completed','Closed','Cancelled', 'On Hold'];  

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: const CustomAppbar(title: 'Update Status'),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
        child: SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colours.kbuttonpurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const CustomText(text: 'UPDATE', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colours.kwhiteColor)
                
                )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
          margin: const EdgeInsets.only(right: 10,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15,),

          const  CustomText(text:'Status', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colours.ksubheadertext),
        
           const SizedBox(height: 15,),
           SizedBox(
                height: 40, width: double.infinity,   
                child: Container( 
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colours.kbordergrey,
                width: 1.0,),),
              child: DropdownButtonHideUnderline(
             child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down,color: Colours.kheadertext,size: 40,),
               value: value,   
              onChanged: (newvalue) {
                setState(() {
                 value = newvalue!; });},
                   items: items.map((String item) {
                     return DropdownMenuItem<String>(
                     value: item,
                   child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Text(item,style: const TextStyle( color:Colours.kresponsivetext,fontSize: 14,fontWeight: FontWeight.w400),),));}).toList(),)))),

                  const SizedBox(height: 15,),

          

                    const SizedBox(height: 20,),

              //      SizedBox(width: double.infinity,height: 45,
              //     child: ElevatedButton(
              //   style: ElevatedButton.styleFrom(backgroundColor: Colours.korange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              //  onPressed: () {

              //   },
              //  child: const  CustomText(text:'UPDATE', fontSize: 16, fontWeight: FontWeight.w600, textcolor: Colors.white),
              //   ),),


          

          
          ],
        ),
      ),
    );
  }
}


// At the momment dissappear the message box as per sai requried .
          // const  CustomText(text:'Message', fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colours.korange),
        
          //  const SizedBox(height: 10,),
          //       SizedBox(
          //           height: 150,
          //            child: TextFormField(
          //             controller: _messageController,
          //              minLines: 6,
          //              maxLines: null,
          //              keyboardType: TextInputType.multiline,
          //              cursorColor: Colors.black,
          //              decoration: InputDecoration(
          //                  alignLabelWithHint: true,
          //                 border: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(10),
          //                  borderSide: const BorderSide(color: Colors.grey)),
          //              enabledBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(10),
          //                  borderSide: const BorderSide(color: Colors.grey)),
          //              focusedBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(10),
          //                  borderSide: const BorderSide(color: Colors.grey)),
          //              errorBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(10),
          //                  borderSide: const BorderSide(color: Colors.grey)),
          //                  hintText: 'Describe here....',
          //                  hintStyle:  TextStyle(
          //                    fontSize: 14,
          //                    fontWeight: FontWeight.w400,
          //                    color: Colors.grey.shade600
          //                  )),
          //            ),
          //          ),
