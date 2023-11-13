


import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  QuestionPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.timeSeconds,
      required this.questionCount,
      this.questions});

  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        timeSeconds = json['time_seconds'],
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();
  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questionCount = json['question_count'] as int,
        questions = [];

  String timeInMinits() => "${(timeSeconds / 60).ceil()} mins";
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["title"] = this.title;
    data["image_url"] = this.imageUrl;
    data["Description"] = this.description;
    data["time_seconds"] = this.timeSeconds;
    if (this.questions != null) {
      data["questions"] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}

// import 'dart:convert';

// QuestionPaperModel questionPaperModelFromJson(String str) =>
//     QuestionPaperModel.fromJson(json.decode(str));

// String questionPaperModelToJson(QuestionPaperModel data) =>
//     json.encode(data.toJson());

// class QuestionPaperModel {
//   final String id;
//   final String title;
//   final String? imageUrl;
//   final String description;
//   final int timeSeconds;
//   final List<Question>? questions;

//   QuestionPaperModel({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.description,
//     required this.timeSeconds,
//     required this.questions,
//   });

//   factory QuestionPaperModel.fromJson(Map<String, dynamic> json) =>
//       QuestionPaperModel(
//         id: json["id"],
//         title: json["title"],
//         imageUrl: json["image_url"],
//         description: json["Description"],
//         timeSeconds: json["time_seconds"],
//         questions: List<Question>.from(
//             json["questions"].map((x) => Question.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image_url": imageUrl,
//         "Description": description,
//         "time_seconds": timeSeconds,
//         "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
//       };
// }

// class Question {
//   final String id;
//   final String question;
//   final List<Answer> answers;
//   final CorrectAnswer correctAnswer;

//   Question({
//     required this.id,
//     required this.question,
//     required this.answers,
//     required this.correctAnswer,
//   });

//   factory Question.fromJson(Map<String, dynamic> json) => Question(
//         id: json["id"],
//         question: json["question"],
//         answers:
//             List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
//         correctAnswer: correctAnswerValues.map[json["correct_answer"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "question": question,
//         "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
//         "correct_answer": correctAnswerValues.reverse[correctAnswer],
//       };
// }

// class Answer {
//   final CorrectAnswer identifier;
//   final String answer;
 
//   Answer({
//     required this.identifier,
//     required this.answer,
//   });

//   factory Answer.fromJson(Map<String, dynamic> json) => Answer(
//         identifier: correctAnswerValues.map[json["identifier"]]!,
//         answer: json["Answer"],
//       );

//   Map<String, dynamic> toJson() => {
//         "identifier": correctAnswerValues.reverse[identifier],
//         "Answer": answer,
//       };
// }

// enum CorrectAnswer { A, B, C, D }

// final correctAnswerValues = EnumValues({
//           "A":CorrectAnswer.A,
//   "B": CorrectAnswer.B,
//   "C": CorrectAnswer.C,
//   "D": CorrectAnswer.D
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
