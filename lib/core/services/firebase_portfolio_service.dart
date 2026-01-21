import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/portfolio_data.dart';

class FirebasePortfolioService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collectionPath = 'portfolio';

  Future<PortfolioData> getPortfolioData() async {
    try {
      final doc = await _firestore.collection(_collectionPath).doc('data').get();
      
      if (!doc.exists) {
        throw Exception('Portfolio data not found in Firestore');
      }

      return PortfolioData.fromFirestore(doc.data()!);
    } catch (e) {
      throw Exception('Failed to fetch portfolio data: $e');
    }
  }

  Stream<PortfolioData> getPortfolioDataStream() {
    return _firestore
        .collection(_collectionPath)
        .doc('data')
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists || snapshot.data() == null) {
        throw Exception('Portfolio data not found in Firestore');
      }
      return PortfolioData.fromFirestore(snapshot.data()!);
    }).handleError((error) {
      // Return a stream that emits default data on error
      throw error;
    });
  }
}
