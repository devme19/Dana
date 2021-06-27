import 'package:dana/data/model/file_model.dart';
import 'package:dana/data/model/free_knowledge_model.dart';
import 'package:dana/data/model/knowledge_detail_model.dart';
import 'package:dana/data/model/tag_model.dart';
import 'package:dana/domain/entity/free_knowledge_detail_entity.dart';

import 'knowledge_tree_model.dart';

class FreeKnowledgeDetailModel extends FreeKnowledgeDetailEntity{


    FreeKnowledgeDetailModel({
      Data data,
      int code,
      String locale,
      String message,
      bool success,
      }):super(
        data: data,
            code: code,
            success: success,
            message: message,
            locale: locale
      );

    factory FreeKnowledgeDetailModel.fromJson(Map<String, dynamic> json) {
        return FreeKnowledgeDetailModel(
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
    String file;
    List<Files> attaches;
    Author author;
    Category category;
    List<Compass> compass;
    String created_at;
    String description;
    int favorite;
    String id;
    bool is_author;
    String kcode;
    List<KnowledgeTreeModel> knowledgeTree;
    List<Author> likes;
    int likes_count;
    String reviews_count;
    String status;
    List<Tag> tags;
    String title;
    String type_file;
    int userliked_count;
    int visits;

    Data({this.file, this.attaches, this.author, this.category, this.compass, this.created_at, this.description, this.favorite, this.id, this.is_author, this.kcode, this.knowledgeTree, this.likes, this.likes_count, this.reviews_count, this.status, this.tags, this.title, this.type_file, this.userliked_count, this.visits});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            file: json['file'],
            attaches: json['attaches'] != null ? (json['attaches'] as List).map((i) => Files.fromJson(i)).toList() : null,
            author: json['author'] != null ? Author.fromJson(json['author']) : null, 
            category: json['category'] != null ? Category.fromJson(json['category']) : null,
            compass: json['compass'] != null ? (json['compass'] as List).map((i) => Compass.fromJson(i)).toList() : null,
            created_at: json['created_at'], 
            description: json['description'], 
            favorite: json['favorite'], 
            id: json['id'], 
            is_author: json['is_author'], 
            kcode: json['kcode'], 
            knowledgeTree: json['knowledgeTree'] != null ? (json['knowledgeTree'] as List).map((i) => KnowledgeTreeModel.fromJson(i)).toList() : null,
            likes: json['likes'] != null ? (json['likes'] as List).map((i) => Author.fromJson(i)).toList() : null,
            likes_count: json['likes_count'], 
            reviews_count: json['reviews_count'], 
            status: json['status'], 
            tags: json['tags'] != null ? (json['tags'] as List).map((i) => Tag.fromJson(i)).toList() : null, 
            title: json['title'], 
            type_file: json['type_file'], 
            userliked_count: json['userliked_count'], 
            visits: json['visits'], 
        );
    }

    // Map<String, dynamic> toJson() {
    //     final Map<String, dynamic> data = new Map<String, dynamic>();
    //     data['file'] = this.file;
    //     data['created_at'] = this.created_at;
    //     data['description'] = this.description;
    //     data['favorite'] = this.favorite;
    //     data['id'] = this.id;
    //     data['is_author'] = this.is_author;
    //     data['kcode'] = this.kcode;
    //     data['likes_count'] = this.likes_count;
    //     data['reviews_count'] = this.reviews_count;
    //     data['status'] = this.status;
    //     data['title'] = this.title;
    //     data['type_file'] = this.type_file;
    //     data['userliked_count'] = this.userliked_count;
    //     data['visits'] = this.visits;
    //     if (this.attaches != null) {
    //         data['attaches'] = this.attaches.map((v) => v.toJson()).toList();
    //     }
    //     if (this.author != null) {
    //         data['author'] = this.author.toJson();
    //     }
    //     if (this.category != null) {
    //         data['category'] = this.category.toJson();
    //     }
    //     if (this.compass != null) {
    //         data['compass'] = this.compass.map((v) => v.toJson()).toList();
    //     }
    //     if (this.knowledgeTree != null) {
    //         data['knowledgeTree'] = this.knowledgeTree.map((v) => v.toJson()).toList();
    //     }
    //     if (this.likes != null) {
    //         data['likes'] = this.likes.map((v) => v.toJson()).toList();
    //     }
    //     if (this.tags != null) {
    //         data['tags'] = this.tags.map((v) => v.toJson()).toList();
    //     }
    //     return data;
    // }
}