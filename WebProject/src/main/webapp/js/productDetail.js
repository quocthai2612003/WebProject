document.addEventListener("DOMContentLoaded", function() {
    const decreaseButton = document.querySelector('.decrease');
    const increaseButton = document.querySelector('.increase');
    const quantityInput = document.querySelector('.quantity-input');

    decreaseButton.addEventListener('click', function() {
        updateQuantity(-1);
    });

    increaseButton.addEventListener('click', function() {
        updateQuantity(1);
    });

    function updateQuantity(amount) {
        let currentQuantity = parseInt(quantityInput.value);
        currentQuantity += amount;

        if (currentQuantity < 1) {
            currentQuantity = 1;
        }

        quantityInput.value = currentQuantity;
    }
});
// Slidershow
document.getElementById('next').onclick = function (){
    let lists  = document.querySelectorAll('.item');
    document.getElementById('slide').appendChild(lists[0]);
}
document.getElementById('prev').onclick = function (){
    let lists  = document.querySelectorAll('.item');
    document.getElementById('slide').prepend(lists[lists.length - 1]);
}