class SaveUserImprovementResponseModel {
  bool? status;
  String? message;
  Data? data;
  dynamic errors;

  SaveUserImprovementResponseModel(
      {this.status, this.message, this.data, this.errors});

  SaveUserImprovementResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  List<SavedPrograms>? savedPrograms;

  Data({this.savedPrograms});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['saved_programs'] != null) {
      savedPrograms = <SavedPrograms>[];
      json['saved_programs'].forEach((v) {
        savedPrograms!.add(new SavedPrograms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.savedPrograms != null) {
      data['saved_programs'] =
          this.savedPrograms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavedPrograms {
  Program? program;
  List<Options>? options;

  SavedPrograms({this.program, this.options});

  SavedPrograms.fromJson(Map<String, dynamic> json) {
    program =
    json['program'] != null ? new Program.fromJson(json['program']) : null;
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.program != null) {
      data['program'] = this.program!.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Program {
  int? userId;
  int? improvementProgramId;
  String? updatedAt;
  String? createdAt;
  int? id;
  Program? program;
  List<Options>? options;

  Program(
      {this.userId,
        this.improvementProgramId,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.program,
        this.options});

  Program.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    improvementProgramId = json['improvement_program_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    program =
    json['program'] != null ? new Program.fromJson(json['program']) : null;
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['improvement_program_id'] = this.improvementProgramId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.program != null) {
      data['program'] = this.program!.toJson();
    }
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? id;
  int? userImprovementProgramId;
  int? improvementQuestionOptionId;
  int? userId;
  Option? option;

  Options(
      {this.id,
        this.userImprovementProgramId,
        this.improvementQuestionOptionId,
        this.userId,
        this.option});

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userImprovementProgramId = json['user_improvement_program_id'];
    improvementQuestionOptionId = json['improvement_question_option_id'];
    userId = json['user_id'];
    option =
    json['option'] != null ? new Option.fromJson(json['option']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_improvement_program_id'] = this.userImprovementProgramId;
    data['improvement_question_option_id'] = this.improvementQuestionOptionId;
    data['user_id'] = this.userId;
    if (this.option != null) {
      data['option'] = this.option!.toJson();
    }
    return data;
  }
}

class Option {
  int? id;
  int? improvementQuestionId;
  String? optionText;

  Option({this.id, this.improvementQuestionId, this.optionText});

  Option.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    improvementQuestionId = json['improvement_question_id'];
    optionText = json['option_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['improvement_question_id'] = this.improvementQuestionId;
    data['option_text'] = this.optionText;
    return data;
  }
}
