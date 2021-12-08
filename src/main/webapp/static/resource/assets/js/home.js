//鐝骇鏁版嵁灞曠ず
var editor;


var editor = new function () {
    var me = this;

    this.init = function () {

    }

    this.loadFromServer = function () {
        var me = this;
        Esms.doAjax(null, { url: HOST_URL +  "api/services/app/DataShow/GetHomDataShow", method: "GET" }, function (result) {
            document.getElementById("classCount").innerHTML = result.classCount + "涓�";
            document.getElementById("problemCount").innerHTML = result.problemCount + "閬�";
            document.getElementById("knowledgePointCount").innerHTML = result.knowledgePointCount + "澶�";
            me.loadCharts(result);
        });
    }
    this.loadCharts = function (result) {
        this.loadClassList(result.classList);
        this.loadKnowledgePointList(result.knowledgePointList);
        this.loadCompetitionStudentCharts(result.competitionStudent);
    }
    this.loadClassList = function (classList) {
        var li = '';
        for (var i = 0; i < classList.length; i++) {
            var item = classList[i];
            li += '<li>' + item + '</li>';
        }
        document.getElementById("classList").innerHTML = li;
    }
    this.loadKnowledgePointList = function (knowledgePointList) {
        var li = '';
        for (var i = 0; i < knowledgePointList.length; i++) {
            var item = knowledgePointList[i];
            li += '<li>' + item + '</li>';
        }
        document.getElementById("knowledgePointList").innerHTML = li;
    }
    this.loadCompetitionStudentCharts = function (competitionStudent) {
        var classs = [];
        var student = [];
        var co = [];
        for (var i = 0; i < competitionStudent.length; i++) {
            var item = competitionStudent[i];
            classs.push(item.className);
            student.push(item.studentCount);
            co.push(item.competitionCount);
        }
        var myChart = echarts.init(document.getElementById('accuracy'));
        var option = {
            title: {
                text: '鐝骇绔炶禌涓庡鐢熶汉鏁扮粺璁�',
                left: 'center'
            },
            color: ['#CC3333', '#99CC66'],
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 鍧愭爣杞存寚绀哄櫒锛屽潗鏍囪酱瑙﹀彂鏈夋晥
                    type: 'shadow'        // 榛樿涓虹洿绾匡紝鍙€変负锛�'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            legend: {
                left: 'right',
                data: ["绔炶禌娆℃暟", "瀛︾敓浜烘暟"]
            },
            xAxis: [
                {
                    type: 'category',
                    data: classs,
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '绔炶禌娆℃暟',
                    type: 'bar',
                    data: co,
                    itemStyle: {
                        normal: {
                            label: {
                                show: true, //寮€鍚樉绀�
                                position: 'top', //鍦ㄤ笂鏂规樉绀�
                                textStyle: { //鏁板€兼牱寮�
                                    color: 'black',
                                    fontSize: 16
                                }
                            }
                        }
                    },
                },
                {
                    name: '瀛︾敓浜烘暟',
                    type: 'bar',
                    data: student,
                    itemStyle: {
                        normal: {
                            label: {
                                show: true, //寮€鍚樉绀�
                                position: 'top', //鍦ㄤ笂鏂规樉绀�
                                textStyle: { //鏁板€兼牱寮�
                                    color: 'black',
                                    fontSize: 16
                                }
                            }
                        }
                    },
                }
            ]
        };
        myChart.setOption(option);
        window.addEventListener("resize", function () {
            myChart.resize();
        });
    }
};




function initDom() {

    editor.init();
}


function init() {
    initDom();
    editor.loadFromServer(queryString.id);
}

init();

