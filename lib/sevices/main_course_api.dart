import 'dart:developer';
import 'package:demo/model/main_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class GetMainCourseService {
  GetMainCourseService._instans();
  static GetMainCourseService instance = GetMainCourseService._instans();
  factory GetMainCourseService() {
    return instance;
  }

  Future<MianCourse?> superAdminLogin(
     context) async {
    try {
      Response response =
          await Dio().get("https://futursity.com/course/api/top_courses");

      if (response.statusCode == 200 ) {
        print("888888888888888888888888888888${response.data}");

        MianCourse responsData =
            MianCourse.fromJson(response.data);
        print("demooooooooooooo$responsData");
     
        print('hello');

        return responsData;
      }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(response.data['message'].toString()),
            backgroundColor: const Color.fromARGB(255, 97, 98, 97)));
      
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
      } else if (e.type == DioErrorType.connectionTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Connection Time out'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97)));
      } else if (e.type == DioErrorType.receiveTimeout) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Timeout Error'),
            backgroundColor: Color.fromARGB(255, 97, 98, 97)));
    
      }
    } catch (e) {
    }
    return null;
  }
}
