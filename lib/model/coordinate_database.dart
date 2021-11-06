import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String id;
  DatabaseService({required this.id});

  // collection reference
  final CollectionReference coordinates =
      Firestore.instance.collection('coordinates');
}
