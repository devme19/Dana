class KnowledgeTreeModel {

    String active;
    String icon;
    String id;
    String parent_id;
    String title;

    KnowledgeTreeModel({
        this.active,
        this.icon,
        this.id,
        this.parent_id,
        this.title
    });

    factory KnowledgeTreeModel.fromJson(Map<String, dynamic> json) {
        return KnowledgeTreeModel(
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