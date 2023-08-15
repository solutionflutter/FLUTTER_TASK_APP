import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskapp/Controller/apiDataCollection.dart';
import 'package:taskapp/Controller/apiDataCollectionForZone.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPrevious = false;
  bool isCurrent = false;
  bool isZonePrevious = false;
  bool isZoneCurrent = false;
  bool isDrooDown = false;
  String select = "Select Zone";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1), () async {
      await ApiDataCollection.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Header section
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 37, 128, 1),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(45)),
              ),
              child: Column(
                children: [
                  //Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 15),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "NEXTGEN INNOVATION",
                            style: GoogleFonts.dmSans(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 14),
                    child: Row(
                      children: [
                        Image.asset(
                          "images/Patreon.png",
                          fit: BoxFit.contain,
                          cacheHeight: 50,
                          cacheWidth: 50,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: RichText(
                                text: TextSpan(
                                  text: "Welcome \n",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    color: Color.fromRGBO(245, 245, 245, 1),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Muntasir Efaz \n",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(245, 245, 245, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Area Head, Employee ID:30024\n",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        color: Color.fromRGBO(245, 245, 245, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 65, right: 20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 445,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //Top Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (isCurrent == false) {
                          setState(() {
                            isCurrent = true;
                            isPrevious = false;
                          });
                        } else {
                          setState(() {
                            isCurrent = false;
                          });
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: isCurrent == true
                                    ? Color.fromRGBO(63, 39, 180, 1)
                                    : Color.fromRGBO(245, 245, 245, 1),
                                width: 2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Current Year",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isCurrent == true
                                  ? Color.fromRGBO(63, 39, 180, 1)
                                  : Color.fromRGBO(44, 40, 62, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (isPrevious == false) {
                          setState(() {
                            isPrevious = true;
                            isCurrent = false;
                          });
                        } else {
                          setState(() {
                            isPrevious = false;
                          });
                        }
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: isPrevious == true
                                    ? Color.fromRGBO(63, 39, 180, 1)
                                    : Color.fromRGBO(245, 245, 245, 1),
                                width: 2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Previous Year",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isPrevious == true
                                  ? Color.fromRGBO(63, 39, 180, 1)
                                  : Color.fromRGBO(44, 40, 62, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Table Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 37, 128, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "  Project           First Year           Renewal",
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(245, 245, 245, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: ApiDataCollection.project.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(234, 233, 240, 1),
                                      width: 1),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  isCurrent == true
                                      ? "  ${ApiDataCollection.project[index]}           ${ApiDataCollection.cfrList[index]}           ${ApiDataCollection.cRrList[index]}"
                                      : "  ${ApiDataCollection.project[index]}           ${ApiDataCollection.pfrList[index]}           ${ApiDataCollection.pRrList[index]}",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(67, 62, 91, 1),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  Total",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                            ),
                            Text(
                              isCurrent == true
                                  ? "          ${ApiDataCollection.cfrtotla}           ${ApiDataCollection.cRrtotal}"
                                  : "          ${ApiDataCollection.pfrtotla}           ${ApiDataCollection.pRrtotal}",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //DropDown
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      if (isDrooDown == false) {
                        setState(() {
                          isDrooDown = true;
                        });
                      } else {
                        setState(() {
                          isDrooDown = false;
                        });
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height / 25,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${select}",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 37, 128, 1),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 25,
                              width: MediaQuery.of(context).size.width / 25,
                              child: ImageIcon(
                                AssetImage("images/Vector 1.png"),
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  isDrooDown == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 6,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(217, 217, 217, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: ApiDataCollection.dropdown.length,
                              itemBuilder: (context, index) {
                                return TextButton(
                                  onPressed: () async {
                                    setState(() {
                                      ApiDataCollectionForZone.cRrList = [];
                                      ApiDataCollectionForZone.cfrList = [];
                                      ApiDataCollectionForZone.pRrList = [];
                                      ApiDataCollectionForZone.pfrList = [];
                                      ApiDataCollectionForZone.project = [];
                                      ApiDataCollectionForZone.pfrtotla = 0;
                                      ApiDataCollectionForZone.pRrtotal = 0;
                                      ApiDataCollectionForZone.cfrtotla = 0;
                                      ApiDataCollectionForZone.cRrtotal = 0;
                                    });
                                    await ApiDataCollectionForZone.getData(
                                        ApiDataCollection.dropdown[index]
                                            ["zb_code"]);
                                    setState(() {
                                      select = ApiDataCollection.dropdown[index]
                                          ["zb_name"];
                                      isDrooDown = false;
                                    });
                                  },
                                  child: Text(
                                    "${ApiDataCollection.dropdown[index]["zb_name"]}",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.dmSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(0, 37, 128, 1),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox(
                          width: 1,
                        ),
                ],
              ),
            ),
          ),

          //Top Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: ApiDataCollectionForZone.cRrtotal == 0
                          ? null
                          : ApiDataCollectionForZone.cfrtotla == 0
                              ? null
                              : () {
                                  if (isZoneCurrent == false) {
                                    setState(() {
                                      isZoneCurrent = true;
                                      isZonePrevious = false;
                                    });
                                  } else {
                                    setState(() {
                                      isZoneCurrent = false;
                                    });
                                  }
                                },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: isZoneCurrent == true
                                    ? Color.fromRGBO(63, 39, 180, 1)
                                    : Color.fromRGBO(245, 245, 245, 1),
                                width: 2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Current Year",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isZoneCurrent == true
                                  ? Color.fromRGBO(63, 39, 180, 1)
                                  : Color.fromRGBO(44, 40, 62, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: ApiDataCollectionForZone.pRrtotal == 0
                          ? null
                          : ApiDataCollectionForZone.pfrtotla == 0
                              ? null
                              : () {
                                  if (isZonePrevious == false) {
                                    setState(() {
                                      isZonePrevious = true;
                                      isZoneCurrent = false;
                                    });
                                  } else {
                                    setState(() {
                                      isZonePrevious = false;
                                    });
                                  }
                                },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: isZonePrevious == true
                                    ? Color.fromRGBO(63, 39, 180, 1)
                                    : Color.fromRGBO(245, 245, 245, 1),
                                width: 2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Previous Year",
                            style: GoogleFonts.dmSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: isZonePrevious == true
                                  ? Color.fromRGBO(63, 39, 180, 1)
                                  : Color.fromRGBO(44, 40, 62, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Table of Containe
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 245, 245, 1),
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 37, 128, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "  Project           First Year           Renewal",
                          style: GoogleFonts.dmSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(245, 245, 245, 1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 1,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: ApiDataCollectionForZone.project.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height / 20,
                              width: MediaQuery.of(context).size.width / 1,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(234, 233, 240, 1),
                                      width: 1),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  isZoneCurrent == true
                                      ? "  ${ApiDataCollectionForZone.project[index]}           ${ApiDataCollectionForZone.cfrList[index]}           ${ApiDataCollectionForZone.cRrList[index]}"
                                      : "  ${ApiDataCollectionForZone.project[index]}           ${ApiDataCollectionForZone.pfrList[index]}           ${ApiDataCollectionForZone.pRrList[index]}",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(67, 62, 91, 1),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(245, 245, 245, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "  Total",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(33, 150, 243, 1),
                              ),
                            ),
                            Text(
                              isZoneCurrent == true
                                  ? "          ${ApiDataCollectionForZone.cfrtotla.ceil()}           ${ApiDataCollectionForZone.cRrtotal.ceil()}"
                                  : "          ${ApiDataCollectionForZone.pfrtotla.ceil()}           ${ApiDataCollectionForZone.pRrtotal.ceil()}",
                              style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
