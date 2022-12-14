import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tracker/models/all_users_model.dart';
import 'package:tracker/models/task_model.dart';
import 'package:tracker/models/user_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tracker/config/server_config.dart';

class UserService{


  static Future addUser(User user)async{

    var response= await http.post(
        Uri.parse(ServerConfig.domainName+ServerConfig.addUser),
        body:<String,dynamic>{
          'first_name':user.first_name,
          'last_name':user.last_name,
          'email':user.email,
          'employee_identical':user.employee_identical,
          'password':user.password,
          'role_id':user.role_id,
          'team_id':user.team_id,
        },
        headers: {
          'auth': 'Bearer  eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzk3YmFjYTc2YTJiMzc5OGZhODAyMzYzMmNhZGIyZmI3MDlhODllN2ZlNzE0ODM0ZGI0NDI0YmFiYTQ5NWYzYjdhZjQ0YWU0ZTM1Y2Q0NTMiLCJpYXQiOjE2NTkwODU2NDQuNzE1MTE0LCJuYmYiOjE2NTkwODU2NDQuNzE1MTE3LCJleHAiOjE2OTA2MjE2NDQuMzkwMDAyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Eh7sVS_0HQ6n7rlbnqeY7oH_x2iJQMsOW-rrCBwTxQpgJfzTheJvN7nLNMGCzXJwEfNvuNhougXkYlFvJSwwy8ZEN-_lfmJG_1cj8O0SrUf9XaUmvmiK9jnT0B6_OEbXZ8SK950Ags8m1Aa9BB-1utPMNrnAhdmP4YtQzbFKlc1nq_Ns0IlgmuaoI5xGVsEmnTCrtAq_Rz_937NST7pqAINsTK29FPbyJDPOMe6TVcOgDV95IW8aDkMvPAiNG9nQEhBeiBNpbjfos5puwc3mMKilmAVstT0DRNghx18JdHFqLmCQ6PMYUJAZRpeVLiLOZFfyHkRk3jNDYvDmBRqRW_wU4sz9k7euKqjC7x2HmVS1OjaKlYywNiVrbBiRhkzdQ4mx-az-A45nqAlc_bg7i1VZcNd8rZinLEiVX5htyQGsG_7OfP3foMvZJeloWWoNzW-kYhEv5euN2RieMWLVEFoWaO1kmO5U0VLnS24by2RTZwgQvkvLLSz4cXFVYbiKXwxviqxDIsdvYNV7elapy41Zpiep3BU-vK6NNulPRPrOvZzWBCqp8UGLfYJ2run1s-M1Le5jPENubn5yN7Iw5BQk-vY992rJknq9tT4qxAmU-UOYfcwJesdRyXIZ8Xp_8Zjyo4KO1ww-haQWirptAfMKkehV9rukV3PA84Pf0k4',
          'Accept': 'application/json',
        }


    );

    Map<String,dynamic> json=jsonDecode(response.body);
//----check here ----------
    print(json['message:']);
    return User.fromJson(json['the user:']['user']);
  }

  static Future getAllUsers() async{


      var url = ServerConfig.domainName + ServerConfig.showUsers;
      try {
        var response = await http.get(Uri.parse(url), headers: {

          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjEzODk3M2I0M2YxMWQ4ZmZlNWZlZmYxMDRhYzc2OWY0NDQzYmNhYzQ0NTc0MzA5ODE4MjU3M2VmYWJjZWYyYzUzZWQwMjBmOWNlYWIzZWIiLCJpYXQiOjE2NTgwNTEyMzQuNTQ5MjEyLCJuYmYiOjE2NTgwNTEyMzQuNTQ5MjE4LCJleHAiOjE2ODk1ODcyMzQuNTIwMjE4LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.jFSqv7rg-KrvUnMTAFy0YXM0aokw5H1bST-epu0MuCMxq1t7BV_Q_1mprLUFnG5fF3PN1DvOftOA46AGgW7oPf2dEmGTFZaKkXBffRDWucole3Hu_5wWo147ZnUIhCC-a2TMkBlaSpZyZQARmzM52BwTj270CUt-l0-4hIov9JtmoVtg_4AERcH9Jjta05v5Qj-GQTMOGLKKRPKsTnX2IkmDDyLMBvGUqeUKbkVUCC_eskfRwGNO54TWRiqCve3eN8xujH8Uz1-BPixLOpSIMa47_OMgVzVr6cDZUaUoULKhislPMwn0F3Uz3osWiyypJr5T1DmQKVG_sEn4TL7D3E1AR7TAgKBsRHwZk7YjroDVKjgoWHmVN_CUc5oVuxoao5qc7CVpxbou38lswxpZ9JrngeIE5cpNeDW_sIOj-iv4KujqArsS68JOnZBiJPCNyYjzcefVlRY8nES1CB0QnZpSEaTxAAFH6k3MeOBQNCy5lycbq5959SvJ7b2SkAX3zB7qDY0Y9xb0xFWAX4KQbIw5u5gxgXshx2zJTwT2crrYpHO9E82Q0cvF-__oMQoM9UnuM-DyghJuXJxc8Nh4Q1nYFIyivEjY1yVRDuKnnTDtqybFd58VDx205YpvTfajOk5U6Fx0pLL4aHR29aT6mTwy4O6BxOQuZidGDDxnzM4",
        });
        print('response is ${response.body}');
         AllUsersModel allUsersModel = AllUsersModel();
         allUsersModel.allUser = [];
        jsonDecode(response.body).forEach((v){
          v.forEach((v1){
             allUsersModel.allUser!.add(UserModel.fromJson(v1));
          });
        });

        return allUsersModel;
      }catch(error){
        print('error message ${error.toString()}');
      }

    }

  static Future deleteUser(int id) {
     try {
       return http.delete(
           Uri.parse(ServerConfig.domainName + ServerConfig.deleteUser + '$id'),
           headers: {
             "Content-Type": "application/json",
             "Accept": "application/json",
             "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWM3N2FhNWIxZjg3NmUwNjliMTI4Y2I5ZjNiZTNiODMxZjNmYTcyOWJjMTBiZjk1ODI3ZWEzZGJmMzUxOWY5NjVmOWJlNDQzYmE4MjExMjgiLCJpYXQiOjE2NTgwNDMxOTUuNzg0MzYyLCJuYmYiOjE2NTgwNDMxOTUuNzg0MzcxLCJleHAiOjE2ODk1NzkxOTUuNTU5MTQyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XAJzzkF38XBX8OdP6FXZnmE1KGqt-lOG-GlxcXDktlWgDTa10u2uWXv3M1zH9ZwqxEek3XMS6Pq-D1LMF32qUj6v256MOAJ3dEOeYv1b_LV19zVhyH34GcwAvweAw_lvcvs9NzCMKyCxC9Pf58bsR4uNKtbrPPBDRqAu8sebnl4unjNx3Ndca237KySsNH6dp5K1qey_tQx_yVVhj25_LgdLAFDFqGzsSfQFIFxGx1wotc4i2RjIgf9oXetfUpc_A7SaAkhg4iMRy6NdsgAVPOn46Eu-qLAnqQVFi2GN2jlghl_-9BpnbWVJb0qusXX8z9liKm63Cn2i65MTsKNISPBGNpaQvyeKxDF42uGOusfBupbLDehjy6GzP8M6wNGL6rIlk8tGoInl0q8K6NuNoaYR6jXAzJLZdJ2C10D7lp-RdYUMABRr7HQRHOxogTpJFUzGHF9V7m82K2E2TQ0wGAhcKr-HjfPjQ68RyoDA2HJHrxKcvqMnYRoGIBBwIJCLJT4zhSpqOWp1pRPPKj8oZrQ9IxijaBtWm2qk4pEZccT00CHrXpMRv18YWpEG8IEAuR0qpjT3Nedz-J7Zf0JSZqOcRR8JVrSEXqStvBEEQdMzG8jro1wqMsvLWg0po6lGcBG3hQ5EkUhmMRzU7AkklKWm50i17oS9MFq3SYxwgcQ",
           });
     }catch(error){
       return Future.error(error);
     }
  }

  static Future updateUser(UserModel userModel) async{
    try {
      print('start updating');
      final http.Response response = await http.put(
          Uri.parse(ServerConfig.domainName + ServerConfig.updateUser + '${userModel.userId}' ),
          body: json.encode({
            "first_name": userModel.firstName,
            "last_name": userModel.lastName,
            "email": userModel.email,
            "employee_identical": userModel.employeeIdentical,
            "password": userModel.password,
            "role_id": userModel.roleId == 3 ? 2 : 3,
            "team_id":userModel.teamId
          }),
          headers: {
           "content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWM3N2FhNWIxZjg3NmUwNjliMTI4Y2I5ZjNiZTNiODMxZjNmYTcyOWJjMTBiZjk1ODI3ZWEzZGJmMzUxOWY5NjVmOWJlNDQzYmE4MjExMjgiLCJpYXQiOjE2NTgwNDMxOTUuNzg0MzYyLCJuYmYiOjE2NTgwNDMxOTUuNzg0MzcxLCJleHAiOjE2ODk1NzkxOTUuNTU5MTQyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XAJzzkF38XBX8OdP6FXZnmE1KGqt-lOG-GlxcXDktlWgDTa10u2uWXv3M1zH9ZwqxEek3XMS6Pq-D1LMF32qUj6v256MOAJ3dEOeYv1b_LV19zVhyH34GcwAvweAw_lvcvs9NzCMKyCxC9Pf58bsR4uNKtbrPPBDRqAu8sebnl4unjNx3Ndca237KySsNH6dp5K1qey_tQx_yVVhj25_LgdLAFDFqGzsSfQFIFxGx1wotc4i2RjIgf9oXetfUpc_A7SaAkhg4iMRy6NdsgAVPOn46Eu-qLAnqQVFi2GN2jlghl_-9BpnbWVJb0qusXX8z9liKm63Cn2i65MTsKNISPBGNpaQvyeKxDF42uGOusfBupbLDehjy6GzP8M6wNGL6rIlk8tGoInl0q8K6NuNoaYR6jXAzJLZdJ2C10D7lp-RdYUMABRr7HQRHOxogTpJFUzGHF9V7m82K2E2TQ0wGAhcKr-HjfPjQ68RyoDA2HJHrxKcvqMnYRoGIBBwIJCLJT4zhSpqOWp1pRPPKj8oZrQ9IxijaBtWm2qk4pEZccT00CHrXpMRv18YWpEG8IEAuR0qpjT3Nedz-J7Zf0JSZqOcRR8JVrSEXqStvBEEQdMzG8jro1wqMsvLWg0po6lGcBG3hQ5EkUhmMRzU7AkklKWm50i17oS9MFq3SYxwgcQ",
          });
      print('update is ${response.body}');
    }catch(error){
      print('error is $error ');
      return Future.error(error);
    }
  }


  }








