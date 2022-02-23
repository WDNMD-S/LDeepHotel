var usernameObj;
var phoneObj;
var idObj;

var usernameMsg;
var phoneMsg;
var idMsg

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	usernameObj = document.getElementById("name");
	phoneObj = document.getElementById("mobile");
	idObj = document.getElementById("idCard");

	usernameMsg = document.getElementById("nameMsg");
	phoneMsg = document.getElementById("phoneMsg");
	idMsg = document.getElementById("idMsg");
};

function checkForm() {			// 验证整个表单
	var bUsername = checkUsername();
	var bPhone = checkPhone();
	var bidCard = checkId();
	return bUsername && bPhone && bidCard;	// return false后, 事件将被取消
}


function checkUsername() {		// 验证用户名
	var regex = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,9}$/;	// 
	var value = usernameObj.value;// 获取usernameObj中的文本
	var msg = "";						// 最后的提示消息, 默认为空
	if (!value)							// 如果用户名没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
		msg = "用户名必须填写";			// 改变提示消息
	else if (!regex.test(value))		// 如果用户名不能匹配正则表达式规则
		msg = "用户名不合法";			// 改变提示消息
	usernameMsg.innerHTML = msg;		// 将提示消息放入SPAN
	usernameObj.parentNode.style.color = msg == "" ? "black" : "red";	// 根据消息结果改变tr的颜色
	return msg == "";					// 如果提示消息为空则代表没出错, 返回true
}


function checkPhone() {		// 验证号码
	var regex = /^[1][3,4,5,7,8][0-9]{9}$/;			// 指定数字, 11位
	var value = phoneObj.value;
	var msg = "";
	if (!value)
		msg = "号码必须填写";
	else if (!regex.test(value))
		msg = "号码不合法";
	phoneMsg.innerHTML = msg;
	phoneObj.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkId() {		// 验证身份证号码
	var regex = /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;			
	var value = idObj.value;
	var msg = "";
	if (!value)
		msg = "身份证号码必须填写";
	else if (!regex.test(value))
		msg = "身份证号码不合法";
	idMsg.innerHTML = msg;
	idObj.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}
