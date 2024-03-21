import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarakel/models/user.dart';
import '../../drawers/community_list.dart';
import '../../drawers/profile_drawer.dart';
import '../../models/post.dart';
import '../../providers/user_provider.dart';
import 'widgets/app_bar.dart';
import 'widgets/bottom_bar.dart';

class ChatSection extends StatefulWidget {
  @override
  State<ChatSection> createState() => _ChatSection();
}

class _ChatSection extends State<ChatSection> {
  int _selectedIndex = 3;
  final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey(); // Create a GlobalKey

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<UserProvider>(context).user;

    return Scaffold(
        key: _scaffoldKey, // Provide the GlobalKey to the Scaffold

        appBar: CustomAppBar(
          title: 'chat',
          scaffoldKey: _scaffoldKey, // Pass the GlobalKey to the CustomAppBar
        ),
        drawer: CommunityDrawer(),
        endDrawer: ProfileDrawer(
          // Add end drawer
          user: user,
        ),
        body: Center(
          child: Text('Chat Page is under construction'),
        ),
        bottomNavigationBar:
            CustomBottomNavigationBar(currentIndex: _selectedIndex));
  }
}
