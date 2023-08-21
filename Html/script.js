window.addEventListener('message', function(event) {
    if (event.data.func == "headbag"){
        if (event.data.boolean) {
            $('.headbag').css('display', 'block')
        } else if (!event.data.boolean) {
            $('.headbag').css('display', 'none')
        }
    }
});