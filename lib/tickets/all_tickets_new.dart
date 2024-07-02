import 'package:flutter/material.dart';

class AllTicketsList extends StatefulWidget {
  const AllTicketsList({super.key});

  @override
  State<AllTicketsList> createState() => _AllTicketsListState();
}

class _AllTicketsListState extends State<AllTicketsList> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('In Progress',style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
    );
  }
} 