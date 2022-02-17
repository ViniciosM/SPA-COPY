import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:spa/models/coordinator.dart';
import 'package:spa/stores/coordinator_store.dart';

class PopUp extends StatelessWidget {
  const PopUp(
      {Key? key,
      required this.title,
      required this.success,
      required this.coordinatorStore})
      : super(key: key);

  final String title;
  final bool success;
  final CoordinatorStore coordinatorStore;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return success
        ? Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: const Icon(
                        Icons.check,
                        size: 60,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      child: SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Observer(builder: (_) {
                                return ElevatedButton(
                                  //color: Colors.white,
                                  child: const Text('OK'),
                                  onPressed: () => {
                                    coordinatorStore.setShowSaveMessage(false),
                                    Navigator.of(context).pop()
                                  },
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white70,
                      child: const Icon(
                        Icons.account_balance_wallet,
                        size: 60,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.redAccent,
                      child: SizedBox.expand(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              ElevatedButton(
                                //color: Colors.white,
                                child: const Text('OK'),
                                onPressed: () => {Navigator.of(context).pop()},
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
