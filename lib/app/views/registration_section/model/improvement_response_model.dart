class ImprovementsResponseModel {
  bool? status;
  String? message;
  List<Data>? data;
  dynamic errors;

  ImprovementsResponseModel(
      {this.status, this.message, this.data, this.errors});

  ImprovementsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['errors'] = errors;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  String? bgImage;
  int? status;
  List<Questions>? questions;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.bgImage,
        this.status,
        this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    bgImage = json['bg_image'];
    status = json['status'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['bg_image'] = bgImage;
    data['status'] = status;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? id;
  int? improvementProgramId;
  String? question;
  List<Options>? options;

  Questions({this.id, this.improvementProgramId, this.question, this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    improvementProgramId = json['improvement_program_id'];
    question = json['question'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['improvement_program_id'] = improvementProgramId;
    data['question'] = question;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  int? improvementQuestionId;
  String? optionText;

  Options({this.id, this.improvementQuestionId, this.optionText});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    improvementQuestionId = json['improvement_question_id'];
    optionText = json['option_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['improvement_question_id'] = improvementQuestionId;
    data['option_text'] = optionText;
    return data;
  }
}
