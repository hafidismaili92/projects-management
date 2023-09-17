import 'package:flutter/material.dart';
import 'package:project_management/pages/team/views/contactsList.dart';
import 'package:project_management/pages/team/views/conversation.dart';

class SmallChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: ContactsList(
      onTapItem: () {
        print('gjhgjh');
        /*showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => ConversationView(),
        );*/
        Navigator.push<void>(
          context,
          MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(
                elevation: 20,
                automaticallyImplyLeading: false,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_sharp, // add custom icons also
                  ),
                ),
              ),
              body: Container(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: ConversationView(),
                  )),
            ),
            fullscreenDialog: true,
          ),
        );
      },
    ));
  }
}
