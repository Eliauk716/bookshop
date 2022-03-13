var provinces = ["河北省", "福建省", "浙江省"];
var cities = [
    ["石家庄市", "廊坊市"],
    ["福州市", "泉州市", "厦门市"],
    ["嘉兴市", "宁波市", "温州市"]
];
var areas = [
    [
        ["桥西区", "新华区", "长安区", "裕华区", "井陉区", "藁城区", "鹿泉区", "栾城区"],
        ["安次区", "广阳区", "三河市", "霸州市", "香河县", "永清县", "固安县", "文安县"]
    ],
    [
        ["闽侯县", "连江县", "罗源县", "闽清县", "永泰抄县", "平潭县", "福清市"],
        ["石狮市", "晋江市", "南安市", "惠安县", "安溪县", "永春县", "德化县", "金门县"],
        ["思明区", "湖里区", "集美区", "海沧区", "同安区", "翔安区"]
    ],
    [
        ["南湖区", "秀州区", "海宁市", "桐乡市", "平湖市", "海盐县", "嘉善县"],
        ["海曙区", "江北区", "北仑区", "镇自海区", "鄞州区", "奉化区", "象山县", "宁海县", "余姚市", "慈溪市"],
        ["鹿城区", "瓯海区", "龙湾区", "乐清市", "瑞安市", "永嘉县", "平阳县", "苍南县", "文成县", "泰顺县", "洞头县"]
    ]
];

window.onload = function () {
    initProvince();
    province.onchange = provinceChange;
    city.onchange = cityChange;
};

var province, city, area;

function initProvince() {
    province = document.getElementById("province");
    city = document.getElementById("city");
    area = document.getElementById("area");
    province.options.length = 1;
    for (var i = 0; i < provinces.length; i++) {
        var option = new Option(provinces[i], provinces[i]);
        province.options.add(option);
    }
}

function provinceChange() {
    cityChange();
    city.options.length = 1;
    if (province.selectedIndex == 0) {
        return;
    }
    var pIndex = province.selectedIndex;
    for (var i = 0; i < cities[pIndex - 1].length; i++) {
        var optionValue = cities[pIndex - 1][i];
        var option = new Option(optionValue, optionValue);
        city.options.add(option);
    }
}

function cityChange() {
    area.options.length = 1;
    if (city.selectedIndex == 0) {
        return;
    }
    var pIndex = province.selectedIndex;
    var cIndex = city.selectedIndex;
    for (var i = 0; i < areas[pIndex - 1][cIndex - 1].length; i++) {
        var optionValue = areas[pIndex - 1][cIndex - 1][i];
        var
            option = new Option(optionValue, optionValue);
        area.options.add(option);
    }
}