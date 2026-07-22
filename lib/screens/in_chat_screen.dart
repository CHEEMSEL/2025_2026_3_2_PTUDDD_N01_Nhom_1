import 'package:flutter/material.dart';

class InChatScreen extends StatelessWidget {
  final String username;
  const InChatScreen({
    super.key,
    this.username = "No one",
  });

  final String currentUserId = "my_ID"; // Fetch login và so sánh sau

  final List<Map<String, dynamic>> mockMessages = const [
    {
      "senderId": "user_01",
      "text": "Message 1",
      "time": "10:30 AM",
    },
    {
      "senderId": "my_ID",
      "text": "Message 2",
      "time": "10:31 AM",
    },
    {
      "senderId": "user_01",
      "text": "Test Message 3",
      "time": "10:32 AM",
    },
    {
      "senderId": "my_ID",
      "text": "Ahawdwadawdwad",
      "time": "10:33 AM",
    },
    {
      "senderId": "user_01",
      "text": "👍👍👍👍👍👍👍👍👍",
      "time": "10:35 AM",
    },
  ];
  static List<String> state = ["Online", "Offline", "Typing..."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          CircleAvatar(
            backgroundColor: Colors.grey[500],
            child: Text(
              username.isNotEmpty ? username[0].toUpperCase() : "?",
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(username),
              Text(
                state[2],
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              )
            ],
          )
        ]),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      //Phần chat
      body: Column(children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: mockMessages.length,
            itemBuilder: (context, index) {
              final message = mockMessages[index];
              final bool isMe = message['senderId'] == currentUserId;
              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      // Logic sau
                    },
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 10.0),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['text'],
                              style: TextStyle(
                                color: isMe ? Colors.white : Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              message['time'],
                              style: TextStyle(
                                color: isMe ? Colors.white70 : Colors.black54,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ))),
              );
            },
          ),
        ),
        //Ô nhập tin
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            border: Border(
                top: BorderSide(color: Colors.grey.shade800, width: 0.5)),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add, color: Colors.blueAccent),
                onPressed: () {
                  //Nothing :D
                },
              ),
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Nhập tin nhắn...",
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[800],
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 6),
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white, size: 20),
                  onPressed: () {
                    //Nút bấm gửi tạm thời
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
