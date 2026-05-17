
import 'package:flutter/material.dart';

class DemoHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// CURRENT USER SECTION
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.blue.shade50,

              borderRadius:
              BorderRadius.circular(20),
            ),

            child: Row(
              children: [

                const CircleAvatar(
                  radius: 30,

                  backgroundImage:
                  NetworkImage(
                    "https://i.pravatar.cc/300",
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Rakibul Hasan",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        "Welcome back 👋",

                        style: TextStyle(
                          color: Colors
                              .grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: 12,
                  height: 12,

                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          /// CHAT HEADER
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),

            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "Recent Chats",

                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "12 Chats",

                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          /// CHAT LIST
          Expanded(
            child: ListView.builder(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              itemCount: 10,

              itemBuilder: (context, index) {

                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 12,
                  ),

                  padding: const EdgeInsets.all(12),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(
                      18,
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black
                            .withOpacity(0.05),

                        blurRadius: 10,
                        offset:
                        const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      /// PROFILE IMAGE
                      Stack(
                        children: [

                          const CircleAvatar(
                            radius: 28,

                            backgroundImage:
                            NetworkImage(
                              "https://i.pravatar.cc/300",
                            ),
                          ),

                          Positioned(
                            right: 0,
                            bottom: 0,

                            child: Container(
                              width: 14,
                              height: 14,

                              decoration:
                              BoxDecoration(
                                color: Colors.green,

                                shape:
                                BoxShape.circle,

                                border: Border.all(
                                  color:
                                  Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 15),

                      /// CHAT INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                          children: [

                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                              children: [

                                const Text(
                                  "John Doe",

                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight
                                        .bold,
                                  ),
                                ),

                                Text(
                                  "2:30 PM",

                                  style: TextStyle(
                                    color: Colors
                                        .grey
                                        .shade600,

                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(
                              height: 6,
                            ),

                            Row(
                              children: [

                                Expanded(
                                  child: Text(
                                    "Hey! How are you doing today?",

                                    maxLines: 1,

                                    overflow:
                                    TextOverflow
                                        .ellipsis,

                                    style: TextStyle(
                                      color: Colors
                                          .grey
                                          .shade700,
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                Container(
                                  padding:
                                  const EdgeInsets
                                      .all(6),

                                  decoration:
                                  const BoxDecoration(
                                    color:
                                    Colors.blue,

                                    shape:
                                    BoxShape.circle,
                                  ),

                                  child: const Text(
                                    "2",

                                    style:
                                    TextStyle(
                                      color:
                                      Colors
                                          .white,

                                      fontSize:
                                      12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}