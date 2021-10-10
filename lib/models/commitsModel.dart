// To parse this JSON data, do
//
//     final commits = commitsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<CommitData> commitsFromJson(String str) => List<CommitData>.from(json.decode(str).map((x) => CommitData.fromJson(x)));

class CommitsData{

  List<CommitData> repos;
  CommitsData({@required this.repos});

  factory CommitsData.fromRes(List<dynamic> data)=>
      CommitsData(
          repos: List.from(data.map((e) => CommitData.fromJson(e)))
      );
}



class CommitData {
  CommitData({
    this.url,
    this.sha,
    this.nodeId,
    this.htmlUrl,
    this.commentsUrl,
    this.commit,
    this.parents,
  });

  String url;
  String sha;
  String nodeId;
  String htmlUrl;
  String commentsUrl;
  Commit commit;
  List<Tree> parents;

  factory CommitData.fromJson(Map<String, dynamic> json) => CommitData(
    url: json["url"],
    sha: json["sha"],
    nodeId: json["node_id"],
    htmlUrl: json["html_url"],
    commentsUrl: json["comments_url"],
    commit: Commit.fromJson(json["commit"]),
    parents: List<Tree>.from(json["parents"].map((x) => Tree.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "sha": sha,
    "node_id": nodeId,
    "html_url": htmlUrl,
    "comments_url": commentsUrl,
    "commit": commit.toJson(),

  };
}


class Commit {
  Commit({
    this.url,
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.commentCount,
    this.verification,
  });

  String url;
  CommitAuthorClass author;
  CommitAuthorClass committer;
  String message;
  Tree tree;
  int commentCount;
  Verification verification;

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
    url: json["url"],
    author: CommitAuthorClass.fromJson(json["author"]),
    committer: CommitAuthorClass.fromJson(json["committer"]),
    message: json["message"],
    tree: Tree.fromJson(json["tree"]),
    commentCount: json["comment_count"],
    verification: Verification.fromJson(json["verification"]),
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "author": author.toJson(),
    "committer": committer.toJson(),
    "message": message,
    "tree": tree.toJson(),
    "comment_count": commentCount,
    "verification": verification.toJson(),
  };
}

class CommitAuthorClass {
  CommitAuthorClass({
    this.name,
    this.email,
    this.date,
  });

  String name;
  String email;
  DateTime date;

  factory CommitAuthorClass.fromJson(Map<String, dynamic> json) => CommitAuthorClass(
    name: json["name"],
    email: json["email"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "date": date.toIso8601String(),
  };
}

class Tree {
  Tree({
    this.url,
    this.sha,
  });

  String url;
  String sha;

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
    url: json["url"],
    sha: json["sha"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "sha": sha,
  };
}

class Verification {
  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
    verified: json["verified"],
    reason: json["reason"],
    signature: json["signature"],
    payload: json["payload"],
  );

  Map<String, dynamic> toJson() => {
    "verified": verified,
    "reason": reason,
    "signature": signature,
    "payload": payload,
  };
}
