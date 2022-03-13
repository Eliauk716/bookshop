var items = document.getElementsByClassName('item');
var points = document.getElementsByClassName('point');
var goPreBtn = document.getElementById('goPre');
var goNextBtn = document.getElementById('goNext');
var index = 0;
var time = 0;

var cleanActive = function () {
    for (var i = 0; i < items.length; i++) {
        items[i].className = 'item';
    }
    for (var i = 0; i < points.length; i++) {
        points[i].className = 'point';
    }
}

var goIndex = function () {
    cleanActive();
    items[index].className = 'item active';
    points[index].className = 'point active';
}

var goNext = function () {
    if (index < items.length - 1) {
        index++;
    } else {
        index = 0;
    }
    goIndex();
}

var goPre = function () {
    if (index == 0) {
        index = items.length - 1;
    } else {
        index--;
    }
    goIndex();
}

goPreBtn.addEventListener('click', function () {
    goPre();
})
goNextBtn.addEventListener('click', function () {
    goNext();
})

// 点击事件
for (var i = 0; i < points.length; i++) {
    points[i].addEventListener('click', function () {
        var pointIndex = this.getAttribute('index');
        index = pointIndex;
        goIndex();
    })
}

// 定时器
time = setInterval(function () {
    goNext();
}, 5000)

// 鼠标移入关闭定时器
banner.onmouseover = function () {
    clearInterval(time);
}

// 移出开启
banner.onmouseout = function () {
    time = setInterval(function () {
        goNext();
    }, 5000)
}