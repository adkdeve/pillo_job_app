import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:pcom_app/utils/dialogs/internet_connectivity_dialog.dart';
import 'package:pcom_app/utils/dialogs/session_expired.dart';
import 'base_api_services.dart';
import 'dart:io';

class NetworkApiService extends BaseApiServices {
  // var dio = Dio();

  //========== First Flow ==============

  @override
  Future postApiResponse(data, String url) async {  
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        var response = await http.post(Uri.parse(url), body: data).timeout(
              const Duration(seconds: 15),
            );
        if (response.statusCode == 200) {
          // var data = Encryption.instance.decrypt(response.body.toString());
          // print(data);
          return response.body;
        }
      } else {
        internetConnectivityAlterDialog();
        return null;
      }
    } on SocketException {
      throw 'Something went wrong';
    }
  }

  @override
  Future postApiResponseWithToken(data, String url, String token) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        var response =
            await http.post(Uri.parse(url), body: jsonEncode(data), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }).timeout(
          const Duration(seconds: 15),
        );
        // if (response.statusCode == 200) {
        // var data = Encryption.instance.decrypt(response.body.toString());
        // print(data);
        return response.body;
        // }else{

        // }
      } else {
        internetConnectivityAlterDialog();
        return null;
      }
    } on SocketException {
      throw 'Something went wrong';
    }
  }

  //========== Second Flow ==============

  @override
  Future getApiResponseWithToken(String url, token) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        var response = await http.get(Uri.parse(url), headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }).timeout(
          const Duration(seconds: 15),
        );
        // var data = Encryption.instance.decrypt(response.body.toString());
        // print(response.body);
        if (response.statusCode == 401) {
          sectionExpired(jsonDecode(response.body.toString()));
          return null;
        } else {
          return response.body;
        }
      } else {
        internetConnectivityAlterDialog();
        return null;
      }
    } on SocketException {
      throw 'Something went wrong';
    }
  }

//========== Update Profile  ==============

  @override
  Future postApiResponseProfile(data, String url, String token) async {
    try {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult != ConnectivityResult.none) {
        if (data['image'].toString().isEmpty) {
          final finalData = jsonEncode(data);
          var response = await http
              .post(Uri.parse(url),
                  headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'Authorization': 'Bearer $token',
                  },
                  body: finalData)
              .timeout(
                const Duration(seconds: 15),
              );
          if (response.statusCode == 401) {
            sectionExpired(jsonDecode(response.body.toString()));
            return null;
          } else {
            return response.body;
          }
        } else {
          var request = http.MultipartRequest("POST", Uri.parse(url));

          File file = File(data["image"]);
          var length = await file.length();
          var stream = http.ByteStream(file.openRead());
          var multiform =
              http.MultipartFile('image', stream, length, filename: file.path);

          request.files.add(multiform);
          request.headers.addAll({
            "Content-type": "application/json",
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          });
          request.fields.addAll({
            "username": data['username'],
            'city': data['city'],
            'country': data['country'],
            'bio': data['bio']
          });

          var response = await request.send();
           if (response.statusCode == 401) {
            sectionExpired(jsonDecode(await response.stream.bytesToString()));
            return null;
          } else {
            // print(await response.stream.bytesToString());
            return await response.stream.bytesToString();
          }
        }
      } else {
        internetConnectivityAlterDialog();
        return null;
      }
    } on SocketException {
      throw 'Something went wrong';
    }
  }

  await(Future<ConnectivityResult> checkConnectivity) {}
}
