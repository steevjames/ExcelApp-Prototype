import 'questions.dart';

class questionsHelper{
  static var questionNum = ["1","2","3","4","5"];
  static var question = ["Identify this virus that shook\n the world in the year 2020","Identify this virus that shook\n the world in the year 2021","Identify this virus that shook\n the world in the year 2022","Identify this virus that shook\n the world in the year 2023","Identify this virus that shook\n the world in the year 2025"];
  static getQuestion(int position) {
    return questions(questionNum[position], question[position]);
  }
}