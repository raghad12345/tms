import 'package:comment_box/comment/comment.dart' show CommentBox;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracker/controllers/comment_provider.dart';
import 'package:tracker/shared/constants.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  dynamic formKey;
  final TextEditingController commentController = TextEditingController();
  List filedata = [];

  Widget commentChild(BuildContext context) {
    return ListView(
      physics:const BouncingScrollPhysics(),
      children: [
        for (var i = 0; i < context.watch<CommentProvider>().comments.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  // ignore: avoid_print
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration:  BoxDecoration(
                      color: pu,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      /*backgroundImage: NetworkImage(data[i]['pic'] + "$i")*/),
                ),
              ),
              title: Text(
                'name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(context.watch<CommentProvider>().comments[i].body!),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    context.read<CommentProvider>().getCommentById();
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments",style: trackerStyle,),
        backgroundColor: appCo,
        elevation: 0,
      ),
      body: CommentBox(
        userImage:
        "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
        child: commentChild(context),
        labelText: 'Write a comment...',
        withBorder: false,
        errorText: 'Comment cannot be blank',
        sendButtonMethod: () {
          print("marwan  marwan");
          context.read<CommentProvider>().postCommentToTask(commentController.text);

          /*if (formKey.currentState!.validate()) {
            // ignore: avoid_print
            print(commentController.text);
            setState(() {
              var value = {
                'name': 'New User',
                'pic':
                'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                'message': commentController.text
              };
              filedata.insert(0, value);
            });

            commentController.clear();
            FocusScope.of(context).unfocus();

          } else {
            // ignore: avoid_print
            print("Not validated");
          }*/
        },
        formKey: formKey,
        commentController: commentController,
        backgroundColor: pu,
        textColor: Colors.white,
        sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
      ),
    );
  }
}