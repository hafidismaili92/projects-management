import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:project_management/shared_components/appLoader.dart';
import 'package:project_management/themes/buttonsStyle.dart';

class NewProjectView extends StatefulWidget {
  const NewProjectView({Key? key}) : super(key: key);

  @override
  State<NewProjectView> createState() => _NewProjectViewState();
}

class _NewProjectViewState extends State<NewProjectView> {
  final _formKey = GlobalKey<FormState>();
  String planTitle = "";
  String planDescription = "";
  bool isLoading = false;
  void addPlan() {
    if (_formKey.currentState!.validate()) {
      print('$planTitle // $planDescription');
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Plan",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                        TextButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.close),
                            label: Text("")),
                      ],
                    )),
                Expanded(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(children: [
                            TextFormField(
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(500),
                              ]),
                              onChanged: (value) {
                                planTitle = value;
                              },
                              decoration: InputDecoration(
                                  hintText: "your plan title here"),
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              minLines: 3,
                              maxLines: 5,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(1000),
                              ]),
                              onChanged: (value) {
                                planDescription = value;
                              },
                              decoration:
                                  InputDecoration(hintText: "Description"),
                            ),
                            SizedBox(height: 40),
                            Container(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: isLoading ? null : addPlan,
                                child: Text('Add plan'),
                                style: ButtonsStyles.elevatedRoundedStyle,
                              ),
                            ),
                            Expanded(
                                child: Center(
                                    child:
                                        isLoading ? AppLoader() : Container()))
                          ]),
                        ))),
              ],
            ),
          ),
        ));
  }
}
