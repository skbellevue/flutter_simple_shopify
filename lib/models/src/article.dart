import 'package:flutter_simple_shopify/models/src/product.dart';

class Articles {
  final List<Article> articleList;

  Articles({required this.articleList});

  static Articles fromJson(Map<String, dynamic>? json) {
    return Articles(articleList: _getArticleList(json ?? const {}));
  }

  static _getArticleList(Map<String, dynamic> json) {
    List<Article> articleList = [];
    json['edges']?.forEach(
        (article) => articleList.add(Article.fromJson(article ?? const {})));
    return articleList;
  }
}

class Article {
  final AuthorV2 author;
  final List<Comment> commentList;
  final String content;
  final String contentHtml;
  final String excerpt;
  final String excerptHtml;
  final String handle;
  final String id;
  final ShopifyImage image;
  final String publishedAt;
  final List<String> tags;
  final String title;
  final String url;

  Article(
      {required this.author,
      required this.commentList,
      required this.content,
      required this.contentHtml,
      required this.excerpt,
      required this.excerptHtml,
      required this.handle,
      required this.id,
      required this.image,
      required this.publishedAt,
      required this.tags,
      required this.title,
      required this.url});

  static Article fromJson(Map<String, dynamic> json) {
    return Article(
      author: AuthorV2.fromJson(
          ((json['node'] ?? const {})['authorV2']) ?? const {}),
      commentList:
          _getCommentList((json['node'] ?? const {})['comments'] ?? const {}),
      content: (json['node'] ?? const {})['content'],
      contentHtml: (json['node'] ?? const {})['contentHtml'],
      excerpt: (json['node'] ?? const {})['excerpt'],
      excerptHtml: (json['node'] ?? const {})['excerptHtml'],
      handle: (json['node'] ?? const {})['handle'],
      id: (json['node'] ?? const {})['id'],
      image: ShopifyImage.fromJson(
          (json['node'] ?? const {})['image'] ?? const {}),
      publishedAt: (json['node'] ?? const {})['publishedAt'],
      tags: _getTagsList(json),
      title: (json['node'] ?? const {})['title'],
      url: (json['node'] ?? const {})['url'],
    );
  }

  static _getCommentList(Map<String, dynamic> json) {
    List<Comment> commentList = [];
    json['edges']?.forEach(
        (comment) => commentList.add(Comment.fromJson(comment ?? const {})));
    return commentList;
  }

  static _getTagsList(Map<String, dynamic> json) {
    List<String> tagsList = [];
    (json['node'] ?? const {})['tags']?.forEach((tag) => tagsList.add(tag));
    return tagsList;
  }
}

class Comment {
  final String? email;
  final String? name;
  final String? content;
  final String? contentHtml;
  final String? id;

  Comment(
      {required this.email,
      required this.name,
      required this.content,
      required this.contentHtml,
      required this.id});

  static Comment fromJson(Map<String, dynamic> json) {
    return Comment(
        email: ((json['node'] ?? const {})['author'] ?? const {})['email'],
        name: ((json['node'] ?? const {})['author'] ?? const {})['name'],
        content: (json['node'] ?? const {})['content'],
        contentHtml: (json['node'] ?? const {})['contentHtml'],
        id: (json['node'] ?? const {})['id']);
  }
}

class AuthorV2 {
  final String? bio;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? name;

  AuthorV2(
      {required this.bio,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.name});

  static AuthorV2 fromJson(Map<String, dynamic> json) {
    return AuthorV2(
        bio: json['bio'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        name: json['name']);
  }
}
