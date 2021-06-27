import 'package:dana/data/model/author_model.dart';
import 'package:dana/data/model/file_model.dart';
import 'package:dana/data/model/tag_model.dart';
import 'package:dana/domain/entity/free_knowledge_entity.dart';

import 'knowledge_detail_model.dart';

class FreeKnowledgeModel extends FreeKnowledgeEntity{


    FreeKnowledgeModel({
        Data data,
        int code,
        String locale,
        String message,
        bool success,
}):super(
        data: data,
        code: code,
        locale: locale,
        message: message,
        success: success
    );

    factory FreeKnowledgeModel.fromJson(Map<String, dynamic> json) {
        return FreeKnowledgeModel(
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
    String category_id;
    List<Item> items;
    String knowledge_tree;
    String page;
    String pageSize;
    String search;
    String sortBy;
    int total;

    Data({this.category_id, this.items, this.knowledge_tree, this.page, this.pageSize, this.search, this.sortBy, this.total});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            category_id: json['category_id'], 
            items: json['items'] != null ? (json['items'] as List).map((i) => Item.fromJson(i)).toList() : null, 
            knowledge_tree: json['knowledge_tree'], 
            page: json['page'], 
            pageSize: json['pageSize'], 
            search: json['search'], 
            sortBy: json['sortBy'], 
            total: json['total'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['category_id'] = this.category_id;
        data['knowledge_tree'] = this.knowledge_tree;
        data['page'] = this.page;
        data['pageSize'] = this.pageSize;
        data['search'] = this.search;
        data['sortBy'] = this.sortBy;
        data['total'] = this.total;
        if (this.items != null) {
            data['items'] = this.items.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Item {
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
    List<KnowledgeTree> knowledgeTree;
    List<AuthorModel> likes;
    int likes_count;
    String reviews_count;
    String status;
    List<Tag> tags;
    String title;
    String type_file;
    int userliked_count;
    String visits;

    Item({this.file, this.attaches, this.author, this.category, this.compass, this.created_at, this.description, this.favorite, this.id, this.is_author, this.kcode, this.knowledgeTree, this.likes, this.likes_count, this.reviews_count, this.status, this.tags, this.title, this.type_file, this.userliked_count, this.visits});

    factory Item.fromJson(Map<String, dynamic> json) {
        return Item(
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
            knowledgeTree: json['knowledgeTree'] != null ? (json['knowledgeTree'] as List).map((i) => KnowledgeTree.fromJson(i)).toList() : null, 
            likes: json['likes'] != null ? (json['likes'] as List).map((i) => AuthorModel.fromJson(i)).toList() : null,
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

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['`file`'] = this.file;
        data['created_at'] = this.created_at;
        data['description'] = this.description;
        data['favorite'] = this.favorite;
        data['id'] = this.id;
        data['is_author'] = this.is_author;
        data['kcode'] = this.kcode;
        data['likes_count'] = this.likes_count;
        data['reviews_count'] = this.reviews_count;
        data['status'] = this.status;
        data['title'] = this.title;
        data['type_file'] = this.type_file;
        data['userliked_count'] = this.userliked_count;
        data['visits'] = this.visits;
        // if (this.attaches != null) {
        //     data['attaches'] = this.attaches.map((v) => v.toJson()).toList();
        // }
        if (this.author != null) {
            data['author'] = this.author.toJson();
        }
        if (this.category != null) {
            data['category'] = this.category.toJson();
        }
        // if (this.compass != null) {
        //     data['compass'] = this.compass.map((v) => v.toJson()).toList();
        // }
        if (this.knowledgeTree != null) {
            data['knowledgeTree'] = this.knowledgeTree.map((v) => v.toJson()).toList();
        }
        // if (this.likes != null) {
        //     data['likes'] = this.likes.map((v) => v.toJson()).toList();
        // }
        // if (this.tags != null) {
        //     data['tags'] = this.tags.map((v) => v.toJson()).toList();
        // }
        return data;
    }
}


class Category {
    String description;
    String icon;
    String id;
    String ordered;
    String title;

    Category({this.description, this.icon, this.id, this.ordered, this.title});

    factory Category.fromJson(Map<String, dynamic> json) {
        return Category(
            description: json['description'], 
            icon: json['icon'], 
            id: json['id'], 
            ordered: json['ordered'], 
            title: json['title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['icon'] = this.icon;
        data['id'] = this.id;
        data['ordered'] = this.ordered;
        data['title'] = this.title;
        return data;
    }
}
