import 'package:flutter/material.dart';
import 'package:sarakel/features/create_circle/create_circle.dart';
import 'package:sarakel/features/create_post/create_post.dart';
import 'package:sarakel/providers/user_communities.dart';
import 'package:sarakel/providers/user_provider.dart';
import 'package:sarakel/Widgets/chatting/chat_page.dart';
import 'package:sarakel/Widgets/inbox/inbox_page.dart';
import 'Widgets/entry/login_page.dart';
import 'Widgets/entry/signup_page.dart';
import 'Widgets/entry/welcome_page.dart';
import 'Widgets/explore_communities/explore_communities.dart';
import 'package:provider/provider.dart';
import 'Widgets/entry/forgot_password.dart';
import 'Widgets/settings/settings_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
            create: (_) => UserProvider()), //for mock api
        ChangeNotifierProvider<UserCommunitiesProvider>(
            create: (_) =>
                UserCommunitiesProvider()) // Add UserCommunitiesProvider
      ],
      child: MaterialApp(
        title: 'Sarakel',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WelcomePage(),
        routes: {
          '/welcome': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignupPage(),
          '/create_post': (context) => CreatePost(),
          '/communities': (context) => ExploreCommunities(),
          '/chat': (context) => ChatSection(),
          '/inbox': (context) => InboxSection(),
          '/forgotpassword': (context) => ForgotPasswordPage(),
          '/create_circle': (context) => CommunityForm(),
          '/settings': (context) => SettingsPage(),
        },
        debugShowCheckedModeBanner:
            false, // Set debugShowCheckedModeBanner to false
      ),
    );
  }
}
