<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script type="text/javascript">
        function request(urlMapping) {
            ajax({
                url: urlMapping,              //请求地址
                type: "POST",                       //请求方式
                data: {userid:3},        //请求参数
                dataType: "json",
                success: function (response, xml) {
                    let objs = JSON.parse(response)
                    let tb = get("tb")
                    let tab = '<table border = 1 width=500>'
                    tab += "<tr> <td>标题</td> <td>内容</td> <td>时间戳</td></tr>"
                    for (let i in objs) {
                        tab +='<tr>'
                        let count = -1
                        for (let j in objs[i]) {
                            ++count;
                            if (count == 0 || count >= 4) continue
                            tab +="<td>" + objs[i][j] + "</td>"
                        }
                    }
                    tab += '</table>'
                    setAttr(tb, tab)
                },
                fail: function (status) {

                }
            });
        }

        function sleep(milliSeconds) {
            var startTime = new Date().getTime();
            while (new Date().getTime() < startTime + milliSeconds) {
                console.log(new Date().getTime());
            }//暂停一段时间 10000=1S。
        }

        function get(id) {
            return document.getElementById(id)
        }

        function setAttr(ori, attr) {
            ori.innerHTML = attr;
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
    </script>

    <!--    <script type="text/javascript" src="/static/jQuery.js"/>-->
    <script type="text/javascript">

        window.onload = function () {
            get("btn_click").onclick = function () {
                request("getUserArticle")
            }
        }
    </script>

</head>
<body>

<button id = "btn_click" type="button" >Click Me!</button>

<div id = "tb"></div>

</table>
</body>
</html>