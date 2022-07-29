
import 'dart:convert';

import 'package:tracker/models/comment_model.dart';

import '../config/server_config.dart';
import 'package:http/http.dart' as http;



class CommentService{

   static Future getCommentByTaskId() async {
    var url = ServerConfig.domainName + ServerConfig.getCommentsByTaskId;
    var response = await http.get(Uri.parse(url), headers: {
     "Content-Type": "application/json",
     "Accept": "application/json",
     "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODQ0NmRhNDI3YTViMDNhNzUzMGM0YTgwODk2ZmM2MDJjNzYwYzdmN2RhNGZlYjU4YTgwM2U3YWEwMTM3MzVlNzViYjcyYmJkMjJhYjg1MTciLCJpYXQiOjE2NTczMjE1NDIuMDAyMTgyLCJuYmYiOjE2NTczMjE1NDIuMDAyMjEyLCJleHAiOjE2ODg4NTc1NDEuOTU5OTYzLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.0RsvJc3PZgiZ8Rd5UeO1ROkfe_rSOF_moh0bL-6NIGXWTvCBBgwacbYAvvXIF0xiuYiEi5svQsfYpk97dv1O1Q0xTxnXOjYjJb34kFG4HAbjN3Y0Yp2Y7CJBSvSimUxlzElnDjO1K3UxWniJ0BkOL07jVNxp8lfj9IPl7g-nCk8uHhuNmtZotVZr9_CxR8MkzLiaTofK6YGu-esauZkY_5fFkAM41GhL25kqVJIyZq1EUpjrW_eDoSPGawBj1WQzY6PNTS3fP7-oHENMyZ8gc6nRrI65JH2FQAfNmN8lI_mvAAqlzEVwvHvWg3Dn2qZv0OmJk93LSe5ncMoZPmL34BnIZZcMbulq_Tl1NhnjpcfVNKavysvrOCuhHVIHHRzparMpcgb1ppgYLuzjUi2QgrbhNBslONi3-7tkz4vgo47VtEe9MUZ2ZyBhKZ-K0SzIEurHP-Af8FNTstH6RGnxCslS_0xqG80d9S_P9f6mkS_Sby4fY_ev6LF2q9l7n3wEYzPVOS3lEqSQbRq_6c_KKQpjFbl9E_u8aM35FfwKtFZqiAfc4kBl2THTnSVtMQA-fvQomkLSVAaizIioD4IKPkYvbgHV9VcE3bUiOATVYwJDzLXdFZpU6K7bXe8YhUoQgo5PjR43DuyCJZ6OZVfcnq46MULlO7ieB8ejyMm3Flc",
    });
    print('response is ${response.body}');
    var jsonData = jsonDecode(response.body);
    print('jsonDecode is ${(jsonData as List).length}');
    List<Comment> list =[];
    (jsonData as List).forEach((element) {
     list.add(Comment.fromJson(element));
    });
    print('list size ${list.length}');
    return list;
}

   static Future postCommentToTask(String content)async{

    var url = ServerConfig.domainName + ServerConfig.postCommentToTask;
    print("content $content");
    Map<String, dynamic> map = {"body" : "qwerqwerqwer"};
    var body = json.encode(map);
    print("body is $body");
    try {
     http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMzFjM2NjZWE2YzAxN2M2ZTFlZWI3ZjlkODNkYjU0NDQwNmY4OGI2MDRhMDNlNmZkMGM2NWRiZTRiNmE3NmU1NWFhNGE4NjIzM2JhNGQxNzYiLCJpYXQiOjE2NTc2MTk4MzkuNTc4MDIyLCJuYmYiOjE2NTc2MTk4MzkuNTc4MDM2LCJleHAiOjE2ODkxNTU4MzkuNTA5NTcxLCJzdWIiOiI3Iiwic2NvcGVzIjpbXX0.sXhYWDQNSQ307CIELKg6Q2oleMpc0K8KRFhdIsvOC9EdDv9qZvOaUOc-dmr6duG4FdbACqa12gXxAiyElWgU9DzVp-llLXN1xROUp-7yiSgsAF1dfynBDgQUQAMSazXMyDl1efK4kjsRveldvKpKZKnzZ185J9vkicGQQMwIeJjlee5Wf0tg_ZihQxjOeQOyY3PIPuaEmjHJJvix9BoHgj6rXWhlyDxAGsfElcSqJjCDZkFiu-_DjcWk33CalEeZmwLxHFRfv22YRuVf2g3RZady8WfLOjc32TLncw1ROP6umSGp468ilyLDZ7yk4UY1lSiRb0bpohn2mJJ-qt-3u9S8N4JQDJbuS2ds6XavvxwQqQbq7pqlNvT8raBMIFMpV_vCSFu3d_VEn8l4CEf03nnQ6g5OMk9h9NH_3up8rS3PdTtHMhexfou-ZrE2fqVoVQqm2-QND2mbrmLrPQFfLPhHWhdOjr4_P62hYB0OSb_9SsMRqRHfVB489yNEY8TN2XNINrmBeVWbomP_OvdipFAkwo3-7zrODs3dKoaHbHQWucBUva1gqCR5XkyEpm0XB718qUlafzebEOzYQ4awU-4ars_u3Y14p8GC-x8HZsbrIQmnzAK8k3v8LafW5U0efPaG5KU-LAyIH1axNwSy93lzdFQxRoWZiCJ7RR4M-nQ",
     }, body: {
       'body' : content
      });
    }catch(error){
     print("error message is $error");
    }
   }


}



