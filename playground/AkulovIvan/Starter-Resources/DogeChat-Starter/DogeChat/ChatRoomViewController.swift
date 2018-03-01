/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
// http://swiftbook.ru/content/tutorials/real-time-communication-streams-tutorial-ios
// does not work with deployment target < 10.3
// before app starts you need to launch server.
// terminal: cd __directooryWithProject
// sudo ./server          (+password) - you should see "Listening on 127.0.0.1:80". Dont close terminal
// telnet localhost 80                - to join same chat from mac(from new terminal window)

import UIKit

class ChatRoomViewController: UIViewController {
  let tableView = UITableView()
  let messageInputBar = MessageInputView()
    
  var chatRoom = ChatRoom()
  
  var messages = [Message]()
  
  var username = ""
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    chatRoom.delegate = self
    chatRoom.setupNetworkCommunication()
    chatRoom.joinChat(username: username)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

  }
}

//MARK - Message Input Bar
extension ChatRoomViewController: MessageInputDelegate {
  func sendWasTapped(message: String) {
    chatRoom.sendMessage(message: message)
  }
}

extension ChatRoomViewController: ChatRoomDelegate {
    func receivedMessage(message: Message) {
        insertNewMessageCell(message)
    }
}

