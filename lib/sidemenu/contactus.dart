import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       appBar: const CustomAppbar(title: 'Contact US'),
        
      body: Container(
        margin: const EdgeInsets.only(right: 10,left: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SizedBox(height: 10,),
              
            Center(
              child: Card( elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: Color(0XffF6F7F7),
              child: Container(
                height: 60,width: 60,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0XffF6F7F7),),
               child: const Center(
                child: Icon(Icons.alternate_email,color: Colours.kbuttonpurple,size: 30,)
               ),
              ),
              ),
            ),
          
            const SizedBox(height: 15,),
          
            
          
            Card( 
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color:Colors.white,
              child: Container(
                height: 40,width: double.infinity,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white, border: Border.all(color: Colours.kbuttonpurple)),
               child: const Padding(
                 padding:  EdgeInsets.only(right: 25,left: 25),
                 child:  Row(
                   children: [
                     Icon(Icons.mail,color: Colours.kbuttonpurple,size: 18,), SizedBox(width: 5,),
                     CustomText(text: 'sunkonnectadmin@sunkpo.com', fontSize: 15, fontWeight: FontWeight.w500, textcolor: Colours.kbuttonpurple)
                   ],
                 ),
               ),
              ),
              ),
          
            
                     const  SizedBox(height: 15,),
          
                    const  CustomText(text: ' First Name', fontSize: 12,fontWeight: FontWeight.w400, textcolor: Colours.ksubheadertext, ),
            
                      const SizedBox(
                        height: 10,
                      ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 12, 10, 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colours.kbordergrey),
          
                                ),
                               
                              hintText: "First Name",
                               hintStyle: const TextStyle( fontSize: 15, fontWeight: FontWeight.normal),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colours.kbordergrey,
                                    width: 1.0,
                                  ),
                                ),
                              ))),
          
                              const  SizedBox(height: 5,),
                     
                    const  CustomText(text: ' Last Name', fontSize: 12,fontWeight: FontWeight.w400, textcolor: Colours.ksubheadertext,),
            
                      const SizedBox(
                        height: 10,
                      ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 12, 10, 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colours.kbordergrey),
          
                                ),
                               
                              hintText: "Last Name",
                               hintStyle: const TextStyle( fontSize: 15, fontWeight: FontWeight.normal),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colours.kbordergrey,
                                    width: 1.0,
                                  ),
                                ),
                              ))),
          
                             const  SizedBox(height: 5,),
                     
                    const  CustomText(text: ' Email', fontSize: 12,fontWeight: FontWeight.w400, textcolor: Colours.ksubheadertext,),
            
                      const SizedBox(
                        height: 10,
                      ),
                        SizedBox(
                          height: 70,
                          child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(12, 12, 10, 15),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(color: Colours.kbordergrey),
          
                                ),
                               
                              hintText: "Email",
                               hintStyle: const TextStyle( fontSize: 15, fontWeight: FontWeight.normal),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colours.kbordergrey,
                                    width: 1.0,
                                  ),
                                ),
                              ))),
          
                               const  SizedBox(height: 5,),
                     
                    const  CustomText(text: ' Message', fontSize: 12,fontWeight: FontWeight.w400, textcolor: Colours.ksubheadertext,),
            
                      const SizedBox(
                        height: 10,
                      ),
                         Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                      
                          borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            minLines: 6,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:  const BorderSide(
                                        color: Colours.kbordergrey
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const  BorderSide(
                                  color: Colours.kbordergrey,
                                    width: 1.0,
                                  ),
                                ),
                               hintText: 'Message',
                                hintStyle: const TextStyle( fontSize: 15, fontWeight: FontWeight.normal),),
                          ),
                        ),

                          const  SizedBox(height: 10,),

                           SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                         style: ElevatedButton.styleFrom(backgroundColor: Colours.kbuttonpurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: Text('Submit',style: GoogleFonts.poppins( textStyle: const TextStyle(color: Colors.white,fontFamily: 'poppins',fontSize: 12,   fontWeight:FontWeight.w600,))),
                       onPressed: () async {
                  
                       }
          )),

      const  SizedBox(height: 25,),
          ],
          ),
        ),
      ),
    );
  }
}