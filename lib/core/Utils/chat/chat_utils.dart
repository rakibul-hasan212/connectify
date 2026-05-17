class ChatUtils {

  static String generateChatId(
      String uid1,
      String uid2,
      ) {

    List<String> ids = [uid1, uid2];

    ids.sort();

    return ids.join("_");
  }
}