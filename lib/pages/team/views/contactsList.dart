import 'package:flutter/material.dart';
import 'package:project_management/models/user.dart';
import 'package:project_management/themes/textStyles.dart';

class ContactsList extends StatelessWidget {
  void Function()? onTapItem;
  ContactsList({this.onTapItem});
  final List<User> users = [
    User(
        id: '',
        name: 'User 1',
        avatarUrl:
            'https://cdn3.iconfinder.com/data/icons/3d-printing-icon-set/512/User.png',
        lastActive: DateTime.now(),
        email: ""),
    User(
        id: '',
        name: 'User 2',
        avatarUrl:
            'https://i.pinimg.com/736x/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg',
        lastActive: DateTime.now(),
        email: ""),
    // Add more users
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 20, right: 20, bottom: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chats',
                        style: TextStyles.boldTitles.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer), //color: Theme.of(context)
                      )
                    ]),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return UserListItem(
                  user: user,
                  onTap: onTapItem,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserListItem extends StatefulWidget {
  final User user;
  void Function()? onTap;
  UserListItem({required this.user, this.onTap});

  @override
  _UserListItemState createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: isHovered ? Colors.lightBlue : Colors.transparent,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  widget.user.avatarUrl ?? 'https://picsum.photos/250?image=9'),
            ),
            title: Text(widget.user.name),
            subtitle: Text('Last Active: ${widget.user.lastActive}'),
            trailing: Text('Right Bottom Text'),
          ),
        ),
      ),
    );
  }
}
