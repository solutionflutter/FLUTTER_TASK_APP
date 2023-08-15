import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiDataCollectionForZone {
  static List<String> project = [];
  static List<String> pfrList = [];
  static List<String> pRrList = [];
  static List<String> cfrList = [];
  static List<String> cRrList = [];
  static List<dynamic> dropdown = [];
  static double pfrtotla = 0;
  static double pRrtotal = 0;
  static double cfrtotla = 0;
  static double cRrtotal = 0;
  static Future<void> getData(String id) async {
    var response = await http.get(
        Uri.parse("https://enorsia.nextgenitltd.com/api/data-details/${id}"),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    Map<String, dynamic> data = jsonDecode(response.body);
    print(dropdown.length);
    List<dynamic> dataProject = jsonDecode(response.body)["business"];
    //print(dataProject);
    dataProject.forEach((e) {
      if (project.contains(e["project"]) == false) {
        project.add(e["project"]);
      }
    });

    print(project);

    project.forEach((u) {
      dataProject.forEach((re) {
        if (re["project"] == u &&
            (re["type"] == "FR" || re["type"] == "RR") &&
            re["year_category"] == "PREVIOUS_YEAR") {
          if (re["type"] == "FR") {
            pfrList.add(re["total_premium_paid_in_lacs"]);
            pfrtotla =
                pfrtotla + double.parse(re["total_premium_paid_in_lacs"]);
          } else if (re["type"] == "RR") {
            pRrList.add(re["total_premium_paid_in_lacs"]);
            pRrtotal =
                pRrtotal + double.parse(re["total_premium_paid_in_lacs"]);
          }
        } else if (re["project"] == u &&
            (re["type"] == "FR" || re["type"] == "RR") &&
            re["year_category"] == "CURRENT_YEAR") {
          if (re["type"] == "FR") {
            cfrList.add(re["total_premium_paid_in_lacs"]);
            cfrtotla =
                cfrtotla + double.parse(re["total_premium_paid_in_lacs"]);
          } else if (re["type"] == "RR") {
            cRrList.add(re["total_premium_paid_in_lacs"]);
            cRrtotal =
                cRrtotal + double.parse(re["total_premium_paid_in_lacs"]);
          }
        }
      });
    });
    print(pfrList);
    print(pRrList);
    print(cfrList);
    print(cRrList);
    print(cRrtotal);
    print(cfrtotla);
    print(pRrtotal);
    print(pfrtotla);
  }
}
