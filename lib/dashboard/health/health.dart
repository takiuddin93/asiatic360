import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:Asiatic360/widgets/custom_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Asiatic360/dashboard/health/medical/medicalallowance.dart';
import 'package:Asiatic360/dashboard/health/blood/blooddonation.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Health());
}

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHealth(title: 'Health'),
    );
  }
}

class MyHealth extends StatefulWidget {
  MyHealth({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHealthState createState() => _MyHealthState();
}

class _MyHealthState extends State<MyHealth> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "health"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem(1, "Medical Allowance", Icons.book, media),
            makeDashboardItem(2, "Blood Donation", Icons.book, media),
            makeDashboardItem(3, "BMI", Icons.book, media),
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(int i, String title, IconData icon, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
          left: media.width * 0.02,
          top: media.height * 0.01,
          right: media.width * 0.02,
          bottom: media.width * 0.01),
      child: Container(
        decoration: BoxDecoration(color: UniversalVariables.white),
        child: new InkWell(
          onTap: () {
            switch (i.toString()) {
              case "1":
                {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MedicalAllowance()));
                }
                break;
              case "2":
                {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => BloodDonation()));
                }
                break;
              case "3":
                {
                  CustomDialog.showScaleAlertBox(
                      context: context,
                      title: 'Work in Progress',
                      icon: Icons.info_outline, // IF YOU WANT TO ADD ICON
                      color: UniversalVariables.primaryCrimson,
                      text:
                          'This feature has not been implemented yet!', // IF YOU WANT TO ADD
                      firstButton: '',
                      secondButton: 'Back');
                }
                break;
              default:
                {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Health()));
                }
                break;
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: media.height * 0.025),
              Icon(
                icon,
                size: 32.0,
                color: UniversalVariables.green,
              ),
              Text(title,
                  style: TextStyle(
                    color: UniversalVariables.black,
                    fontSize: media.width * 0.04,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
