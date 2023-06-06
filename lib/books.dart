import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class books {
  String? status;
  String? copyright;
  Response? response;

  books({this.status, this.copyright, this.response});

  books.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  List<Docs>? docs;
  Meta? meta;

  Response({this.docs, this.meta});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Docs {
  String? abstract;
  String? webUrl;
  String? snippet;
  String? leadParagraph;
  String? printSection;
  String? printPage;
  String? source;
  List<Multimedia>? multimedia;
  Headline? headline;
  List<Keywords>? keywords;
  String? pubDate;
  String? documentType;
  String? newsDesk;
  String? sectionName;
  String? subsectionName;
  Byline? byline;
  String? typeOfMaterial;
  String? sId;
  int? wordCount;
  String? uri;

  Docs(
      {this.abstract,
      this.webUrl,
      this.snippet,
      this.leadParagraph,
      this.printSection,
      this.printPage,
      this.source,
      this.multimedia,
      this.headline,
      this.keywords,
      this.pubDate,
      this.documentType,
      this.newsDesk,
      this.sectionName,
      this.subsectionName,
      this.byline,
      this.typeOfMaterial,
      this.sId,
      this.wordCount,
      this.uri});

  Docs.fromJson(Map<String, dynamic> json) {
    abstract = json['abstract'];
    webUrl = json['web_url'];
    snippet = json['snippet'];
    leadParagraph = json['lead_paragraph'];
    printSection = json['print_section'];
    printPage = json['print_page'];
    source = json['source'];
    if (json['multimedia'] != null) {
      multimedia = <Multimedia>[];
      json['multimedia'].forEach((v) {
        multimedia!.add(new Multimedia.fromJson(v));
      });
    }
    headline = json['headline'] != null
        ? new Headline.fromJson(json['headline'])
        : null;
    if (json['keywords'] != null) {
      keywords = <Keywords>[];
      json['keywords'].forEach((v) {
        keywords!.add(new Keywords.fromJson(v));
      });
    }
    pubDate = json['pub_date'];
    documentType = json['document_type'];
    newsDesk = json['news_desk'];
    sectionName = json['section_name'];
    subsectionName = json['subsection_name'];
    byline =
        json['byline'] != null ? new Byline.fromJson(json['byline']) : null;
    typeOfMaterial = json['type_of_material'];
    sId = json['_id'];
    wordCount = json['word_count'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['abstract'] = this.abstract;
    data['web_url'] = this.webUrl;
    data['snippet'] = this.snippet;
    data['lead_paragraph'] = this.leadParagraph;
    data['print_section'] = this.printSection;
    data['print_page'] = this.printPage;
    data['source'] = this.source;
    if (this.multimedia != null) {
      data['multimedia'] = this.multimedia!.map((v) => v.toJson()).toList();
    }
    if (this.headline != null) {
      data['headline'] = this.headline!.toJson();
    }
    if (this.keywords != null) {
      data['keywords'] = this.keywords!.map((v) => v.toJson()).toList();
    }
    data['pub_date'] = this.pubDate;
    data['document_type'] = this.documentType;
    data['news_desk'] = this.newsDesk;
    data['section_name'] = this.sectionName;
    data['subsection_name'] = this.subsectionName;
    if (this.byline != null) {
      data['byline'] = this.byline!.toJson();
    }
    data['type_of_material'] = this.typeOfMaterial;
    data['_id'] = this.sId;
    data['word_count'] = this.wordCount;
    data['uri'] = this.uri;
    return data;
  }
}

class Multimedia {
  int? rank;
  String? subtype;
  Null? caption;
  Null? credit;
  String? type;
  String? url;
  int? height;
  int? width;
  Legacy? legacy;
  String? subType;
  String? cropName;

  Multimedia(
      {this.rank,
      this.subtype,
      this.caption,
      this.credit,
      this.type,
      this.url,
      this.height,
      this.width,
      this.legacy,
      this.subType,
      this.cropName});

  Multimedia.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    subtype = json['subtype'];
    caption = json['caption'];
    credit = json['credit'];
    type = json['type'];
    url = json['url'];
    height = json['height'];
    width = json['width'];
    legacy =
        json['legacy'] != null ? new Legacy.fromJson(json['legacy']) : null;
    subType = json['subType'];
    cropName = json['crop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rank'] = this.rank;
    data['subtype'] = this.subtype;
    data['caption'] = this.caption;
    data['credit'] = this.credit;
    data['type'] = this.type;
    data['url'] = this.url;
    data['height'] = this.height;
    data['width'] = this.width;
    if (this.legacy != null) {
      data['legacy'] = this.legacy!.toJson();
    }
    data['subType'] = this.subType;
    data['crop_name'] = this.cropName;
    return data;
  }
}

class Legacy {
  String? xlarge;
  int? xlargewidth;
  int? xlargeheight;
  String? thumbnail;
  int? thumbnailwidth;
  int? thumbnailheight;
  int? widewidth;
  int? wideheight;
  String? wide;

  Legacy(
      {this.xlarge,
      this.xlargewidth,
      this.xlargeheight,
      this.thumbnail,
      this.thumbnailwidth,
      this.thumbnailheight,
      this.widewidth,
      this.wideheight,
      this.wide});

  Legacy.fromJson(Map<String, dynamic> json) {
    xlarge = json['xlarge'];
    xlargewidth = json['xlargewidth'];
    xlargeheight = json['xlargeheight'];
    thumbnail = json['thumbnail'];
    thumbnailwidth = json['thumbnailwidth'];
    thumbnailheight = json['thumbnailheight'];
    widewidth = json['widewidth'];
    wideheight = json['wideheight'];
    wide = json['wide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xlarge'] = this.xlarge;
    data['xlargewidth'] = this.xlargewidth;
    data['xlargeheight'] = this.xlargeheight;
    data['thumbnail'] = this.thumbnail;
    data['thumbnailwidth'] = this.thumbnailwidth;
    data['thumbnailheight'] = this.thumbnailheight;
    data['widewidth'] = this.widewidth;
    data['wideheight'] = this.wideheight;
    data['wide'] = this.wide;
    return data;
  }
}

class Headline {
  String? main;
  String? kicker;
  Null? contentKicker;
  String? printHeadline;
  Null? name;
  Null? seo;
  Null? sub;

  Headline(
      {this.main,
      this.kicker,
      this.contentKicker,
      this.printHeadline,
      this.name,
      this.seo,
      this.sub});

  Headline.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    kicker = json['kicker'];
    contentKicker = json['content_kicker'];
    printHeadline = json['print_headline'];
    name = json['name'];
    seo = json['seo'];
    sub = json['sub'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['main'] = this.main;
    data['kicker'] = this.kicker;
    data['content_kicker'] = this.contentKicker;
    data['print_headline'] = this.printHeadline;
    data['name'] = this.name;
    data['seo'] = this.seo;
    data['sub'] = this.sub;
    return data;
  }
}

class Keywords {
  String? name;
  String? value;
  int? rank;
  String? major;

  Keywords({this.name, this.value, this.rank, this.major});

  Keywords.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    rank = json['rank'];
    major = json['major'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['rank'] = this.rank;
    data['major'] = this.major;
    return data;
  }
}

class Byline {
  String? original;
  List<Person>? person;
  String? organization;

  Byline({this.original, this.person, this.organization});

  Byline.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    if (json['person'] != null) {
      person = <Person>[];
      json['person'].forEach((v) {
        person!.add(new Person.fromJson(v));
      });
    }
    organization = json['organization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    if (this.person != null) {
      data['person'] = this.person!.map((v) => v.toJson()).toList();
    }
    data['organization'] = this.organization;
    return data;
  }
}

class Person {
  String? firstname;
  String? middlename;
  String? lastname;
  Null? qualifier;
  Null? title;
  String? role;
  String? organization;
  int? rank;

  Person(
      {this.firstname,
      this.middlename,
      this.lastname,
      this.qualifier,
      this.title,
      this.role,
      this.organization,
      this.rank});

  Person.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    middlename = json['middlename'];
    lastname = json['lastname'];
    qualifier = json['qualifier'];
    title = json['title'];
    role = json['role'];
    organization = json['organization'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['middlename'] = this.middlename;
    data['lastname'] = this.lastname;
    data['qualifier'] = this.qualifier;
    data['title'] = this.title;
    data['role'] = this.role;
    data['organization'] = this.organization;
    data['rank'] = this.rank;
    return data;
  }
}

class Meta {
  int? hits;
  int? offset;
  int? time;

  Meta({this.hits, this.offset, this.time});

  Meta.fromJson(Map<String, dynamic> json) {
    hits = json['hits'];
    offset = json['offset'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hits'] = this.hits;
    data['offset'] = this.offset;
    data['time'] = this.time;
    return data;
  }
}
