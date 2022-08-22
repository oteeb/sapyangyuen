import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class loadingHome extends StatefulWidget {
  const loadingHome({Key? key}) : super(key: key);

  @override
  State<loadingHome> createState() => _loadingHomeState();
}

class _loadingHomeState extends State<loadingHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 197, 197, 197),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 15,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Expanded(
                        child: Container(
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                        width: 380,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                      ),
                   ),
                    Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                        width: 380,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                      ),
                   ),
                    Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                        width: 380,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                      ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                        width: 380,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                      ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                        width: 380,
                        height: 15,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                      ),
                   ),
                  
                  SizedBox(
                    height: 10,
                  ),
                   Container(
                      height: 320,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0)),
                          ),
                    ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 150,
                      height: 15,
                      decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.05),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16)),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
