import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../team/team.dart';



class EditMeeting extends StatelessWidget {
  const EditMeeting({Key? key, this.dateTime, this.value}) : super(key: key);
  final DateTime? dateTime;
  final String? value ;
  static const items=[
    'OnGoing','Done','Cancelled'
  ];
  static const teams=[
    'team1','team2','team3'
  ];
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appCo,
        shadowColor: appCo,
        elevation: 0,
        title: Text('Edit meeting',style: trackerStyle,),
      ),
        backgroundColor: appCo,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(

              padding: EdgeInsets.all(size.height*0.025),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  SizedBox(height: size.height*0.049,),


                  Container(
                      height: size.height*0.25,
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(r),topLeft: Radius.circular(r),
                            bottomLeft:Radius.circular(r),bottomRight:Radius.circular(r) ),
                        image:const DecorationImage(image: AssetImage("assets/images/puzzle.jpg"),
                          fit: BoxFit.fill,),)),
                  SizedBox(height: size.height*0.05,),
                  Row(
                    children: [
                      ElevatedButton(
                          style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(appFo),
                              shadowColor:MaterialStateProperty.all(pu) ,
                              elevation:MaterialStateProperty.all(10)),
                          child: Text('Date of meeting',style: TextStyle(color: pu,fontSize: size.width*0.04),),
                          onPressed: (){
                            showDatePicker(context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                // ignore: avoid_print
                                lastDate: DateTime(2050)).then((date){print('picked');});//emit here meeting's date
                          }),
                      SizedBox(width: size.width*0.08),
                      Text(dateTime==null? 'when is your meeting?':dateTime.toString(),style: TextStyle(color: appFo,fontSize: size.width*0.045),),
                    ],
                  ),
                  SizedBox(height:size.height*0.02),
                  Row(
                    children: [
                      Text('meeting team',style: TextStyle(color: appFo,fontSize: size.width*0.045),),
                      SizedBox(width:size.width*0.08),
                      DropdownButton<String>(

                          value: value,
                          items: teams.map(buildMenuItem).toList(),
                          onChanged: (value)=>print('have chosen')),
                    ],
                  ),
                  SizedBox(height:size.height*0.02),
                  Row(
                    children: [
                      Text('meeting status',style: TextStyle(color: appFo,fontSize: size.width*0.045),),
                      SizedBox(width:size.width*0.08),
                      DropdownButton<String>(

                          value: value,
                          items: items.map(buildMenuItem).toList(),
                          onChanged: (value)=>print('have chosen')),
                    ],
                  ),//emit meeting status
                  SizedBox(height:size.height*0.02),
                  Row(
                    children: [
                      ElevatedButton(
                          style:  ButtonStyle(backgroundColor: MaterialStateProperty.all(appFo),
                              shadowColor:MaterialStateProperty.all(pu) ,
                              elevation:MaterialStateProperty.all(10)),
                          child: Text('time of meeting',style: TextStyle(color: pu,fontSize: size.width*0.04),),
                          onPressed: (){
                            // ignore: avoid_print
                            showTimePicker(context: context, initialTime: const TimeOfDay(hour: 12, minute: 0)).then((date){print('picked');});
                            //emit here meeting's time
                          }),
                      SizedBox(width: size.width*0.08),
                      Text(dateTime==null? 'which hour is it?':dateTime.toString(),style: TextStyle(color: appFo,fontSize: size.width*0.045),),
                    ],
                  ),
                  SizedBox(height:size.height*0.02),
                  Row(


                    children:[
                      const Text(
                        'Make meeting',
                        style: TextStyle(
                          fontSize: 16,
                          color:appFo ,
                        ),
                      ),
                      TextButton(onPressed: (){Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>const Team()),
                      );
                      }, child: const Text(
                        'with ',
                        style:TextStyle(
                          fontSize: 20,
                          color:appFo,
                        ),
                      ),

                      ),
                    ],
                  ),//here we'll emit
                  SizedBox(height:size.height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditMeeting()));},
                        child:  Text('edit',style: TextStyle(color: appFo,fontSize: size.width*0.045)),
                        style: ButtonStyle(
                          //elevation: MaterialStateProperty.all(40),
                          shape: MaterialStateProperty.all(const CircleBorder()),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                          foregroundColor: MaterialStateProperty.all(appFo),
                          backgroundColor: MaterialStateProperty.all(pu), // <-- Button color
                          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
                            if (states.contains(MaterialState.pressed)) return pu; // <-- Splash color
                          }),
                        ),
                      )

                    ],
                  ),
                  //SizedBox(height:size.height*0.02),

                ],
              ),

            ),

          ),
        ));
  }
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value:item,child: Text(item));

}


