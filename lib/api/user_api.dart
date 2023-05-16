import 'package:appwrite/appwrite.dart';
import 'package:cinsie_neonimals/api/models/subscriber_model.dart';
import 'package:cinsie_neonimals/api/providers.dart';
import 'package:cinsie_neonimals/constants/appwrite_constants.dart';
import 'package:cinsie_neonimals/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../type_defs.dart';

final userAPIProvider = Provider(
  (ref) {
    return UserAPI(
      db: ref.watch(appwriteDatabaseProvider),
    );
  },
);

class UserAPI {
  final Databases _db;
  UserAPI({required Databases db}) : _db = db;

  FutureEitherVoid saveEmailSubscriber(Subscriber subscriber) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.subscribersCollection,
        data: subscriber.toMap(),
        documentId: ID.unique(),
      );
      return right(null);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(e.message ?? 'Unexpected error', st),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }
}
