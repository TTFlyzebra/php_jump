$(document).ready(function() {
	$('#register').click(function() {
		if ($('#loginname').val() == "") {
			$('#message').html("<font color='red'><b>请输入用户名</b></font>");
			$('#loginname').focus();
			return false;
		}
		
		if ($('#loginword').val() == "") {
			$('#message').html("<font color='red'><b>请输入密码</b></font>");
			$('#loginword').focus();
			return false;
		}
		
		if ($('#loginword2').val() != $('#loginword').val()) {
			$('#message').html("<font color='red'><b>两次输入密码不一致</b></font>");
			$('#loginword2').focus();
			return false;
		}		
		
		
		$('#message').html("");
		
		var loginword = hex_md5(document.getElementById("loginword").value);
		$.ajax({
			url:ajaxurl,
			type:"post",
			data:"loginname=" + $("#loginname").val(),
			dataType:'html',
			success: function(result) {
				if (result.length > 2) {
					$('#message').html("<font color='red'><b>"+result+"</b></font>");
					return false;
				} else {
					$('#message').html("<font color='blue'><b>注册请求已提交！</b></font>");
					document.getElementById("loginword").value = loginword;
					$('#registerFrom').submit();
				}
			}
		});
	});
});
