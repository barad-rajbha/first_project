import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    UserData providerdata = Provider.of<UserData>(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('asset/img/bg.jpeg'),
        ),
      ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Profile !!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        const Text('Profile Photo'),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                width: double.infinity,
                                height: 220,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              providerdata.picImage;
                                            },
                                            child: CircleAvatar(
                                              radius: 30,
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.5),
                                              child: const Icon(Icons.photo,
                                                  size: 30),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          const Text(
                                            'Choice photo from gallery',
                                            style: TextStyle(fontSize: 17),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              providerdata.cameraimg();
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.5),
                                              radius: 30,
                                              child: const Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 30),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          const Text(
                                            'Click photo',
                                            style: TextStyle(fontSize: 17),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (providerdata.picImage == null)
                                  ? const CircleAvatar(
                                      radius: 70,
                                      child: Icon(Icons.person, size: 80),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          FileImage(providerdata.picImage!),
                                    ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Name'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.name,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            hintText: 'Enter your full name...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Email'),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Enter your email...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('otp');
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
