import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  String title;
  String? description;
  ProjectCard({required this.title, this.description});
  @override
  Widget build(BuildContext context) {
    List<String> txtToList = title.split(" ");
    String avatarLetter = txtToList.length > 1
        ? "${txtToList[0][0]}${txtToList[1][0]}"
        : "${txtToList[0][0]}";

    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 16),
            child: Row(children: [
              Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(avatarLetter,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                )),
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium)
                    ]),
              ),
            ]),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => print("hi"),
              child: Icon(Icons.remove_red_eye_outlined,
                  size: 14, color: Theme.of(context).colorScheme.secondary),
            ),
          )
        ],
      ),
    );
  }
}
