
class ChatRoomModel {

  final String chatId;

  final List participants;

  final String lastMessage;

  final DateTime createdAt;

  ChatRoomModel({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {

    return {
      'chatId': chatId,
      'participants': participants,
      'lastMessage': lastMessage,
      'createdAt': createdAt,
    };
  }

  factory ChatRoomModel.fromMap(
      Map<String, dynamic> map) {

    return ChatRoomModel(
      chatId: map['chatId'] ?? '',
      participants: map['participants'] ?? [],
      lastMessage: map['lastMessage'] ?? '',
      createdAt:
      map['createdAt'].toDate(),
    );
  }
}