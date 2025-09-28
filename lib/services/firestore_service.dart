import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lconnect/model/group_chat_model.dart';
import 'package:lconnect/model/message_model.dart';
import 'package:lconnect/model/user_model.dart';


class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 🔹 USERS
  Future<void> createUser(UserModel user) async {
    await _db.collection('users').doc(user.id).set(user.toMap());
  }

  Future<UserModel?> getUser(String userId) async {
    final doc = await _db.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Stream<UserModel?> streamUser(String userId) {
    return _db.collection('users').doc(userId).snapshots().map((doc) {
      if (doc.exists) {
        return UserModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }
      return null;
    });
  }

  // 🔹 MATCHES
  Future<void> createMatch(String userA, String userB) async {
    final matchId = "${userA}_$userB";
    await _db.collection('matches').doc(matchId).set({
      "users": [userA, userB],
      "createdAt": FieldValue.serverTimestamp(),
      "lastMessage": "",
      "lastMessageAt": FieldValue.serverTimestamp(),
    });
  }

  Stream<List<Map<String, dynamic>>> streamMatches(String userId) {
    return _db
        .collection('matches')
        .where('users', arrayContains: userId)
        .snapshots()
        .map((snap) => snap.docs.map((d) => d.data()).toList());
  }

  // 🔹 PRIVATE CHATS
  Future<void> sendPrivateMessage(String chatId, MessageModel message) async {
    await _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add(message.toMap());

    // update last message on parent doc
    await _db.collection('chats').doc(chatId).set({
      "users": message.id.split("_"), // assumes chatId like user1_user2
      "lastMessage": message.text,
      "lastMessageAt": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Stream<List<MessageModel>> streamPrivateMessages(String chatId) {
    return _db
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) =>
        snap.docs.map((d) => MessageModel.fromMap(d.id, d.data())).toList());
  }

  // 🔹 GROUP CHATS
  Future<void> createGroup(GroupChatModel group) async {
    await _db.collection('groupChats').doc(group.id).set(group.toMap());
  }

  Future<void> sendGroupMessage(String groupId, MessageModel message) async {
    await _db
        .collection('groupChats')
        .doc(groupId)
        .collection('messages')
        .add(message.toMap());

    // update last message on group doc
    await _db.collection('groupChats').doc(groupId).set({
      "lastMessage": message.text,
      "lastMessageAt": FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Stream<List<MessageModel>> streamGroupMessages(String groupId) {
    return _db
        .collection('groupChats')
        .doc(groupId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snap) =>
        snap.docs.map((d) => MessageModel.fromMap(d.id, d.data())).toList());
  }

  Stream<List<GroupChatModel>> streamGroups() {
    return _db.collection('groupChats').snapshots().map((snap) => snap.docs
        .map((d) => GroupChatModel.fromMap(d.id, d.data()))
        .toList());
  }
}
