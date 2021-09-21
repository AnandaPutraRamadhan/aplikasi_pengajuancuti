import 'package:aplikasi_pengajuancuti/cuti.dart';
import 'package:flutter/material.dart';

class MenuAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          )),
                      height: MediaQuery.of(context).size.height * 3 / 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Pengajuan Cuti Tahunan",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Selalu Sehat dan Semangat dalam Bekerja",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 0),
                            child: Image.asset(
                              'assets/images/absen.png',
                              height: MediaQuery.of(context).size.height / 4,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(
                                padding: EdgeInsets.all(25),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[400].withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 15,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                    child: ListView(children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Klik Cuti untuk melanjutkan",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(top: 40),
                                          height: 45,
                                          padding: EdgeInsets.symmetric(),
                                          child: RaisedButton(
                                            onPressed: () {
                                              Route route = MaterialPageRoute(
                                                  builder: (context) => Home());
                                              Navigator.push(context, route);
                                            },
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: Colors.green)),
                                            color: Colors.white,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.input_rounded,
                                                    color: Colors.green,
                                                    size: 20),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Cuti",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Colors.green,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ]))))
                      ],
                    )
                  ],
                )),
            SizedBox(height: 30)
          ],
        ));
  }
}
