$( document ).on('ready page:load', function () {
    update();
});
// Set the date we're counting down to.
var target_date = new Date("Sept 06, 2014").getTime();
 
// Variables for time units.
var days, hours, minutes, seconds;
 
// Get the elements that will hold the numbers.
var $days = document.getElementById("d");
var $hours = document.getElementById("h");
var $minutes = document.getElementById("m");
var $seconds = document.getElementById("s");
var $target_date = document.getElementById("td");

// Calculate the countdown clock and set the HTML.
function update() {
    // Find the amount of "seconds" between now and target.
    var current_date = new Date().getTime();
    var seconds_left = (target_date - current_date) / 1000;
 
    // Do some time calculations.
    days = parseInt(seconds_left / 86400);
    seconds_left = seconds_left % 86400;
     
    hours = parseInt(seconds_left / 3600);
    seconds_left = seconds_left % 3600;
     
    minutes = parseInt(seconds_left / 60);
    seconds = parseInt(seconds_left % 60);
     
    // Format the number strings and put them in the elements.
    console.log($days.innerHTML = pad(days, 2));
    $hours.innerHTML = pad(hours, 2);
    $minutes.innerHTML = pad(minutes, 2);
    $seconds.innerHTML = pad(seconds, 2);
    // $target_date.innerHTML = target_date;
}

// Immediately update the HTML.
// The white boxes are blank otherwise.
update();

// Now update our number elements every 1 second.
setInterval(update, 1000); // 1000 milliseconds = 1 second

// This looks much better with leading zeros, don't you agree?
// If num has less than size digits, add enough 0s to the front.
function pad(num, size) {
    var s = num+"";
    while (s.length < size) s = "0" + s;
    return s;
}
