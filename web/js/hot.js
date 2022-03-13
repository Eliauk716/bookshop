var JSONData = {
    name: "热门推荐",
    srcPath: "../image/",
    data: [{
            href: "#",
            src: "bookrec01.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec02.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec03.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec04.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec05.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec06.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec07.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec08.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec09.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "bookrec10.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like01.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like02.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like03.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like04.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like05.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like06.jpg",
            price: 45.0,
        },
        {
            href: "#",
            src: "like07.jpg",
            price: 45.0,
        },
    ]
};
window.onload = function () {
    var adviseContent =
        '<p class="book_title">' + JSONData.name + '</p><ul class="pic_list">';
    var turnShow = getRandomNum(9, 0, 17);
    for (var i = 0; i < turnShow.length; i++) {
        var index = turnShow[i];
        adviseContent = adviseContent +
            '<li class="slide"><div class="list_img"><a href="' +
            JSONData.data[index].href + '"><img src="' +
            JSONData.srcPath + JSONData.data[index].src +
            '"/></a></div><div class="price">￥' + JSONData.data[index].price +
            "</div></li>";
    }
    adviseContent = adviseContent + "</ul>";
    document.getElementsByClassName("right_nav")[0].innerHTML = adviseContent;
};
window.setInterval("showHotAdvise()", 3000);

function showHotAdvise() {
    var adviseContent = '<p class="book_title">' + JSONData.name +
        '</p> <ul class = "pic_list" > ';
    var turnShow = getRandomNum(9, 0, 14);
    for (var i = 0; i < turnShow.length; i++) {
        var index = turnShow[i];
        adviseContent = adviseContent +
            '<li class="slide"><div class="list_img"><a href="' +
            JSONData.data[index].href + '"><img src="' +
            JSONData.srcPath + JSONData.data[index].src +
            '"/></a></div><div class="price">￥' + JSONData.data[index].price +
            "</div></li>";
    }
    adviseContent = adviseContent + "</ul>";
    document.getElementsByClassName("right_nav")[0].innerHTML = adviseContent;
}

function getRandomNum(num, minNum, maxNum) {
    var array = new Array();
    for (var i = 0; i < num; i++) {
        do {
            var randomNum = Math.floor(Math.random() * maxNum + minNum);
            if (!checkNum(array, randomNum)) {
                array.push(randomNum);
                break;
            }
        } while (true);
    }
    return array;
}

function checkNum(array, num) {
    for (var i = 0; i < array.length; i++) {
        if (array[i] == num) {
            return true;
        }
    }
    return false;
}