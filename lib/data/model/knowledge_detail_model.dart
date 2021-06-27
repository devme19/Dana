import 'package:dana/data/model/file_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/domain/entity/knowledge_detail_entity.dart';

import 'author_model.dart';
import 'tag_model.dart';

class KnowledgeDetailModel extends KnowledgeDetailEntity{


    KnowledgeDetailModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,
}):super(
      success: success,
      message: message,
      locale: locale,
      code: code,
      data: data
    );

    factory KnowledgeDetailModel.fromJson(Map<String, dynamic> json) {
        return KnowledgeDetailModel(
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
    String abstract;
    String file;
    List<Files> attaches;
    Author author;
    List<Compass> compass;
    String confidentiality;
    String created_at;
    String description;
    String evaluation;
    String evaluation_at;
    String experiences_count;
    int favorite;
    List<Object> fields;
    List<Files> files;
    String id;
    bool is_author;
    String kcode;
    List<KnowledgeTree> knowledge_tree;
    List<AuthorModel> likes;
    String likes_count;
    String pending_at;
    String poster;
    List<ProjectModel> projects;
    String publish_at;
    String reject_at;
    String result;
    String reviews_count;
    String short_description;
    String status;
    int sume;
    List<Tag> tags;
    List<AuthorModel> teams;
    String title;
    String type;
    int userliked;
    String version;
    String views_count;
    int visits;

    Data({this.abstract, this.file, this.attaches, this.author, this.compass, this.confidentiality, this.created_at, this.description, this.evaluation, this.evaluation_at, this.experiences_count, this.favorite, this.fields, this.files, this.id, this.is_author, this.kcode, this.knowledge_tree, this.likes, this.likes_count, this.pending_at, this.poster, this.projects, this.publish_at, this.reject_at, this.result, this.reviews_count, this.short_description, this.status, this.sume, this.tags, this.teams, this.title, this.type, this.userliked, this.version, this.views_count, this.visits});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            abstract: json['abstract'],
            file: json['file'],
            attaches: json['attaches'] != null ? (json['attaches'] as List).map((i) => Files.fromJson(i)).toList() : null,
            author: json['author'] != null ? Author.fromJson(json['author']) : null,
          compass: json['compass'] != null ? (json['compass'] as List).map((i) => Compass.fromJson(i)).toList() : null,
            confidentiality: json['confidentiality'], 
            created_at: json['created_at'], 
            description: json['description'], 
            evaluation: json['evaluation'] ,
            evaluation_at: json['evaluation_at'], 
            experiences_count: json['experiences_count'], 
            favorite: json['favorite'], 
            // fields: json['fields'] != null ? (json['fields'] as List).map((i) => Object.fromJson(i)).toList() : null,
            files: json['files'] != null ? (json['files'] as List).map((i) => Files.fromJson(i)).toList() : null,
            id: json['id'], 
            is_author: json['is_author'], 
            kcode: json['kcode'], 
            knowledge_tree: json['knowledge_tree'] != null ? (json['knowledge_tree'] as List).map((i) => KnowledgeTree.fromJson(i)).toList() : null,
            likes: json['likes'] != null ? (json['likes'] as List).map((i) => AuthorModel.fromJson(i)).toList() : null,
            likes_count: json['likes_count'], 
            pending_at: json['pending_at'], 
            poster: json['poster'],
            projects: json['projects'] != null ? (json['projects'] as List).map((i) => ProjectModel.fromJson(i)).toList() : null,
            publish_at: json['publish_at'], 
            reject_at: json['reject_at'], 
            result: json['result'], 
            reviews_count: json['reviews_count'], 
            short_description: json['short_description'], 
            status: json['status'], 
            sume: json['sume'], 
            tags: json['tags'] != null ? (json['tags'] as List).map((i) => Tag.fromJson(i)).toList() : null,
            teams: json['teams'] != null ? (json['teams'] as List).map((i) => AuthorModel.fromJson(i)).toList() : null,
            title: json['title'], 
            type: json['type'], 
            userliked: json['userliked'], 
            version: json['version'], 
            views_count: json['views_count'], 
            visits: json['visits'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`file`'] = this.file;
        data['confidentiality'] = this.confidentiality;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['evaluation_at'] = this.evaluation_at;
        data['experiences_count'] = this.experiences_count;
        data['favorite'] = this.favorite;
        data['id'] = this.id;
        data['is_author'] = this.is_author;
        data['kcode'] = this.kcode;
        data['likes_count'] = this.likes_count;
        data['pending_at'] = this.pending_at;
        data['poster'] = this.poster;
        data['publish_at'] = this.publish_at;
        data['reject_at'] = this.reject_at;
        data['result'] = this.result;
        data['reviews_count'] = this.reviews_count;
        data['short_description'] = this.short_description;
        data['status'] = this.status;
        data['sume'] = this.sume;
        data['title'] = this.title;
        data['type'] = this.type;
        data['userliked'] = this.userliked;
        data['version'] = this.version;
        data['views_count'] = this.views_count;
        data['visits'] = this.visits;
        data['abstract'] = this.abstract;
        data['attaches'] = this.attaches;
        data['compass'] = this.compass;
        data['evaluation'] = this.evaluation;
        data['fields'] = this.fields;
        data['files'] = this.files;
        if (this.author != null) {
            data['author'] = this.author.toJson();
        }

        if (this.knowledge_tree != null) {
            data['knowledge_tree'] = this.knowledge_tree.map((v) => v.toJson()).toList();
        }
        if (this.likes != null) {
            data['likes'] = this.likes.map((v) => v.toJson()).toList();
        }
        if (this.projects != null) {
            data['projects'] = this.projects.map((v) => v.toJson()).toList();
        }
        if (this.teams != null) {
            data['teams'] = this.teams.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class KnowledgeTree {
    String active;
    String icon;
    String id;
    String parent_id;
    String title;

    KnowledgeTree({this.active, this.icon, this.id, this.parent_id, this.title});

    factory KnowledgeTree.fromJson(Map<String, dynamic> json) {
        return KnowledgeTree(
            active: json['active'], 
            icon: json['icon'], 
            id: json['id'], 
            parent_id: json['parent_id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['parent_id'] = this.parent_id;
        data['title'] = this.title;
        return data;
    }
}

class Author {
    String about_me;
    String address;
    String ambassador_knowledge;
    City city;
    String city_id;
    Compass compass;
    String compass_id;
    String confidentiality;
    String cover_image;
    int documents;
    String family;
    String gender;
    String id;
    int is_follow;
    String name;
    OrganizationalChart organizational_chart;
    String organizational_chart_id;
    String personal_code;
    String photo;
    String position;
    Province province;
    String province_id;
    String username;
    String visits;

    Author({this.about_me, this.address, this.ambassador_knowledge, this.city, this.city_id, this.compass, this.compass_id, this.confidentiality, this.cover_image, this.documents, this.family, this.gender, this.id, this.is_follow, this.name, this.organizational_chart, this.organizational_chart_id, this.personal_code, this.photo, this.position, this.province, this.province_id, this.username, this.visits});

    factory Author.fromJson(Map<String, dynamic> json) {
        return Author(
            about_me: json['about_me'], 
            address: json['address'], 
            ambassador_knowledge: json['ambassador_knowledge'], 
            city: json['city'] != null ? City.fromJson(json['city']) : null, 
            city_id: json['city_id'], 
            compass: json['compass'] != null ? Compass.fromJson(json['compass']) : null, 
            compass_id: json['compass_id'], 
            confidentiality: json['confidentiality'], 
            cover_image: json['cover_image'], 
            documents: json['documents'], 
            family: json['family'], 
            gender: json['gender'], 
            id: json['id'], 
            is_follow: json['is_follow'], 
            name: json['name'], 
            organizational_chart: json['organizational_chart'] != null ? OrganizationalChart.fromJson(json['organizational_chart']) : null, 
            organizational_chart_id: json['organizational_chart_id'], 
            personal_code: json['personal_code'], 
            photo: json['photo'], 
            position: json['position'], 
            province: json['province'] != null ? Province.fromJson(json['province']) : null, 
            province_id: json['province_id'], 
            username: json['username'], 
            visits: json['visits'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['about_me'] = this.about_me;
        data['address'] = this.address;
        data['ambassador_knowledge'] = this.ambassador_knowledge;
        data['city_id'] = this.city_id;
        data['compass_id'] = this.compass_id;
        data['confidentiality'] = this.confidentiality;
        data['cover_image'] = this.cover_image;
        data['documents'] = this.documents;
        data['family'] = this.family;
        data['gender'] = this.gender;
        data['id'] = this.id;
        data['is_follow'] = this.is_follow;
        data['name'] = this.name;
        data['organizational_chart_id'] = this.organizational_chart_id;
        data['personal_code'] = this.personal_code;
        data['photo'] = this.photo;
        data['position'] = this.position;
        data['province_id'] = this.province_id;
        data['username'] = this.username;
        data['visits'] = this.visits;
        if (this.city != null) {
            data['city'] = this.city.toJson();
        }
        if (this.compass != null) {
            data['compass'] = this.compass.toJson();
        }
        if (this.organizational_chart != null) {
            data['organizational_chart'] = this.organizational_chart.toJson();
        }
        if (this.province != null) {
            data['province'] = this.province.toJson();
        }
        return data;
    }
}

class City {
    int id;
    String name;
    String province_id;

    City({this.id, this.name, this.province_id});

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
            id: json['id'], 
            name: json['name'], 
            province_id: json['province_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        data['province_id'] = this.province_id;
        return data;
    }
}

class Compass {
    String id;
    String parent_id;
    String title;

    Compass({this.id, this.parent_id, this.title});

    factory Compass.fromJson(Map<String, dynamic> json) {
        return Compass(
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

class Province {
    int id;
    String name;

    Province({this.id, this.name});

    factory Province.fromJson(Map<String, dynamic> json) {
        return Province(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}

class OrganizationalChart {
    String active;
    String id;
    String parent_id;
    String title;

    OrganizationalChart({this.active, this.id, this.parent_id, this.title});

    factory OrganizationalChart.fromJson(Map<String, dynamic> json) {
        return OrganizationalChart(
            active: json['active'], 
            id: json['id'], 
            parent_id: json['parent_id'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['active'] = this.active;
        data['id'] = this.id;
        data['parent_id'] = this.parent_id;
        data['title'] = this.title;
        return data;
    }
}
