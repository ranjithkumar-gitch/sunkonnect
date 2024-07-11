import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunkonnect/api_services/api_service_list.dart';
import 'package:sunkonnect/dashboard.dart';
import 'package:sunkonnect/sharedpreferences/sharedprefences.dart';
import 'package:sunkonnect/sidemenu/model/contactus_request_model.dart';
import 'package:sunkonnect/widgets/colors/colors.dart';
import 'package:sunkonnect/widgets/customappbar.dart';
import 'package:sunkonnect/widgets/customtext.dart';
import 'package:sunkonnect/widgets/progressbar.dart';
import 'package:sunkonnect/widgets/snackbar.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController messageController = TextEditingController();

    late ContactUSRequestModel requestModelId;

  bool password = true;

  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    requestModelId = ContactUSRequestModel(
      userId: "",
      emailId: "",
      firstName: "",
      message: "",
      getInTouch: "",
      userObjId: "",
      roleCode: "",
      createdBy: "",
      createdByEmail: "",
    );
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
      backgroundColor: Colors.white,
       appBar: const CustomAppbar(title: 'Contact Us'),
        
      body: Container(
        margin: const EdgeInsets.only(right: 10,left: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  SizedBox(height: 10,),
                
              Center(
                child: Card( elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Colours.kcardbgColor,
                child: Container(
                  height: 60,width: 60,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colours.kcardbgColor,),
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
            
                    
            
               const Padding(
                 padding:  EdgeInsets.only(left: 5),
                 child: Row(
                   children: [
                     CustomText(
                       text: 'Name',
                       fontSize: 12,
                       fontWeight: FontWeight.w500,
                     textcolor: Colours.ksubheadertext,
                       ), 
                       SizedBox(width: 5,),
                      Text('*',style: TextStyle(color: Colors.red),)
                   ],
                 ),
               ),
                
               Card(
                   shape:
                       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   color: Colours.kcardbgColor,
                   elevation: 0,
                   child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colours.kcardbgColor,),
                       width: double.infinity, height: 50,
                
                      child:  
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 10),
                        child: Text(
                         SharedPrefServices.getname().toString(),
                         style: GoogleFonts.poppins(
                           color: Colours.kresponsivetext,
                               
                           height: 1.5,
                           fontSize: 13,
                           fontWeight: FontWeight.w500,
                         ),
                                           
                     ),
                      ),)),
            
            
                 const  SizedBox(height: 10,),
            
                    
            
               const Padding(
                 padding:  EdgeInsets.only(left: 5),
                 child: Row(
                   children: [
                     CustomText(
                       text: 'Email',
                       fontSize: 12,
                       fontWeight: FontWeight.w500,
                     textcolor: Colours.ksubheadertext,
                       ),
                        SizedBox(width: 5,),
                      Text('*',style: TextStyle(color: Colors.red),)
                   ],
                 ),
               ),
                
               Card(
                   shape:
                       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                   color: Colours.kcardbgColor,
                   elevation: 0,
                   child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colours.kcardbgColor,),
                       width: double.infinity, height: 50,
                
                      child:  
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 10),
                        child: Text(
                         SharedPrefServices.getuserId().toString(),
                         style: GoogleFonts.poppins(
                           color: Colours.kresponsivetext,
                               
                           height: 1.5,
                           fontSize: 13,
                           fontWeight: FontWeight.w500,
                         ),
                                           
                     ),
                      ),)),
                        
                       const  SizedBox(height: 10,),
                       
                      const Row(
                        children: [
                            CustomText(text: ' Message', fontSize: 12,fontWeight: FontWeight.w500, textcolor: Colours.ksubheadertext,),
                            SizedBox(width: 5,),
                      Text('*',style: TextStyle(color: Colors.red),)
                        ],
                      ),
              
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
                              controller: messageController,
                              maxLines: null,
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                              return "Message is required";
                                  }
                             return null;
                              },

                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colours.kbordergrey)),
                      
                                  
                          
                                 hintText: 'Message',
                                  hintStyle: const TextStyle( fontSize: 13, fontWeight: FontWeight.normal),),
                            ),
                          ),
            
                            const  SizedBox(height: 10,),
            
                             SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                           style: ElevatedButton.styleFrom(backgroundColor: Colours.kbuttonpurple,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Text('Submit',style: GoogleFonts.poppins( textStyle: const TextStyle(color: Colors.white,fontFamily: 'poppins',fontSize: 15,   fontWeight:FontWeight.w600,))),
                         onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            requestModelId.userId = SharedPrefServices.getuserId().toString();
                            requestModelId.emailId = SharedPrefServices.getuserId().toString();
                            requestModelId.firstName = SharedPrefServices.getname().toString();
                            requestModelId.message =  messageController.text;
                            requestModelId.getInTouch = 'sunkonnectadmin@sunkpo.com';
                            requestModelId.userObjId = SharedPrefServices.getuserObjId().toString();
                            requestModelId.roleCode = SharedPrefServices.getroleCode().toString();
                             requestModelId.createdBy = SharedPrefServices.getname().toString();
                             requestModelId.createdByEmail = SharedPrefServices.getuserId().toString();

                            setState(() {
                              isApiCallProcess = true;
                            }); 

                             ApiService apiService = ApiService();

                            apiService.contactUs(requestModelId).then((value) {
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

                                
                              } else if (value.status == 200 ||
                                  value.status == 201) {

                             ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                             content: Text('Message Sent Successfully'),
                              ),
                               );
                                showToast("Message Sent Successfully");

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const DashboardScreen();
                                  },
                                ),
                              );
                            } else {
                              setState(() {
                                isApiCallProcess = false;
                              });
                            }
                          });
                        }
                      },
                      

                        
                         
            )),
            
                  const  SizedBox(height: 25,),
            ],
            ),
          ),
        ),
      ),
    );
  }
}