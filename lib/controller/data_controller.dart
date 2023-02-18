import 'package:flutter/cupertino.dart';

import '../model/main_model.dart';
import '../sevices/main_course_api.dart';

class DataController extends  ChangeNotifier{
 MianCourse? mainData;
//  bool loader= false;
  getMainData(context)async{
 MianCourse? response= await  GetMainCourseService.instance.superAdminLogin(context);
mainData= response;
  }

}