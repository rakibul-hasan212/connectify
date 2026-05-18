class ChatRoomModel {

  final String chatId;
  final List participants;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChatRoomModel({
    required this.chatId,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  factory ChatRoomModel.fromMap(Map<String, dynamic> map) {
    return ChatRoomModel(
      chatId: map['chatId'] ?? '',
      participants: map['participants'] ?? [],
      lastMessage: map['lastMessage'] ?? '',
      lastMessageTime: map['lastMessageTime'].toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
    };
  }
}