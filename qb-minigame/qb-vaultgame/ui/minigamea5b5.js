let timer_start, timer_game, timer_finish, timer_time, answer, wrong, right, speed, numbers, timerStart, positions;
let game_started = false;

var speedes = 10;
var numberslength = 6;

const sleep = (ms, fn) => {return setTimeout(fn, ms)};

const rangeNumbers = (length = 1) => {
    return Array.from({length}, _ => Math.floor(Math.random() * 10))
}

window.addEventListener("message", function (event) {
    let data = event.data;
    switch (data.type)
    {
    case 'open':
        numberslength = data.lenght;
        speedes = data.time;
        $(".minigame").css("display", "block");
        resetTimer();
        clearTimeout(timer_start);
        clearTimeout(timer_game);
        clearTimeout(timer_finish);
        start();
        break;
    }
});

window.addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        var checks = $('.input').css('display');
        if(checks == "none"){
        } else{
            check();
        }
    }
});

function check(){
    stopTimer();

    let response = document.querySelector('#answer').value.toLowerCase().trim();

    if(game_started && response === answer.join('')){
        $('.input').css('display', 'none')
        $('.splash').removeClass("hidden");
        $('.splash').html('<div class="fa hacker">&#xf21b;</div>Input password complete')
        $.post('http://qb-vaultgame/callback', JSON.stringify({'success': true}));
        setTimeout(function () {
            $(".minigame").css("display", "none");
            location.reload()
        },1500)
    }else{
        $('.input').css('display', 'none')
        $('.splash').removeClass("hidden");
        $('.splash').html('<div class="fa hacker">&#xf21b;</div>Input password failed')
        $.post('http://qb-vaultgame/callback', JSON.stringify({'success': false}));
        setTimeout(function () {
            $(".minigame").css("display", "none");
            location.reload()
        },1500)
    }
}

function reset(){
    game_started = false;

    resetTimer();
    clearTimeout(timer_start);
    clearTimeout(timer_game);
    clearTimeout(timer_finish);

    start();
}

function start(){
    numbers = numberslength;
    answer = rangeNumbers(numbers);
    document.querySelector('.minigame .numbers').innerHTML = answer.join('');

    timer_start = sleep(2000, function(){
        document.querySelector('.splash').classList.add('hidden');
        document.querySelector('.minigame .numbers').classList.remove('hidden');

        timer_game = sleep(3000, function(){
            document.querySelector('.minigame .numbers').classList.add('hidden');
            document.querySelector('.minigame .input').classList.remove('hidden');

            game_started = true;
            startTimer();

            document.querySelector('#answer').focus({preventScroll: true});

            speed = speedes;
            timer_finish = sleep((speed * 1000), function(){
                game_started = false;
                check();
            });
        });
    });
}

function startTimer(){
    timerStart = new Date();
    timer_time = setInterval(timer,1);
}
function timer(){
    let timerNow = new Date();
    let timerDiff = new Date();
    timerDiff.setTime(timerNow - timerStart);
    let ms = timerDiff.getMilliseconds();
    let sec = timerDiff.getSeconds();
    if (ms < 10) {ms = "00"+ms;}else if (ms < 100) {ms = "0"+ms;}
}
function stopTimer(){
    clearInterval(timer_time);
}
function resetTimer(){
    clearInterval(timer_time);
}