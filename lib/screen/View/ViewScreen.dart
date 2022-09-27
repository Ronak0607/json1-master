import 'package:flutter/material.dart';
import 'package:json/screen/userProvider/UserProvider.dart';
import 'package:provider/provider.dart';

class screenView extends StatefulWidget {
  const screenView({Key? key}) : super(key: key);

  @override
  State<screenView> createState() => _screenViewState();
}

class _screenViewState extends State<screenView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context,listen: false).getUserData();
  }
  UserProvider? userProvidertrue;
  UserProvider? userProviderfalse;

  @override
  Widget build(BuildContext context) {
    userProvidertrue = Provider.of<UserProvider>(context, listen: false);
    userProviderfalse = Provider.of<UserProvider>(context, listen: true);

    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Expanded(
            child: GridView.builder(
                itemCount: userProvidertrue!.finalList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: Image.network("${userProvidertrue!.finalList[index].image}"),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
