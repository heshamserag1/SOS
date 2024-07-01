// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:untitled/shared/componente.dart';

class p_dhelp extends StatelessWidget {
  const p_dhelp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Column(
            children: [
              Text(
                "who are we!!",
                style: TextStyle(
                    color: defultColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  """Of course! Here are some instructions for using an app that provides the service of finding the nearest doctor or medical assistant:

1. Download the app: Go to the app store on your smartphone and search for an app that offers the service of finding the nearest doctor or medical assistant. Download the app and install it on your phone.

2. Log in or create an account: After installing the app, you may be prompted to log in if you already have an account. If you don't have an account, you will need to create a new one.

3. Set your location: Once logged in, you may be asked to set your current location to determine the nearest doctors or medical assistants.

4. Choose the service: Select the type of service you need, whether it's general treatment, online medical consultation, or other medical services.

5. Select the doctor or medical assistant: After choosing the service, a list of available doctors or medical assistants in your area will appear. Choose the appropriate and closest person to you.

6. Book an appointment: After selecting the doctor or medical assistant, you can book an appointment to visit them or for an online consultation.

7. Receive the service: Go to the designated location at the scheduled appointment time and receive the desired service.

These are the basic instructions for using an app that provides the service of finding the nearest doctor or medical assistant. It is always recommended to read the app's user guide for detailed instructions on how to use it correctly.""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
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
