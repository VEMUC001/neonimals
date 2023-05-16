import 'package:appwrite/appwrite.dart';
import 'package:cinsie_neonimals/constants/appwrite_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appWriteClientProvider = Provider(
  (ref) {
    return Client()
        .setEndpoint(AppwriteConstants.endPoint)
        .setProject(AppwriteConstants.projectId)
        .setSelfSigned(status: true);
  },
);

final appwriteDatabaseProvider = Provider((ref) {
  final client = ref.watch(appWriteClientProvider);
  return Databases(client);
});
