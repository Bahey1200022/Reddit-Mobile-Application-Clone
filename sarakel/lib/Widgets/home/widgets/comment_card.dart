import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sarakel/constants.dart';
import 'package:sarakel/models/comment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CommentCard extends StatefulWidget {
  final Comment comment;

  const CommentCard({Key? key, required this.comment}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  void _toggleSave() {
    setState(() {
      widget.comment.isSaved = !widget.comment.isSaved;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                widget.comment.isSaved ? 'Comment saved' : 'Comment unsaved')),
      );
    });
  }

  void _toggleUpvote() {
    bool wasUpvoted = widget.comment.isUpvoted; // Store previous state
    setState(() {
      widget.comment.isUpvoted = !widget.comment.isUpvoted;
      if (widget.comment.isUpvoted) {
        if (!widget.comment.isDownvoted) {
          widget.comment.upvote++;
        } else {
          widget.comment.isDownvoted = false;
          widget.comment.downVote--;
          widget.comment.upvote++;
        }
        _makeCommentVote(1); // Make an upvote API call
      } else {
        widget.comment.upvote--;
        _makeCommentVote(wasUpvoted
            ? 0
            : -1); // Revert to neutral if was upvoted, else downvote
      }
    });
  }

  void _toggleDownvote() {
    bool wasDownvoted = widget.comment.isDownvoted; // Store previous state
    setState(() {
      widget.comment.isDownvoted = !widget.comment.isDownvoted;
      if (widget.comment.isDownvoted) {
        if (!widget.comment.isUpvoted) {
          widget.comment.downVote++;
        } else {
          widget.comment.isUpvoted = false;
          widget.comment.upvote--;
          widget.comment.downVote++;
        }
        _makeCommentVote(-1); // Make a downvote API call
      } else {
        widget.comment.downVote--;
        _makeCommentVote(wasDownvoted
            ? 0
            : 1); // Revert to neutral if was downvoted, else upvote
      }
    });
  }

  void _makeCommentVote(int voteType) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse('$BASE_URL/api/vote'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'type': 'comment',
          'entityId': widget.comment.id,
          'rank': voteType,
        }),
      );
      print(response.body);
    } catch (e) {}
  }

  void _saveComment() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse('$BASE_URL/api/save'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'type': 'comment',
          'entityId': widget.comment.id,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Adjust based on your API response
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Comment saved")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to save comment")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Error saving comment")));
    }
  }

  void _unSaveComment() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse('$BASE_URL/api/unsave'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'type': 'comment',
          'entityId': widget.comment.id,
        }),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Adjust based on your API response
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Comment unsaved")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to unsave comment")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error unsaving comment")));
    }
  }

  void _report() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var response = await http.post(
        Uri.parse('$BASE_URL/api/report'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'type': 'user',
          'reason': 'spam',
          'reportedUsername': widget.comment.userID,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Adjust based on your API response
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Thank you for reporting! We will review it soon.')));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(widget.comment.userID,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(' • ${widget.comment.dateTime}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
            SizedBox(height: 5),
            Text(widget.comment.content),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'save':
                        _toggleSave();
                        // Handle save action
                        if (widget.comment.isSaved) {
                          setState(() {
                            _saveComment();
                          });
                          ();
                        } else {
                          setState(() {
                            _unSaveComment();
                          });
                        }
                        break;
                      case 'report':
                        // Implement report functionality
                        setState(() {
                          _report();
                        });

                        break;
                      case 'block':
                        // Implement block functionality
                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'save',
                      child: ListTile(
                        leading: Icon(widget.comment.isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_border),
                        title: Text(widget.comment.isSaved
                            ? 'Unsave'
                            : 'Save'), // Dynamic text based on saved state
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'report',
                      child: ListTile(
                        leading: Icon(Icons.flag),
                        title: Text('Report'),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'block',
                      child: ListTile(
                        leading: Icon(Icons.block),
                        title: Text('Block'),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.reply),
                  onPressed: () {}, // Implement reply functionality
                ),
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  color: widget.comment.isUpvoted
                      ? const Color.fromARGB(255, 255, 152, 0)
                      : Colors.grey,
                  onPressed: _toggleUpvote,
                ),
                Text('${widget.comment.upvote}'),
                IconButton(
                  icon: Icon(Icons.arrow_downward),
                  color: widget.comment.isDownvoted
                      ? const Color.fromARGB(255, 156, 39, 176)
                      : Colors.grey,
                  onPressed: _toggleDownvote,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}