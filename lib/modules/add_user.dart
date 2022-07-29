import 'package:flutter/material.dart';
import 'package:tracker/shared/components.dart';
import 'package:tracker/controllers/user_controller.dart';
import 'package:provider/provider.dart';

class AddUser extends StatefulWidget {


  //UserController userController=UserController();
  List<int> RoleIdList = [2,3,4];
  List<int> teamIdList = [1,2,3];
  String? choosRoleId;
  String? choosteamId;
  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

   @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white12,
                        child: Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.white,size: 20,)),

                    Text(
                      'AddUser',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    SizedBox(

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          //---------fname-------------------------------------
                          InputField(widget: CustomField(
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'First_Name',
                            hintColor: Colors.grey[700],
                            isPassword: false,
                            controller: context.read<UserController>().fnameController,colorField: Colors.grey[100],)


                              , title: 'First_Name'),

                          InputField(widget: CustomField(height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Last_Name', isPassword: false,
                            controller: context.read<UserController>().lnameController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Last_Name'),


                          InputField(widget: CustomField(keyboard:TextInputType.emailAddress,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Email', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller: context.read<UserController>().emailController,colorField: Colors.grey[100],)
                              , title: 'Email'),

                          InputField(widget: CustomField(keyboard:TextInputType.visiblePassword,
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Password', isPassword: true,
                            controller: context.read<UserController>().passwordController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Password'),


                          InputField(widget: CustomField(keyboard:TextInputType.number,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Employee_Identical', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller:context.read<UserController>().idController,colorField: Colors.grey[100],)
                              , title: 'Employee_Identical'),



                          InputField(
                            title: 'Role_Id',
                            widget:  Container(
                              margin: EdgeInsets.only(top: 7),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12, width: 1.5),
                              ),
                              child:DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select role_Id '),

                                  items: widget.RoleIdList.map(buildMenuItem).toList(),
                                  value:widget.choosRoleId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {

                                        widget.choosRoleId=value as String?;
                                        context.read<UserController>().role_id = widget.choosRoleId!;
                                      }),
                                ),
                              ),
                            ),
                          ),


                          //-------team_id-------

                          InputField(
                            title: 'Team_Id',
                            widget:

                            Container(
                              margin: EdgeInsets.only(top: 7),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12, width: 1.5),
                              ),
                              child:DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select Team_id '),
                                  items: widget.teamIdList.map(buildMenuItem).toList(),
                                  value:widget.choosteamId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        widget.choosteamId=value as String?;
                                        context.read<UserController>().team_id = widget.choosteamId!;
                                      }),
                                ),
                              ),
                            ),
                          ),




                        ]


                        ),
                      )
                  ),
                ),
              ),





            ]),

      ),

      floatingActionButton: FloatingActionButton(backgroundColor:Colors.indigo,onPressed:
        context.read<UserController>().onClickAddUser

        ,child: Icon(Icons.check_outlined),) ,

    );
  }
}

class InputField extends StatelessWidget {
  InputField({
    required this.widget,
    required this.title,
  });

  Widget widget;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,),
          ),
          SizedBox(height:5),
          widget
        ],
      ),
    );
  }
}



DropdownMenuItem<String> buildMenuItem(int item) => DropdownMenuItem(
    value: item.toString(),
    child: Text(item.toString())
);