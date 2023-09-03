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
            builder: (context) => Container(
                child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Theme.of(context).colorScheme.onPrimary)),
                        icon: Icon(Icons.arrow_back_ios_sharp, size: 24),
                        onPressed: () => Navigator.pop(context),
                        label: Text('Back'),
                      ),
                    )),
                Expanded(
                    child: Container(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        child: ConversationView())),
              ],
            )),
            fullscreenDialog: true,
          ),
        );
      },
    ));
  }
}
