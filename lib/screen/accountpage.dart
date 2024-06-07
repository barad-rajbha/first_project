import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uireprika/controller/controller.dart';

import '../firebase_helper/helper.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Profile !!',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.green.shade900.withOpacity(0.7),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15),
                child: Container(
                  width: double.infinity,
                  height: 835,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 25, right: 30, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profile Photo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                                              providerdata.galleryimg();
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
                        const Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                        const Text(
                          'Number',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.number,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: 'Enter your verify number...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Address',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.address,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_on_outlined),
                            hintText: 'Enter your address...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'City',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.city,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            hintText: 'Enter your city name...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'State',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextField(
                          controller: providerdata.state,
                          keyboardType: TextInputType.streetAddress,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.real_estate_agent_outlined),
                            hintText: 'Enter your state...',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.amber),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            FireStoreData.fireStoreData.addData(
                                providerdata.name.text.toString(),
                                providerdata.number.text.toString(),
                                providerdata.email.text.toString(),
                                providerdata.address.text.toString(),
                                providerdata.city.text.toString(),
                                providerdata.state.text.toString());
                            providerdata.name.clear();
                            providerdata.number.clear();
                            providerdata.email.clear();
                            providerdata.address.clear();
                            providerdata.city.clear();
                            providerdata.state.clear();
                            providerdata.picImage == null;
                            Navigator.of(context).pushReplacementNamed('/');
                          },
                          child: Container(
                            height: 65,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Center(
                              child: Text(
                                'Done',
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
