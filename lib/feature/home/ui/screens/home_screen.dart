import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/feature/auth/ui/controllers/auth_controller.dart';
import 'package:notesapp/feature/home/ui/widget/list_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundColor: Colors.yellow, // background color
              child: IconButton(
                icon: const Icon(Icons.logout_outlined, color: Colors.black), // icon color
                onPressed: () async {
                  await AuthController.clearUserData();
                  context.go('/signIn');
                },
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Notes',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 16),
              ListViewWidget(),
            ],
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/addNew');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



