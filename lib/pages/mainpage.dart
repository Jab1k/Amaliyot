import 'package:flutter/material.dart';
import 'package:flutter_application_5/pages/fakepage.dart';
import 'package:flutter_application_5/store/flags.dart';

import '../repasitory/infoget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  List flag = [];
  GetInformationRepository api = GetInformationRepository();
  bool isLoading = false;
  Future<void> getInformation() async {
    isLoading = true;
    setState(() {});
    data = await api.getInformation();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD3F3FF),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32)),
                        color: Colors.white),
                    child: ListView.builder(
                      itemCount: data.length - 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return MyWidget(
                                    data: data[index],
                                    flag: returnFlag(index),
                                  );
                                }));
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            returnFlag(index),
                                          ),
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(12),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      data[index].code ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      data[index].title ?? '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: SizedBox(
                                width: double.infinity,
                                child: Divider(),
                              ),
                            ),
                            const SizedBox(height: 10)
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
