//Varibles or Selector
let header = document.querySelector('.header');
let menu = document.querySelector('.menu');

menu.addEventListener('click', function(){
    header.classList.toggle('menu-open'); 
})

var MenuItems = document.getElementById("MenuItems");
        
        MenuItems.style.maxHeight = "0px";
        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px") {
              MenuItems.style.maxHeight = "200px";  
            }
            else {
                MenuItems.style.maxHeight = "0px";
            }
        }