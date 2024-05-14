import 'package:flutter/material.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';


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
      appBar: AppBar(
         backgroundColor: Colors.white,
        centerTitle: true,
        title: const  CustomText(text: 'Update Status', fontSize: 22, fontWeight: FontWeight.w500, textcolor: Colours.korange),
       leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios,color: Colours.korange,)),
      ),
      
      body: Container(
          margin: const EdgeInsets.only(right: 10,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),

          const  CustomText(text:'Status', fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colours.korange),
        
           const SizedBox(height: 15,),
           SizedBox(
                height: 40, width: double.infinity,   
                child: Container( 
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey,
                width: 1.0,),),
              child: DropdownButtonHideUnderline(
             child: DropdownButton<String>(
              icon: const Icon(Icons.arrow_drop_down,color: Colours.korange,size: 40,),
               value: value,   
              onChanged: (newvalue) {
                setState(() {
                 value = newvalue!; });},
                   items: items.map((String item) {
                     return DropdownMenuItem<String>(
                     value: item,
                   child: Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Text(item,style: const TextStyle( color:Colors.black,fontSize: 14,fontWeight: FontWeight.w400),),));}).toList(),)))),

                  const SizedBox(height: 15,),

          const  CustomText(text:'Message', fontSize: 16, fontWeight: FontWeight.w500, textcolor: Colours.korange),
        
           const SizedBox(height: 10,),


                SizedBox(
                    height: 150,
                     child: TextFormField(
                      controller: _messageController,
                       minLines: 6,
                       maxLines: null,
                       keyboardType: TextInputType.multiline,
                       cursorColor: Colors.black,
                       decoration: InputDecoration(
                           alignLabelWithHint: true,
                          border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: const BorderSide(color: Colors.grey)),
                       enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: const BorderSide(color: Colors.grey)),
                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: const BorderSide(color: Colors.grey)),
                       errorBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: const BorderSide(color: Colors.grey)),
                           hintText: 'Describe here....',
                           hintStyle:  TextStyle(
                             fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color: Colors.grey.shade600
                           )),
                     ),
                   ),

                    const SizedBox(height: 20,),

                   SizedBox(width: double.infinity,height: 45,
                  child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colours.korange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
               onPressed: () {

                },
               child: const  CustomText(text:'UPDATE', fontSize: 16, fontWeight: FontWeight.w600, textcolor: Colors.white),
                ),),

            // Card(
            //   child: Padding(
            //     padding: const EdgeInsets.all(16.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TextFormField(
            //           controller: _messageController,
            //           decoration: InputDecoration(labelText: 'Message'),
            //         ),
            //         SizedBox(height: 10),
            //         TextFormField(
            //           controller: _statusController,
            //           decoration: InputDecoration(labelText: 'Status'),
            //         ),
            //         SizedBox(height: 20),
            //         Center(
            //           child: SizedBox(width: double.infinity,height: 45,
            //             child: ElevatedButton(
            //               style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            //               onPressed: () {

            //               },
            //               child: const Text('Save',style: TextStyle(color: Colors.white,fontSize: 16),),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
