import '../../domain/entities/video_list.dart';

class LibraryVideoModel extends LibraryVideoEntity {
  const LibraryVideoModel({
    required String chapterId,
    required String chapterName,
    required int duration,
    required bool isDrm,
    required bool isLiked,
    required String jwMediaId,
    required String name,
    required String source,
    required int spentTime,
    required String subjectId,
    required String url,
    required int videoCount,
    required String videoSource,
    required AssetsModel assets,
  }) : super(
    chapterId: chapterId,
    chapterName: chapterName,
    duration: duration,
    isDrm: isDrm,
    isLiked: isLiked,
    jwMediaId: jwMediaId,
    name: name,
    source: source,
    spentTime: spentTime,
    subjectId: subjectId,
    url: url,
    videoCount: videoCount,
    videoSource: videoSource,
    assets: assets,
  );

  factory LibraryVideoModel.fromJson(Map<String, dynamic> json) {
    return LibraryVideoModel(
      chapterId: json['chapter_id']?.toString() ?? '',
      chapterName: json['chapter_name']?.toString() ?? '',
      duration: json['duration'] is int ? json['duration'] : 0,
      isDrm: json['is_drm'] == 1,
      isLiked: json['is_liked'] == 1,
      jwMediaId: json['jw_media_id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      source: json['source']?.toString() ?? '',
      spentTime: json['spent_time'] is int ? json['spent_time'] : 0,
      subjectId: json['subject_id']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      videoCount: json['video_count'] is int ? json['video_count'] : 0,
      videoSource: json['video_source']?.toString() ?? '',
      assets: AssetsModel.fromJson(json['assets'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapter_id': chapterId,
      'chapter_name': chapterName,
      'duration': duration,
      'is_drm': isDrm ? 1 : 0,
      'is_liked': isLiked ? 1 : 0,
      'jw_media_id': jwMediaId,
      'name': name,
      'source': source,
      'spent_time': spentTime,
      'subject_id': subjectId,
      'url': url,
      'video_count': videoCount,
      'video_source': videoSource,
      'assets': assets.toJson(),
    };
  }
}