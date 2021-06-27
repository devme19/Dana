import 'package:dana/data/model/author_model.dart';
import 'package:dana/data/model/compass_model.dart';
import 'package:dana/data/model/knowledge_tree_model.dart';
import 'package:dana/data/model/project_model.dart';
import 'package:dana/domain/entity/knowledge_entity.dart';

import 'file_model.dart';
import 'tag_model.dart';

class KnowledgeModel extends KnowledgeEntity{

 KnowledgeModel({
   bool success,
   int code,
   String locale,
   String message,
   Data data,
}):super(
   data: data,
   code: code,
   locale: locale,
   message: message,
   success: success
 );
 factory KnowledgeModel.fromJson(Map<String, dynamic> json) {
   return KnowledgeModel(
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
  Data({
    this.page,
    this.pageSize,
    this.sortBy,
    this.status,
    this.search,
    this.total,
    this.knowledges,
    this.userId,
  });

  String page;
  String pageSize;
  String sortBy;
  String status;
  String search;
  int total;
  List<Knowledge> knowledges;
  String userId;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      page: json['page'],
      pageSize: json['pageSize'],
      sortBy: json['sortBy'],
      status: json['status'],
      search: json['search'],
      total: json['total'],
      knowledges: json['knowledges'] != null ? (json['knowledges'] as List).map((i) => Knowledge.fromJson(i)).toList() : null,
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pageSize'] = this.pageSize;
    data['sortBy'] = this.sortBy;
    data['status'] = this.status;
    data['search'] = this.search;
    data['total'] = this.total;
    data['knowledges'] = this.knowledges;
    data['userId'] = this.userId;
    return data;
  }
}

class Knowledge {
  Knowledge({
    this.id,
    this.kcode,
    this.title,
    this.knowledgeAbstract,
    this.result,
    this.description,
    this.shortDescription,
    this.poster,
    this.status,
    this.confidentiality,
    this.version,
    this.type,
    this.fields,
    this.author,
    this.file,
    this.files,
    this.tags,
    this.isAuthor,
    this.compass,
    this.sume,
    this.projects,
    this.teams,
    this.attaches,
    this.likes,
    this.userliked,
    this.likesCount,
    this.viewsCount,
    this.createdAt,
    this.visits,
    this.evaluation,
    this.reviewsCount,
    this.experiencesCount,
    this.pendingAt,
    this.evaluationAt,
    this.publishAt,
    this.rejectAt,
    this.favorite,
    this.knowledge_tree
  });

  String id;
  String kcode;
  String title;
  String knowledgeAbstract;
  String result;
  String description;
  String shortDescription;
  String poster;
  String status;
  String confidentiality;
  String version;
  String type;
  List<dynamic> fields;
  AuthorModel author;
  String file;
  List<Files> files;
  List<Tag> tags;
  bool isAuthor;
  List<Compass> compass;
  int sume;
  List<ProjectModel> projects;
  List<AuthorModel> teams;
  List<Files> attaches;
  List<AuthorModel> likes;
  List<KnowledgeTreeModel> knowledge_tree;
  int userliked;
  String likesCount;
  int viewsCount;
  String createdAt;
  String visits;
  String evaluation;
  String reviewsCount;
  String experiencesCount;
  String pendingAt;
  String evaluationAt;
  String publishAt;
  String rejectAt;
  int favorite;

  factory Knowledge.fromJson(Map<String, dynamic> json) {
    return Knowledge(
      id: json['id'],
      kcode: json['kcode'],
      title: json['title'],
      knowledgeAbstract: json['abstract'],
      result: json['result'],
      description: json['description'],
      shortDescription: json['short_description'],
      poster: json['poster'],
      status: json['status'],
      confidentiality: json['confidentiality'],
      version: json['version'],
      type: json['type'],
      file: json['file'],
      author: json['author'] != null ? AuthorModel.fromJson(json['author']) : null,
      files: json['files'] != null ? (json['files'] as List).map((i) => Files.fromJson(i)).toList() : null,
      tags: json['tags'] != null ? (json['tags'] as List).map((i) => Tag.fromJson(i)).toList() : null,
      isAuthor: json['is_author'],
      sume: json['sume'],
      projects: json['projects'] != null ? (json['projects'] as List).map((i) => ProjectModel.fromJson(i)).toList() : null,
      teams: json['teams'] != null ? (json['teams'] as List).map((i) => AuthorModel.fromJson(i)).toList() : null,
      attaches: json['attaches'] != null ? (json['attaches'] as List).map((i) => Files.fromJson(i)).toList() : null,
      likes: json['likes'] != null ? (json['likes'] as List).map((i) => AuthorModel.fromJson(i)).toList() : null,
      knowledge_tree: json['knowledge_tree'] != null ? (json['knowledge_tree'] as List).map((i) => KnowledgeTreeModel.fromJson(i)).toList() : null,
      compass: json['compass'] != null ? (json['compass'] as List).map((i) => Compass.fromJson(i)).toList() : null,
      userliked: json['userliked'],
      likesCount: json['likes_count'],
      viewsCount: json['views_count'],
      createdAt: json['created_at'],
      visits: json['visits'],
      evaluation: json['evaluation'],
      reviewsCount: json['reviews_count'],
      experiencesCount: json['experiences_count'],
      pendingAt: json['pending_at'],
      evaluationAt: json['evaluation_at'],
      publishAt: json['publish_at'],
      rejectAt: json['reject_at'],
      favorite: json['favorite'],
    );
  }
}




