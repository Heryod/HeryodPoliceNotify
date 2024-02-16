const code = document.getElementById('code');
const title = document.getElementById('alert-name');
const content = document.getElementById('alert-info');
const locationName = document.getElementById('street-name');
const notification = document.getElementById('notification');


window.addEventListener('message', function(event){
    let e = event.data;
    if(e.action=='update'){
        code.textContent = e.sendCode;
        title.textContent = e.sendTitle;
        content.textContent = e.sendContent;
        locationName.textContent = e.sendLocation;

        notification.style.display = 'block';

        setTimeout(function() {
            notification.style.display = 'none';
        }, 30000); // 30 sekund
    }
})