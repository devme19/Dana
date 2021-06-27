import 'package:dana/domain/entity/follow_entity.dart';

class FollowModel extends FollowEntity{


    FollowModel({
        Data data,
        int code,
        String locale,
        String message,
        bool success,
}):super(
        success: success,
        message: message,
        locale: locale,code:code,data: data
    );

    factory FollowModel.fromJson(Map<String, dynamic> json) {
        return FollowModel(
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
    String page;
    int pagesize;
    String sortby;
    int total;
    List<User> users;

    Data({this.page, this.pagesize, this.sortby, this.total, this.users});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            page: json['page'], 
            pagesize: json['pagesize'], 
            sortby: json['sortby'], 
            total: json['total'], 
            users: json['users'] != null ? (json['users'] as List).map((i) => User.fromJson(i)).toList() : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['page'] = this.page;
        data['pagesize'] = this.pagesize;
        data['sortby'] = this.sortby;
        data['total'] = this.total;
        if (this.users != null) {
            data['users'] = this.users.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class User {
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
    int free_knowledge;
    String gender;
    String id;
    int is_follow;
    int knowledges;
    String name;
    String organizational_chart;
    String organizational_chart_id;
    String personal_code;
    String photo;
    String position;
    Province province;
    String province_id;
    String username;
    String visits;

    User({this.about_me, this.address, this.ambassador_knowledge, this.city, this.city_id, this.compass, this.compass_id, this.confidentiality, this.cover_image, this.documents, this.family, this.free_knowledge, this.gender, this.id, this.is_follow, this.knowledges, this.name, this.organizational_chart, this.organizational_chart_id, this.personal_code, this.photo, this.position, this.province, this.province_id, this.username, this.visits});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
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
            free_knowledge: json['free_knowledge'], 
            gender: json['gender'], 
            id: json['id'], 
            is_follow: json['is_follow'], 
            knowledges: json['knowledges'], 
            name: json['name'], 
            organizational_chart: json['organizational_chart'], 
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
        data['free_knowledge'] = this.free_knowledge;
        data['gender'] = this.gender;
        data['id'] = this.id;
        data['is_follow'] = this.is_follow;
        data['knowledges'] = this.knowledges;
        data['name'] = this.name;
        data['organizational_chart'] = this.organizational_chart;
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