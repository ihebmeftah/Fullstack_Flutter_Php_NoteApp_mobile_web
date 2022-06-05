class Note {
  String? notesId;
  String? notTitle;
  String? notesContent;
  String? notesImg;
  String? notesUsers;

  Note(
      {this.notesId,
      this.notTitle,
      this.notesContent,
      this.notesImg,
      this.notesUsers});

  Note.fromJson(Map<String, dynamic> json) {
    notesId = json['notes_id'];
    notTitle = json['not_title'];
    notesContent = json['notes_content'];
    notesImg = json['notes_img'];
    notesUsers = json['notes_users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notes_id'] = notesId;
    data['not_title'] = notTitle;
    data['notes_content'] = notesContent;
    data['notes_img'] = notesImg;
    data['notes_users'] = notesUsers;
    return data;
  }
}
