let getStateRequest = new XMLHttpRequest();
let setStateRequest = new XMLHttpRequest();
let getFriendRequest = new XMLHttpRequest();
let addFriendRequest = new XMLHttpRequest();

function run() {
    document.getElementById("statebutton").onclick = setState;
    document.getElementById("friendbutton").onclick = addFriend;

    getState();
    getFriends();
}

function addFriend() {
    let newFriend = document.getElementById("friendText").value;
    //veel data doorsturen gebruik dan POST
    addFriendRequest.open("POST", "Controller", true);
    addFriendRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    let information = "action=addFriend&friend=" + encodeURIComponent(newFriend);
    addFriendRequest.send(information);
    getFriends();
}

function getFriends() {
    getFriendRequest.open("GET", "Controller?action=getFriends", true);
    getFriendRequest.onreadystatechange = getFriendData;
    getFriendRequest.send(null);
}

function getFriendData() {
    if (getFriendRequest.readyState == 4) {
        if (getFriendRequest.status == 200) {
            let json = JSON.parse(getFriendRequest.responseText);

            let friendlist = document.getElementById("friendlist");

            if (friendlist.childNodes.length > 0) {
                while (friendlist.childNodes[0] != null) {
                    friendlist.removeChild(friendlist.childNodes[0])
                }
            }
            for (let i = 0; i < json.friends.length; i++) {
                let tablerow = document.createElement('tr');
                let name = json.friends[i].name;
                let nametext = document.createTextNode(name);
                let tdname = document.createElement('td');
                tdname.id = "friend_" + i;
                tdname.appendChild(nametext);
                tdname.addEventListener("click", function () {
                    openBox(name);
                });
                let statustext = document.createTextNode(json.friends[i].state);
                let tdstatus = document.createElement('td');
                tdstatus.appendChild(statustext);
                tablerow.appendChild(tdname);
                tablerow.appendChild(tdstatus);
                friendlist.appendChild(tablerow);
            }
        }
        setTimeout("getFriends()", 10000);
    }
}

//status tonen van user + vrienden
function setState() {
    let newState = document.getElementById("stateText").value;
    console.log(newState);
    setStateRequest.open("POST", "Controller", true);
    setStateRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    let information = "action=setState&state=" + encodeURI(newState);
    setStateRequest.send(information);
    getState();
}

function getState() {
    getStateRequest.open("GET", "Controller?action=getState", true);
    getStateRequest.onreadystatechange = getStateData;
    getStateRequest.send(null);
}

function getStateData() {
    if (getStateRequest.readyState == 4) {
        if (getStateRequest.status == 200) {
            let serverResponse = JSON.parse(getStateRequest.responseText);
            let stateXML = serverResponse.state; //state property uit JSON

            let stateDiv = document.getElementById("stateDiv");
            let stateParagraph = stateDiv.childNodes[0];

            if (stateParagraph == null) {
                stateParagraph = document.createElement('div');
                stateParagraph.id = "currentState";
                let stateText = document.createTextNode(stateXML);
                stateParagraph.appendChild(stateText);
                stateDiv.appendChild(stateParagraph);
            } else {
                let stateText = document.createTextNode(stateXML);
                stateParagraph.removeChild(stateParagraph.childNodes[0]);
                stateParagraph.appendChild(stateText);
            }
        }
    }
}


//