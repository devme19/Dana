import 'package:dana/data/model/author_model.dart';
import 'package:dana/data/model/city_model.dart';
import 'package:dana/data/model/province_model.dart';
import 'package:dana/domain/entity/info_entity.dart';

import 'compass_model.dart';
import 'project_model.dart';

class CvModel extends CvEntity{


    CvModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,
}):super(data: data,
    code: code,
    locale: locale,
    message: message,
    success: success);

    factory CvModel.fromJson(Map<String, dynamic> json) {
        return CvModel(
            data: json['data'] != null ? Data.fromJson(json['data']) : null,
            code: json['code'],
            locale: json['locale'],
            message: json['message'],
            success: json['success'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['locale'] = this.locale;
        data['message'] = this.message;
        data['success'] = this.success;
        data['data'] = this.data;
        return data;
    }
}

class Data {
    String about_me;
    String address;
    City city;
    Compass compass;
    List<Course> courses;
    String cover_image;
    int documents;
    List<Education> educations;
    String email;
    List<Experience> experiences;
    ExpertTree expert_tree;
    String family;
    int followers;
    int following;
    int free_knowledge;
    String gender;
    String id;
    bool is_expert;
    int is_follow;
    int knowledges;
    List<Language> languages;
    String mobile;
    String name;
    OrganizationalChart organizational_chart;
    String personal_code;
    String phone;
    String photo;
    Progress progress;
    List<ProjectModel> projects;
    String province;
    int self;
    List<Skill> skills;
    String username;
    String visits;

    Data({this.projects,this.about_me, this.address, this.city, this.compass, this.courses, this.cover_image, this.documents, this.educations, this.email, this.experiences, this.expert_tree, this.family, this.followers, this.following, this.free_knowledge, this.gender, this.id, this.is_expert, this.is_follow, this.knowledges, this.languages, this.mobile, this.name, this.organizational_chart, this.personal_code, this.phone, this.photo, this.progress, this.province, this.self, this.skills, this.username, this.visits});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            about_me: json['about_me'],
            address: json['address'],
            // city: json['city'] != null ? City.fromJson(json['city']) : null,
            compass: json['compass'] != null ? Compass.fromJson(json['compass']) : null,
            courses: json['courses'] != null ? (json['courses'] as List).map((i) => Course.fromJson(i)).toList() : null,
            cover_image: json['cover_image'],
            documents: json['documents'],
            educations: json['educations'] != null ? (json['educations'] as List).map((i) => Education.fromJson(i)).toList() : null,
            email: json['email'],
            experiences: json['experiences'] != null ? (json['experiences'] as List).map((i) => Experience.fromJson(i)).toList() : null,
            // expert_tree: json['expert_tree'] != null ? ExpertTree.fromJson(json['expert_tree']) : null,
            family: json['family'],
            followers: json['followers'],
            following: json['following'],
            free_knowledge: json['free_knowledge'],
            gender: json['gender'],
            id: json['id'],
            is_expert: json['is_expert'],
            is_follow: json['is_follow'],
            knowledges: json['knowledges'],
            languages: json['languages'] != null ? (json['languages'] as List).map((i) => Language.fromJson(i)).toList() : null,
            mobile: json['mobile'],
            name: json['name'],
            organizational_chart: json['organizational_chart'] != null ? OrganizationalChart.fromJson(json['organizational_chart']) : null,
            personal_code: json['personal_code'],
            phone: json['phone'],
            photo: json['photo'],
            progress: json['progress'] != null ? Progress.fromJson(json['progress']) : null,
            projects: json['projects'] != null ? (json['projects'] as List).map((i) => ProjectModel.fromJson(i)).toList() : null,
            province: json['province'],
            self: json['self'],
            skills: json['skills'] != null ? (json['skills'] as List).map((i) => Skill.fromJson(i)).toList() : null,
            username: json['username'],
            // visits: json['visits'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['about_me'] = this.about_me;
        data['address'] = this.address;
        data['city'] = this.city;
        data['cover_image'] = this.cover_image;
        data['documents'] = this.documents;
        data['email'] = this.email;
        data['family'] = this.family;
        data['followers'] = this.followers;
        data['following'] = this.following;
        data['free_knowledge'] = this.free_knowledge;
        data['gender'] = this.gender;
        data['id'] = this.id;
        data['is_expert'] = this.is_expert;
        data['is_follow'] = this.is_follow;
        data['knowledges'] = this.knowledges;
        data['mobile'] = this.mobile;
        data['name'] = this.name;
        data['personal_code'] = this.personal_code;
        data['phone'] = this.phone;
        data['photo'] = this.photo;
        data['province'] = this.province;
        data['self'] = this.self;
        data['username'] = this.username;
        data['visits'] = this.visits;
        if (this.compass != null) {
            data['compass'] = this.compass.toJson();
        }
        if (this.courses != null) {
            data['courses'] = this.courses.map((v) => v.toJson()).toList();
        }
        if (this.educations != null) {
            data['educations'] = this.educations.map((v) => v.toJson()).toList();
        }
        if (this.experiences != null) {
            data['experiences'] = this.experiences.map((v) => v.toJson()).toList();
        }
        if (this.expert_tree != null) {
            data['expert_tree'] = this.expert_tree.toJson();
        }
        if (this.languages != null) {
            data['languages'] = this.languages.map((v) => v.toJson()).toList();
        }
        if (this.organizational_chart != null) {
            data['organizational_chart'] = this.organizational_chart.toJson();
        }
        if (this.progress != null) {
            data['progress'] = this.progress.toJson();
        }
        // if (this.projects != null) {
        //     data['projects'] = this.projects.map((v) => v.toJson()).toList();
        // }
        if (this.skills != null) {
            data['skills'] = this.skills.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class ExpertTree {
    String icon;
    String id;
    String parent_id;
    String title;

    ExpertTree({this.icon, this.id, this.parent_id, this.title});

    factory ExpertTree.fromJson(Map<String, dynamic> json) {
        return ExpertTree(
            icon: json['icon'],
            id: json['id'],
            parent_id: json['parent_id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['parent_id'] = this.parent_id;
        data['title'] = this.title;
        return data;
    }
}

class Course {
    String created_at;
    String description;
    String end_date_at;
    String id;
    String location;
    String start_date_at;
    String title;
    String updated_at;

    Course({this.created_at, this.description, this.end_date_at, this.id, this.location, this.start_date_at, this.title, this.updated_at});

    factory Course.fromJson(Map<String, dynamic> json) {
        return Course(
            created_at: json['created_at'],
            description: json['description'],
            end_date_at: json['end_date_at'],
            id: json['id'],
            location: json['location'] ,
            start_date_at: json['start_date_at'],
            title: json['title'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['end_date_at'] = this.end_date_at;
        data['id'] = this.id;
        data['start_date_at'] = this.start_date_at;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        data['description'] = this.description;
        data['location'] = this.location;
        return data;
    }
}

class Language {
    String id;
    String title;
    String user_id;

    Language({this.id, this.title, this.user_id});

    factory Language.fromJson(Map<String, dynamic> json) {
        return Language(
            id: json['id'],
            title: json['title'],
            user_id: json['user_id'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        data['user_id'] = this.user_id;
        return data;
    }
}

class Skill {
    String created_at;
    String id;
    int rate;
    String title;
    String updated_at;

    Skill({this.created_at, this.id, this.rate, this.title, this.updated_at});

    factory Skill.fromJson(Map<String, dynamic> json) {
        return Skill(
            created_at: json['created_at'],
            id: json['id'],
            rate: json['rate'],
            title: json['title'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['id'] = this.id;
        data['rate'] = this.rate;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        return data;
    }
}

class Education {
    String activities_societies;
    String created_at;
    String degree;
    String end_date_at;
    String field_of_study;
    Grade grade;
    String id;
    String school;
    String start_date_at;
    String updated_at;
    String user_educationcol;

    Education({this.activities_societies, this.created_at, this.degree, this.end_date_at, this.field_of_study, this.grade, this.id, this.school, this.start_date_at, this.updated_at, this.user_educationcol});

    factory Education.fromJson(Map<String, dynamic> json) {
        return Education(
            activities_societies: json['activities_societies'],
            created_at: json['created_at'],
            degree: json['degree'],
            end_date_at: json['end_date_at'],
            field_of_study: json['field_of_study'],
            grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
            id: json['id'],
            school: json['school'],
            start_date_at: json['start_date_at'],
            updated_at: json['updated_at'],
            user_educationcol: json['user_educationcol'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['created_at'] = this.created_at;
        data['end_date_at'] = this.end_date_at;
        data['field_of_study'] = this.field_of_study;
        data['id'] = this.id;
        data['school'] = this.school;
        data['start_date_at'] = this.start_date_at;
        data['updated_at'] = this.updated_at;
        data['activities_societies'] = this.activities_societies;
        data['degree'] = this.degree;
        data['user_educationcol'] = this.user_educationcol;
        return data;
    }
}

class Grade {
    String id;
    String title;

    Grade({this.id, this.title});

    factory Grade.fromJson(Map<String, dynamic> json) {
        return Grade(
            id: json['id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}

class Experience {
    String company_name;
    String created_at;
    String currently_working;
    String description;
    EmploymentType employment_type;
    String end_date_at;
    String headline;
    String id;
    String location;
    String start_date_at;
    String title;
    String updated_at;

    Experience({this.company_name, this.created_at, this.currently_working, this.description, this.employment_type, this.end_date_at, this.headline, this.id, this.location, this.start_date_at, this.title, this.updated_at});

    factory Experience.fromJson(Map<String, dynamic> json) {
        return Experience(
            company_name: json['company_name'],
            created_at: json['created_at'],
            currently_working: json['currently_working'],
            description: json['description'],
            employment_type: json['employment_type'] != null ? EmploymentType.fromJson(json['employment_type']) : null,
            end_date_at: json['end_date_at'],
            headline: json['headline'],
            id: json['id'],
            location: json['location'],
            start_date_at: json['start_date_at'],
            title: json['title'],
            updated_at: json['updated_at'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['company_name'] = this.company_name;
        data['created_at'] = this.created_at;
        data['currently_working'] = this.currently_working;
        data['description'] = this.description;
        data['end_date_at'] = this.end_date_at;
        data['headline'] = this.headline;
        data['id'] = this.id;
        data['location'] = this.location;
        data['start_date_at'] = this.start_date_at;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        if (this.employment_type != null) {
            data['employment_type'] = this.employment_type.toJson();
        }
        return data;
    }
}

class EmploymentType {
    String id;
    String title;

    EmploymentType({this.id, this.title});

    factory EmploymentType.fromJson(Map<String, dynamic> json) {
        return EmploymentType(
            id: json['id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        return data;
    }
}

class OrganizationalChart {
    String id;
    String parent_id;
    String title;

    OrganizationalChart({this.id, this.parent_id, this.title});

    factory OrganizationalChart.fromJson(Map<String, dynamic> json) {
        return OrganizationalChart(
            id: json['id'],
            parent_id: json['parent_id'],
            title: json['title'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['parent_id'] = this.parent_id;
        data['title'] = this.title;
        return data;
    }
}

class Progress {
    int about_me;
    int courses;
    int experiences;
    int image;
    int skills;

    Progress(
        {this.about_me, this.courses, this.experiences, this.image, this.skills});

    factory Progress.fromJson(Map<String, dynamic> json) {
        return Progress(
            about_me: json['about_me'],
            courses: json['courses'],
            experiences: json['experiences'],
            image: json['image'],
            skills: json['skills'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['about_me'] = this.about_me;
        data['courses'] = this.courses;
        data['experiences'] = this.experiences;
        data['image'] = this.image;
        data['skills'] = this.skills;
        return data;
    }
}


