let chatSessions = [];

function openBox(friendName) {
    if (!chatSessions.includes(friendName)) {
        chatSessions.push(friendName);
        startConversation(friendName);
        let messages = document.getElementById("messages");
        let messageBox = document.createElement("div");
        messageBox.className = "messageBox";
        messageBox.id = friendName + "messageBox";
        let name = document.createElement("p");
        name.className = "name";
        name.id = friendName + "name";
        name.textContent = friendName;
        name.addEventListener("click", function () {
            console.log('lol');
            closeBox(friendName);
        });
        let content = document.createElement("div");
        content.className = "content";
        content.id = friendName + "content";
        let message = document.createElement("div");
        message.className = "message";
        message.id = friendName + "message";
        let messageText = document.createElement("input");
        messageText.className = "messageText";
        messageText.id = friendName + "messageText";
        messageText.type = 'text';
        messageText.placeholder = 'Type a message';
        messageText.addEventListener('keyup', function (e) {
            if (e.keyCode === 13) {
                addToConversation(friendName);
            }
        });
        let sendButton = document.createElement("button");
        sendButton.id = friendName + "button";
        sendButton.className = "sendButton";
        sendButton.textContent = "send";
        sendButton.addEventListener("click", function () {
            addToConversation(friendName);
        });
        message.appendChild(messageText);
        message.appendChild(sendButton);
        messageBox.append(name);
        messageBox.append(content);
        messageBox.append(message);
        messages.append(messageBox);
    }else{
        let id = friendName + "messageBox";
        $('#' + id).toggle("fold");
    }
}


function startConversation(friendName) {
    $.ajax({
        type: "GET",
        url: "Controller",
        data: {
            'action': 'startConv',
            'friend': friendName
        },
        success: function (output) {
            let id = friendName+"content";
            let contentBox = $('#' + id);
            contentBox.empty();
            for(let i = 0; i < output.content.length; i++){
                let user = output.content[i].split(":")[0];
                let message = output.content[i].split(":")[1].replace(/%20/g, " ");
                let classs = "\"self\"";
                if (user === friendName) {
                    classs = "\"friend\"";
                }
                contentBox.append("<p class=" + classs + ">" + message + "</p>");
            }
        },
        error: function () {
            alert("Er is iets fout gelopen");
        }
    });
    setTimeout(startConversation, 50000, friendName);
}

function addToConversation(friendName) {
    let id = friendName + "messageText";
    let textBox = $('#' + id + ':text');
    let message = textBox.val();
    if (message !== "") {
        textBox.val('');
        $.ajax({
            type: "POST",
            url: "Controller",
            data: {
                'action': 'addToConv',
                'friend': friendName,
                'message': encodeURI(message)
            }
        });
        startConversation(friendName);
    }
}

function closeBox(friendName) {
    let id = friendName + "messageBox";
    console.log('toggled ' + id);
    $('#' + id).toggle("blind");
}