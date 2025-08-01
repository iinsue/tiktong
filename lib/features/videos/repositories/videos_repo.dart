import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktong/features/videos/models/video_model.dart';

class VideosRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // upload a video file
  // videos/userid/DateTime(miliseconds)
  uploadVideoFile(File video, String uid) {
    final fileRef = _storage.ref().child(
      "/videos/$uid/${DateTime.now().millisecondsSinceEpoch.toString()}",
    );

    return fileRef.putFile(video);
  }

  // create a video document
  Future<void> saveVideo(VideoModel data) async {
    await _db.collection("videos").add(data.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchVideos({
    int? lastItemCreatedAt,
  }) {
    final query = _db
        .collection("videos")
        .orderBy("createdAt", descending: true)
        .limit(2);

    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }

  Future<void> likeVideo(String videoId, String userId) async {
    final query = _db.collection("likes").doc("${videoId}000$userId");

    final like = await query.get();

    if (!like.exists) {
      await query.set({"createdAt": DateTime.now().millisecondsSinceEpoch});
    } else {
      query.delete();
    }
  }

  Future<bool> isLikedVideo(String videoId, String userId) async {
    final query = _db.collection("likes").doc("${videoId}000$userId");
    final like = await query.get();

    return like.exists;
  }
}

final videosRepo = Provider((ref) => VideosRepository());
