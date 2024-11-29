import 'dart:io';
import 'package:food_delivery/controllers/database_controllers/exception_handler.dart';
import 'package:http/http.dart' as http;

abstract class BackendHandler {
  Future<dynamic> getData(String uri);
  Future<dynamic> postData(String uri);
}

class ApiHandler extends BackendHandler {
  @override
  Future getData(String uri) async {
    var data;
    try {
      final alldata = await http.get(Uri.parse(uri));
      data = generateResponse(alldata);
    } catch (e) {
      print(e.toString());
      if (e is SocketException) {
        throw NointernetException(e.toString());
      }
    }
    return data;
  }

  @override
  Future postData(String uri) {
    throw UnimplementedError();
  }
}

// abstract class Allapifun {
//   Future<dynamic> getdata(String uri);
// }

// class CallData extends Allapifun {
//   @override
//   Future getdata(String uri) async {
//     var data;
//     try {
//       final alldata = await http.get(Uri.parse(uri));
//       data = generateResponse(alldata.statusCode, alldata.body);
//     } catch (e) {
//       print(e.toString());
//       if (e is SocketException) {
//         throw NointernetException(e.toString());
//       }
//     }
//     return data;
//   }
// }
// "Your device is not connected with internet."