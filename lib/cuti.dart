import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State {
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Person selectedPerson;
  List<Person> persons = [
    Person("Atasan 1"),
    Person("Atasan 2"),
    Person("Atasan 3")
  ];

  List<DropdownMenuItem> generateItems(List<Person> persons) {
    List<DropdownMenuItem> items = [];
    for (var item in persons) {
      items.add(DropdownMenuItem(
        child: Text(item.name),
        value: item,
      ));
    }
    return items;
  }

  TextEditingController controllerNama_Karyawan = new TextEditingController();
  TextEditingController controllerTanggal_Cuti = new TextEditingController();
  TextEditingController controllerKeterangan_Cuti = new TextEditingController();
  TextEditingController controllerApproval_Atasan = new TextEditingController();

  void addData() {
    var url = "http://10.0.2.2/form_cuti/adddata.php";

    http.post(url, body: {
      "nama_karyawan": controllerNama_Karyawan.text,
      "tanggal_cuti": controllerTanggal_Cuti,
      "keterangan_cuti": controllerKeterangan_Cuti,
      "approval_atasan": controllerApproval_Atasan,
    });
  }

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
                      height: MediaQuery.of(context).size.height * 3 / 9,
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
                                "Form Pengajuan Cuti Tahunan",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Isi Form di bawah ini",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
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
                              height: MediaQuery.of(context).size.height / 5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Column(children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                child: Text(
                  "Nama Karyawan ",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controllerNama_Karyawan,
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  validator: (val) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      hintText: 'Masukkan Nama Karyawan'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                child: Text(
                  "Tanggal Cuti",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                        SizedBox(
                          width: 175.0,
                        ),
                        RaisedButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          child: Text("Pilih Tanggal"),
                        ),
                      ])),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                child: Text(
                  "Keterangan Cuti",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: TextFormField(
                  controller: controllerKeterangan_Cuti,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  validator: (val) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
                      hintText: 'Masukkan Keterangan Cuti'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                child: Text(
                  "Lampirkan Bukti",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('nama file tampil disini'),
                        SizedBox(
                          width: 130.0,
                        ),
                        RaisedButton(
                          onPressed: () {},
                          child: Text("Pilih File"),
                        ),
                      ])),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                child: Text(
                  "Approval Atasan",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black)),
                child: DropdownButton(
                  isExpanded: true,
                  value: selectedPerson,
                  items: generateItems(persons),
                  onChanged: (item) {
                    setState(() {
                      selectedPerson = item;
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 180,
                  margin: EdgeInsets.only(top: 30),
                  height: 45,
                  padding: EdgeInsets.symmetric(),
                  child: RaisedButton(
                    onPressed: () {
                      addData();
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kirim",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(height: 30)
          ],
        ));
  }
}

class Person {
  String name;
  Person(this.name);
}
