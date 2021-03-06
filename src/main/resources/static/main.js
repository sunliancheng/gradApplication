
var RequestUrl = "127.0.0.1:8080";


var params = {
    key1: "value",
    key2: "value"
};

function request() {
    window.alert(RequestUrl)
    ajax({
        url: RequestUrl + "/getUsers",              //请求地址
        type: "POST",                       //请求方式
        data: {},        //请求参数
        dataType: "json",
        success: function (response, xml) {
            // 此处放成功后执行的代码
            window.alert(response)
            window.alert(xml)
        },
        fail: function (status) {
            // 此处放失败后执行的代码
            window.alert(status)

        }
    });

}

function ajax(options) {
    /**
     * 传入方式默认为对象
     * */
    options = options || {};
    /**
     * 默认为GET请求
     * */
    options.type = (options.type || "GET").toUpperCase();
    /**
     * 返回值类型默认为json
     * */
    options.dataType = options.dataType || 'json';
    /**
     * 默认为异步请求
     * */
    options.async = options.async || true;
    /**
     * 对需要传入的参数的处理
     * */
    var params = getParams(options.data);
    var xhr;
    /**
     * 创建一个 ajax请求
     * W3C标准和IE标准
     */
    if (window.XMLHttpRequest){
        /**
         * W3C标准
         * */
        xhr = new XMLHttpRequest();
    }else{
        /**
         * IE标准
         * @type {ActiveXObject}
         */
        xhr = new ActiveXObject('Microsoft.XMLHTTP')
    }
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4){
            var status = xhr.status;
            if (status >= 200 && status < 300 ){
                options.success && options.success(xhr.responseText,xhr.responseXML);
            }else{
                options.fail && options.fail(status);
            }
        }
    };
    if (options.type == 'GET'){
        xhr.open("GET",options.url + '?' + params ,options.async);
        xhr.send(null)
    }else if (options.type == 'POST'){
        /**
         *打开请求
         * */
        xhr.open('POST',options.url,options.async);
        /**
         * POST请求设置请求头
         * */
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        /**
         * 发送请求参数
         */
        xhr.send(params);
    }
}
/**
 * 对象参数的处理
 * @param data
 * @returns {string}
 */
function getParams(data) {
    var arr = [];
    for (var param in data){
        arr.push(encodeURIComponent(param) + '=' +encodeURIComponent(data[param]));
    }
    console.log(arr);
    arr.push(('randomNumber=' + Math.random()).replace('.'));
    console.log(arr);
    return arr.join('&');
}
