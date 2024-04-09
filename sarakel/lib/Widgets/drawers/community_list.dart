import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarakel/features/create_circle/create_circle.dart';
import 'package:sarakel/models/community.dart';
import 'package:sarakel/providers/user_communities.dart';
import 'package:provider/provider.dart' as provider;
import 'package:sarakel/Widgets/profiles/communityprofile_page.dart';

///////drawer of communities
class CommunityDrawer extends ConsumerWidget {
  final String token;
  CommunityDrawer({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Community> fetchedCommunities =
        provider.Provider.of<UserCommunitiesProvider>(context, listen: false)
            .communities;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Create a circle'),
              leading: Icon(Icons.add),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CommunityForm(token: token)));
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: fetchedCommunities.length,
                itemBuilder: (BuildContext context, int index) {
                  final community = fetchedCommunities[index];
                  return ListTile(
                    title: Text('${community.name}'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return CommunityProfilePage(community: community);
                        }),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
