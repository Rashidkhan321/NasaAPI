
import 'package:app_with_restapi/apibase_wor/modals/nsaa%20api%20modal.dart';
import 'package:app_with_restapi/userinterface/deatil.dart';
import 'package:flutter/material.dart';

import '../apibase_wor/api_data/api data.dart';

class nasadata extends StatefulWidget {
  const nasadata({Key? key}) : super(key: key);

  @override
  State<nasadata> createState() => _nasadataState();
}

class _nasadataState extends State<nasadata> {
   final obj = apidatamodal();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text('DATA About MARS')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        FutureBuilder(future: obj.getdata(), builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else{

            return Expanded(
              child:

              ListView.builder(
                  itemCount:  snapshot.data!.photos!.length,
                  itemBuilder: (context, index){
                    final instance = snapshot.data!.photos![index].toString();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                detailScreen(imagescr:
                            snapshot.data!.photos![index].imgSrc.toString())));
                          }
                              ,
                              child: Container(
                                height: 300,
                                width: double.infinity,

                                  child: Image.network(snapshot.data!.photos![index].imgSrc.toString(),
                                  fit: BoxFit.cover,
                                  ),

                              ),
                            ),
                            Positioned(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data!.photos![index].rover!.maxDate.toString(),
                                style: TextStyle(color: Colors.red,
                                  fontSize: 25
                                ),),
                            )),
                            Positioned(
                                bottom: 0,
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data!.photos![index].rover!.status.toString(),
                                style: TextStyle(color: Colors.red,
                                    fontSize: 25
                                ),),
                            )),
                            Positioned(
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(snapshot.data!.photos![index].rover!.name.toString(),
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 25
                                    ),),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          }

        })

        ],
      ),
    );
  }
}
