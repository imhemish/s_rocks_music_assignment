import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/service_model.dart';

class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _ensureAuthenticated() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }

  Future<List<ServiceModel>> getServices() async {
    try {
      await _ensureAuthenticated();
      
      final QuerySnapshot snapshot = await _firestore
          .collection('services')
          .get();

      return snapshot.docs
          .map((doc) => ServiceModel.fromFirestore(
                doc.id,
                doc.data() as Map<String, dynamic>,
              ))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch services: $e');
    }
  }
}