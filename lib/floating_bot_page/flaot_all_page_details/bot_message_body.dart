import 'package:flutter/material.dart';
import 'package:onboarding_flutter_app/floating_bot_page/chat_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BotMessageBody());
}

class BotMessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  void _replyToMessage(String message) {
    setState(() {
      _controller.text = 'Replying to: $message';
    });
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Increase AppBar height
        child: AppBar(
          backgroundColor:
              const Color(0xff1760AB), // Set the AppBar background color
          iconTheme:
              const IconThemeData(color: Colors.white), // Set the icon color
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/tick.png'), // Add an avatar image in your assets
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Chat Bot',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white), // Set the text color
                    ),
                    Text(
                      'online',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(
                              179, 71, 255, 10)), // Set the text color
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.video_call),
            //   onPressed: () {
            //     // Handle video call action
            //   },
            // ),
            // IconButton(
            //   icon: const Icon(Icons.attach_file_rounded),
            //   onPressed: () {
            //     // Handle call action
            //   },
            // ),
            Opacity(
              opacity: 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                  ),
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22, vertical: 15), // Background color
                ),
                onPressed: () {
                  // Define your onPressed functionality here
                },
                child: const Text(
                  'FAQ',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                // Handle more actions
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                return ListView.builder(
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      message: chatProvider.messages[index],
                      onReply: _replyToMessage,
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 45, top: 35),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20), // Set padding
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xff1760AB),
                        ), // Set border color
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.mic,
                          color: Color(0xff1760AB),
                        ),
                        onPressed: () {
                          Provider.of<ChatProvider>(context, listen: false)
                              .sendMessage(_controller.text);
                          _controller.clear();
                        },
                      ), // Set icon color
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Icons.attach_file_rounded,
                          color: Color(0xff1760AB),
                        ),
                        onPressed: () {
                          Provider.of<ChatProvider>(context, listen: false)
                              .sendMessage(_controller.text);
                          _controller.clear();
                        },
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: Icon(Icons.send, color: Colors.green[700]), // Set icon color
                //   onPressed: () {
                //     Provider.of<ChatProvider>(context, listen: false)
                //         .sendMessage(_controller.text);
                //     _controller.clear();
                //   },
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final Message message;
  final Function(String) onReply;

  ChatBubble({required this.message, required this.onReply});

  @override
  Widget build(BuildContext context) {
    bool isUserMessage = message.sender == 'User';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isUserMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment:
                isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: <Widget>[
              if (!isUserMessage)
                CircleAvatar(
                  child: Text(message.sender[0]),
                ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: isUserMessage
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? const Color.fromARGB(255, 16, 101, 185)
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Text(
                    message.timestamp,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              if (isUserMessage) const SizedBox(width: 10),
              if (isUserMessage)
                CircleAvatar(
                  child: Text(message.sender[0]),
                ),
            ],
          ),
          // Add a Chip widget under the message body
          if (isUserMessage) // Only show chip for user messages
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0), // Space between message and chip
              child: GestureDetector(
                onTap: () {
                  onReply(message.text); // Handle chip click to open reply
                },
                child: const Chip(
                  label: Text(
                    'Reply Admin...',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  backgroundColor:
                      Color.fromARGB(255, 5, 120, 234), // Chip background color
                ),
              ),
            ),
        ],
      ),
    );
  }
}
