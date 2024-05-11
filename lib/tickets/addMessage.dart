
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sunkonnect/widgets/customtextviews.dart';
import 'package:intl/intl.dart';
class AddMessage extends StatefulWidget {
  const AddMessage({super.key});

  @override
  State<AddMessage> createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
    final TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
     appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: (){
            Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.black,))
          ),
         
          title: const CustomText(
              text: "Add Message",
              fontSize: 20,
              fontWeight: FontWeight.w500,
              textcolor: Colors.black),
          centerTitle: false,
          
        ),
        body: Container(
          margin: const EdgeInsets.only(right: 10,left: 10),
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
            
                const Heading(title: 'Message Id'),
             Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade100,
                elevation: 0,
              child: Container(
                width: double.infinity,height: 45,
                margin: const EdgeInsets.only(right: 10,left: 10),
                color: Colors.grey.shade100,
                child: 
                   
                  const Padding(
                    padding:  EdgeInsets.only(top: 15,),
                    child: CustomText(
                      text: 'TLG202404151489',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textcolor:Colors.black,),
                  ),
                
                )),
                 const SizedBox(height: 10,),
            
                  const Heading(title: 'Sender'),
             Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade100,
                elevation: 0,
              child: Container(
                width: double.infinity,height: 45,
                margin: const EdgeInsets.only(right: 10,left: 10),
                color: Colors.grey.shade100,
                child: 
                   
                  const Padding(
                    padding:  EdgeInsets.only(top: 15,),
                    child: CustomText(
                      text: 'Vishal K.',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textcolor:Colors.black,),
                  ),
                
                )),
                 const SizedBox(height: 10,),
            
             const Heading(title: 'Date'),
                     Card(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
            color: Colors.grey.shade400,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
                    ),
                    child: TextFormField(
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
            controller: dateController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color(0xffFDFDFD),
                  // #FFF7F7
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffFDFDFD),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(
                fontSize: 14.0,
                color: Color(0xff979797),
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
              );
              if (pickeddate != null) {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  setState(() {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickeddate);
                    String formattedTime = DateFormat('HH:mm').format(
                      DateTime(
                        pickeddate.year,
                        pickeddate.month,
                        pickeddate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      ),
                    );
                    dateController.text = '$formattedDate, $formattedTime';
                  });
                }
              }
            },
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
            
                    const SizedBox(height: 10,),
                    
            
               const Heading(title: 'Message'),
            
               const SizedBox(height: 5,),
            
                   Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          minLines: 6,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:  BorderSide(
                                    color: Colors.grey.shade400,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:  BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                             
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ),
            
              // 
               
             
            
               const SizedBox(height: 20,),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox( height: 40, width: 100,
                  child: ElevatedButton(onPressed: (){}, 
                  style: ElevatedButton.styleFrom(backgroundColor: HexColor('#464667'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                   child: const CustomText(text: 'Cancel', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colors.white)),
                ),
                  SizedBox(
                    height: 40, width: 100,
                    child: ElevatedButton(onPressed: (){}, 
                    style: ElevatedButton.styleFrom(backgroundColor: HexColor('#464667'),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                      child: const CustomText(text: 'Add', fontSize: 14, fontWeight: FontWeight.w500, textcolor: Colors.white)),
                  )
                ],
               )
            
              
                                 
             ],
            ),
          ),
        ),
      
    );
  }
}







class Heading extends StatelessWidget {
  final String title;
  const Heading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: CustomText(
         text: title,
         fontSize: 14,
       fontWeight: FontWeight.w500,
      textcolor:Colors.grey.shade700,),
    );
  }
   }