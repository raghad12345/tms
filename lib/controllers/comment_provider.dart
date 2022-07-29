import 'package:flutter/material.dart';
import 'package:tracker/models/comment_model.dart';
import 'package:tracker/services/comment_service.dart';

class CommentProvider with ChangeNotifier{

   List<Comment> comments = [];

   Future getCommentById() async{
     comments = await CommentService.getCommentByTaskId();
     notifyListeners();
   }
   Future postCommentToTask(String content) async{
    print("hello world");
     await CommentService.postCommentToTask(content);

     comments = await getCommentById();

   }
}
