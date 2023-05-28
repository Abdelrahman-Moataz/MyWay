import 'dart:async';

import 'package:banda/chat/const/app_constants.dart';
import 'package:banda/chat/const/color_constants.dart';
import 'package:banda/chat/const/firestore_constants.dart';
import 'package:banda/chat/models/popup_choices.dart';
import 'package:banda/chat/models/user_chat.dart';
import 'package:banda/chat/pages/settings_page.dart';
import 'package:banda/chat/providers/auth_provider.dart';
import 'package:banda/chat/providers/home_provider.dart';
import 'package:banda/chat/utils/debouncer.dart';
import 'package:banda/loginpages/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomeChatPage extends StatefulWidget {
  const HomeChatPage({Key? key}) : super(key: key);

  @override
  State<HomeChatPage> createState() => _HomeChatPageState();
}

class _HomeChatPageState extends State<HomeChatPage> {
  final int _limit = 20;
  late AuthProvider authProvider;
  late String currentUserId;
  late HomeProvider homeProvider;

  String _textSearch = "";
  Debounce searchDebounce = Debounce(milliseconds: 300);
  TextEditingController searchBarTec = TextEditingController();
  StreamController <bool> btnClearController = StreamController<bool>();

  List<PopupChoices> choices =<PopupChoices>[
    PopupChoices(icon: Icons.settings, title: "Settings"),
    PopupChoices(icon: Icons.exit_to_app, title: "Log out"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // authProvider = context.read<AuthProvider>();
    // homeProvider = context.read<HomeProvider>();
    // if(authProvider.getUserFirebaseId()?.isNotEmpty == true){
    //   currentUserId = authProvider.getUserFirebaseId()!;
    // }else{
    //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginPage()),
    //           (Route<dynamic>route) => false);
    // }
  }

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();

  }

  void onItemMenuPress(PopupChoices choices){
    if(choices.title == "Log out"){
         handleSignOut();
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
    }
  }
   // function to sign out
  Future<void> handleSignOut()async{
    authProvider.handleSignOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>  LoginPage()),
            (Route<dynamic>route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.homeTitle,
          style: TextStyle(color: ColorConstants.primaryColor),
        ),
        centerTitle: true,
        actions: [buildPopupMenu()],
      ),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: homeProvider.getStreamFireStore(
                    FireStoreConstants.pathUserCollection, _limit,_textSearch),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    if ((snapshot.data?.docs.length ?? 0) > 0) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) =>
                            buildItem(context, snapshot.data?.docs[index]),
                        itemCount: snapshot.data?.docs.length,
                      );
                    } else {
                      return const Center(
                        child: Text("No Users"),
                      );
                    }
                  } else {
                    return const CircularProgressIndicator(
                      color: ColorConstants.themeColor,
                    );
                  }
                }),
          )
        ],
      ),
    );
  }


  Widget buildSearchBar(){

    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorConstants.greyColor2
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row( crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.search,color: ColorConstants.greyColor,size: 20,),
          const SizedBox(width: 5,),
          Expanded(child: TextFormField(
            textInputAction: TextInputAction.search,
            controller: searchBarTec,
            onChanged: (value){
              searchDebounce.run(() {
                if(value.isNotEmpty){
                  btnClearController.add(true);
                  setState(() {
                    _textSearch = value;
                  });
                }else{
                  btnClearController.add(false);
                  setState(() {
                    _textSearch = "";
                  });
                }
              });
            },
            decoration: const InputDecoration.collapsed(hintText: "Search for nickname (you have to type it exactly as the same)",
              hintStyle: TextStyle(fontSize: 13,color: ColorConstants.greyColor)
            ),
            style: const TextStyle(fontSize: 13),
          ),),
          StreamBuilder<bool>(
            stream: btnClearController.stream,
              builder: (context,snapshot){
              return snapshot.data == true ? GestureDetector(
                onTap: (){
                  searchBarTec.clear();
                  btnClearController.add(false);
                  setState(() {
                    _textSearch = "";
                  });
                },
                child: const Icon(Icons.clear_rounded,color: ColorConstants.greyColor,size: 20,),
              ): const SizedBox.shrink();
              },
          )
        ],
      ),
    );
  }




  Widget buildPopupMenu(){
    return PopupMenuButton(
      onSelected: onItemMenuPress,
        itemBuilder: (BuildContext context){
        return choices.map((PopupChoices choices) {
            return PopupMenuItem<PopupChoices>(
              value: choices,
                child: Row(
                  children: [
                    Icon(choices.icon,color: ColorConstants.primaryColor,),
                    Container(width: 10,),
                    Text(choices.title,style: const TextStyle(color: ColorConstants.primaryColor),)
                  ],
                )
            );
        }
        ).toList();
        }
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      UserChat userChat = UserChat.fromDocuments(document);
      if (userChat.id == currentUserId) {
        return const SizedBox.shrink();
      } else {
        return Container(
          margin: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
          child: TextButton(
            onPressed: () {},

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.greyColor2),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                )
              )
            ),

            child: Row(
              children: [
                Material(
                  child: userChat.photoUrl.isNotEmpty
                      ? Image.network(
                          userChat.photoUrl,
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: ColorConstants.themeColor,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context,object,stackTrace){
                            return const Icon(Icons.account_circle,size: 50,color: ColorConstants.greyColor,);
                          },
                        )
                      : const Icon(
                          Icons.account_circle,
                          color: ColorConstants.greyColor,
                          size: 50,
                        ),
                ),
                Flexible(child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                        child: Text('Nickname: ${userChat.nickName}',maxLines: 1,style: const TextStyle(color: ColorConstants.primaryColor),),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('About me: ${userChat.aboutMe}',maxLines: 1,style: const TextStyle(color: ColorConstants.primaryColor),),
                      )
                    ],
                  ),
                ),)
              ],
            ),
          ),
        );
      }
    }else {
      return const SizedBox.shrink();
    }
  }
}
