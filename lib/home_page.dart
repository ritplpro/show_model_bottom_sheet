

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController noteTitle=TextEditingController();
  TextEditingController subTitle=TextEditingController();
  List<Map<String,dynamic>>  dataList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.grey,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active)),
         PopupMenuButton(

             position:PopupMenuPosition.under,
             itemBuilder: (context){
           return [
             PopupMenuItem(
               onTap: (){},
                 child: Row(
               children: [
                 Icon(Icons.settings),
                 SizedBox(width: 5,),
                 Text('Setting'),
               ],
             )),
             PopupMenuItem(
                 onTap: (){},
                 child: Row(
               children: [
                 Icon(Icons.logout),
                 SizedBox(width: 5,),
                 Text('Logout'),
               ],
             )),

           ];
         })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                  itemCount: dataList.length,
                  itemBuilder: (context,index){
                return ListTile(
                  leading: Text("${index+1}"),
                  title: Text(dataList[index]["notename"]),
                  subtitle: Text(dataList[index]["subtitle"]),
                  trailing: IconButton(icon: Icon(Icons.delete),
                    onPressed: (){

                    setState(() {


                    dataList.removeAt(index);
                    });
                    },)
                );
              }),),
            FloatingActionButton(
              onPressed: (){
                setState(() {
                  noteTitle.clear();
                  subTitle.clear();

                    showModalBottomSheet(context: context,
                        builder: (context){
                      return Container(
                        height: 400,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Text("Add Note",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18
                              ),),
                              SizedBox(height:20),
                              TextField(
                                controller: noteTitle,
                                keyboardType: TextInputType.name,
                                autofocus: true,
                                decoration: InputDecoration(
                                  label: Text("Enter Note Title"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )
                                ),
                              ),
                              SizedBox(height:20),
                              TextField(
                                controller: subTitle,
                                keyboardType: TextInputType.name,
                                autofocus: true,
                                decoration: InputDecoration(
                                    label: Text("Enter Subtitle"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    )
                                ),
                              ),
                              SizedBox(height:40),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(onPressed: (){
                                    setState(() {

                                    var title=noteTitle.text.toString();
                                    var subtitlee=subTitle.text.toString();

                                      dataList.add({
                                        "notename": title,
                                        "subtitle": subtitlee,

                                      });

                                    Navigator.pop(context);
                                    });




                                  }, child: Text('Add Note ')),
                                  ElevatedButton(onPressed: (){
                                    Navigator.pop(context);
                                    setState(() {

                                    });
                                  }, child: Text('Cancel')),
                                ],
                              ),



                            ],
                          ),
                        ),
                      );
                        });





                });},
              child: Icon(Icons.add),),




          ],
        ),
      ),
    );
  }
}

