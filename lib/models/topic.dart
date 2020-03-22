class Topic {
  String id;
  String title;
  String summary;
  String createdAt;
  String timeline;
  int order;
  bool loading;

  Topic({
    this.id,
    this.title,
    this.summary,
    this.createdAt,
    this.timeline,
    this.order,
    this.loading
  });

  Topic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    createdAt = json['createdAt'];
    timeline = json['timeline'];
    order = json['order'];
    loading = json['loading'] == null ? false : json['loading'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'createdAt': createdAt,
      'timeline': timeline,
      'order': order,
      'loading': loading
    };
  }
}
