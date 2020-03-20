import consumer from "./consumer"

document.addEventListener('turbolinks:load', function() {
  let liveChatDiv = document.getElementById('live-chat');
  if (liveChatDiv) {
    let owner_id = document.getElementById('owner_id').value;
    let inputMessage = document.getElementById('message_msg');
    consumer.subscriptions.create({channel: "ChatChannel", owner: owner_id}, {
      connected() {
        console.log('connect')
      },
    
      disconnected() {
        console.log('disconect')
      },
    
      received(data) {
        const message = document.createElement('h3');
        message.innerText = data.message;
        liveChatDiv.appendChild(message);
        inputMessage.value = '';
      }
    });
  }
})
