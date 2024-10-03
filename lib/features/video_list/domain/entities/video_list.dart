import 'package:equatable/equatable.dart';

class LibraryVideoEntity extends Equatable {
  final String chapterId;
  final String chapterName;
  final int duration;
  final bool isDrm;
  final bool isLiked;
  final String jwMediaId;
  final String name;
  final String source;
  final int spentTime;
  final String subjectId;
  final String url;
  final int videoCount;
  final String videoSource;
  final AssetsModel assets;

  const LibraryVideoEntity({
    required this.chapterId,
    required this.chapterName,
    required this.duration,
    required this.isDrm,
    required this.isLiked,
    required this.jwMediaId,
    required this.name,
    required this.source,
    required this.spentTime,
    required this.subjectId,
    required this.url,
    required this.videoCount,
    required this.videoSource,
    required this.assets,
  });

  @override
  List<Object?> get props => [
    chapterId,
    chapterName,
    duration,
    isDrm,
    isLiked,
    jwMediaId,
    name,
    source,
    spentTime,
    subjectId,
    url,
    videoCount,
    videoSource,
    assets,
  ];
}

class AssetsModel extends Equatable {
  final String? primaryColor;
  final String? secondaryColor;
  final String? chapterIcon;
  final List<String>? ekidsChapterIcon;
  final String? ekidsSubjectIcon;

  const AssetsModel({
    this.primaryColor,
    this.secondaryColor,
    this.chapterIcon,
    this.ekidsChapterIcon,
    this.ekidsSubjectIcon,
  });

  factory AssetsModel.fromJson(Map<String, dynamic> json) {
    return AssetsModel(
      primaryColor: json['primary_color'],
      secondaryColor: json['secondary_color'],
      chapterIcon: json['chapter_icon'],
      ekidsChapterIcon: List<String>.from(json['ekids_chapter_icon'] ?? []),
      ekidsSubjectIcon: json['ekids_subject_icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'primary_color': primaryColor,
      'secondary_color': secondaryColor,
      'chapter_icon': chapterIcon,
      'ekids_chapter_icon': ekidsChapterIcon,
      'ekids_subject_icon': ekidsSubjectIcon,
    };
  }

  @override
  List<Object?> get props => [
    primaryColor,
    secondaryColor,
    chapterIcon,
    ekidsChapterIcon,
    ekidsSubjectIcon,
  ];
}

