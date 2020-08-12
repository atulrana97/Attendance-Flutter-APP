import 'package:auto_size_text/auto_size_text.dart';
import 'package:companyattendanceapp/Components/Config.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: SizeConfig.safeBlockVertical,
                width: SizeConfig.safeBlockHorizontal,
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            "Personal Info",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            height: SizeConfig.safeBlockVertical,
                            width: SizeConfig.safeBlockHorizontal,
                            child: Material(
                              elevation: 14.0,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Color(0x802196F3),
                              color: Colors.lightBlueAccent.withOpacity(0.5),
                              child: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Edit Profile'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'Your Name',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                          ),
                          subtitle: Text(
                            'Atul Rana',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.business,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'Buisness',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                          ),
                          subtitle: Text(
                            'Kingdom Foods',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            leading: Container(
                                height: SizeConfig.safeBlockVertical,
                                width: SizeConfig.safeBlockHorizontal,
                                child: Material(
                                  elevation: 14.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Color(0x802196F3),
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )),
                            title: Text(
                              'Phone Number',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15),
                            ),
                            subtitle: Text(
                              '+91-8527367484',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(1),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
            child: Container(
                height: SizeConfig.safeBlockVertical,
                width: SizeConfig.safeBlockHorizontal,
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(
                            "Setting",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            height: SizeConfig.safeBlockVertical,
                            width: SizeConfig.safeBlockHorizontal,
                            child: Material(
                              elevation: 14.0,
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Color(0x802196F3),
                              color: Colors.lightBlueAccent.withOpacity(0.5),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.perm_contact_calendar,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'Monthly Calculation',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                          ),
                          subtitle: Text(
                            'Calendar Calculation',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                        ),
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'Security Password',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            'Password Not Activated',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            leading: Container(
                                height: SizeConfig.safeBlockVertical,
                                width: SizeConfig.safeBlockHorizontal,
                                child: Material(
                                  elevation: 14.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Color(0x802196F3),
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.business_center,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )),
                            title: Text(
                              'Change Buiness',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(1),
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              '1 Active Buiness',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
            child: Container(
                height: SizeConfig.safeBlockVertical,
                width: SizeConfig.safeBlockHorizontal,
                child: Material(
                    color: Colors.white,
                    elevation: 14.0,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0x802196F3),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'Share App',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                          subtitle: AutoSizeText(
                            'Tell your buisness friends about this app',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                            maxLines: 2,
                          ),
                          trailing: Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/newattendanceapp-7106c.appspot.com/o/whatsapptransparent.png?alt=media&token=313a1bca-1b4e-4f47-aacb-8deefe94b36e'),
                        ),
                        ListTile(
                          leading: Container(
                              height: SizeConfig.safeBlockVertical,
                              width: SizeConfig.safeBlockHorizontal,
                              child: Material(
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                color: Colors.lightBlueAccent.withOpacity(0.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.message,
                                    color: Colors.blue,
                                  ),
                                ),
                              )),
                          title: Text(
                            'FAQs',
                            style: TextStyle(
                                color: Colors.black.withOpacity(1),
                                fontSize: 20),
                          ),
                          subtitle: Text(
                            'Learn How to use this app',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ListTile(
                            leading: Container(
                                height: SizeConfig.safeBlockVertical,
                                width: SizeConfig.safeBlockHorizontal,
                                child: Material(
                                  elevation: 14.0,
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Color(0x802196F3),
                                  color:
                                      Colors.lightBlueAccent.withOpacity(0.5),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.exit_to_app,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )),
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(1),
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ))),
          )
        ],
      ),
    );
  }
}
