import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Asiatic360/utils/mainappbar.dart';
import 'package:Asiatic360/dashboard/hr/salary/newsalarycertificate.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(SalaryCertificate());
}

class SalaryCertificate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salary Certificate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySalaryCertificate(title: 'Salary Certificate'),
    );
  }
}

class MySalaryCertificate extends StatefulWidget {
  MySalaryCertificate({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySalaryCertificateState createState() => _MySalaryCertificateState();
}

class _MySalaryCertificateState extends State<MySalaryCertificate> {
  List leaveRequest = [
    {'date': '12/01/2020', 'status': 'pending'},
    {'date': '12/10/2019', 'status': 'approved'},
    {'date': '08/05/2019', 'status': 'approved'},
    {'date': '12/03/2019', 'status': 'approved'},
    {'date': '06/03/2019', 'status': 'approved'},
    {'date': '08/02/2019', 'status': 'approved'},
    {'date': '11/12/2018', 'status': 'approved'},
    {'date': '10/10/2018', 'status': 'rejected'},
    {'date': '09/09/2018', 'status': 'approved'},
    {'date': '09/07/2018', 'status': 'approved'},
    {'date': '08/06/2018', 'status': 'rejected'},
    {'date': '07/04/2018', 'status': 'approved'},
    {'date': '08/03/2018', 'status': 'approved'},
    {'date': '07/01/2018', 'status': 'approved'}
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    return Scaffold(
      appBar: PreferredSize(
        child: MainAppBar(title: widget.title, back: "salarycertificate"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (itemWidth / itemHeight),
          padding: EdgeInsets.all(4.0),
          children: <Widget>[
            ListView.builder(
              padding: EdgeInsets.all(0.0),
              itemCount: leaveRequest.length,
              itemBuilder: (BuildContext context, int index) {
                return makeDashboardItem(leaveRequest[index]['date'],
                    leaveRequest[index]['status'], media);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Request"),
        onPressed: () {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewSalaryCertificate()));
        },
        icon: Icon(
          Icons.add,
        ),
        foregroundColor: UniversalVariables.white,
        backgroundColor: UniversalVariables.green,
      ),
    );
  }

  Card makeDashboardItem(String date, String status, Size media) {
    return Card(
      elevation: 1.0,
      margin: EdgeInsets.only(
          left: media.width * 0.02,
          top: media.height * 0.0075,
          right: media.width * 0.02,
          bottom: media.height * 0.0075),
      child: Container(
        height: media.height * 0.052,
        decoration: BoxDecoration(
          color: UniversalVariables.white,
          border: Border.all(color: getColor(status), width: 1.25),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
              color: UniversalVariables.greyShadow,
              blurRadius: 4.0,
              spreadRadius: 4.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  left: media.width * 0.02,
                  top: media.height * 0.0,
                  right: media.width * 0.02,
                  bottom: media.height * 0.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          date,
                          style: TextStyle(
                            color: getColor(status),
                            fontSize: media.width * 0.04,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          status,
                          style: TextStyle(
                            color: getColor(status),
                            fontSize: media.width * 0.04,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/images/download.png',
                          width: media.width * 0.125,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getColor(status) {
    if (status == "pending") {
      return UniversalVariables.yellow;
    } else if (status == "approved") {
      return UniversalVariables.green;
    } else {
      return UniversalVariables.red;
    }
  }
}
