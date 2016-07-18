$(document)
		.ready(
				function() {
					var b = $("#liAddAddrTools");
					var f = $("#addrIDOther");
					var g = $("#liAddAddrBox");
					var d = $("#btnSubmitCart");
					var c = $("#userId").val();
					f
							.unbind("click")
							.bind(
									"click",
									function() {
										g.show();
										b.hide();
										$("#msgAddrOver").hide();
										$("[name=selectAddrID]").attr(
												"checked", false);
										$
												.ajax({
													url : "/user/getProvinceList.html",
													success : function(k) {
														var j = '<option value="0">\u3000\u3000\u3000\u3000\u3000</option>';
														for (var h = 0; h < k.length; h++) {
															j += '<option value="'
																	+ k[h][0]
																	+ '">'
																	+ k[h][1]
																	+ "</option>"
														}
														$("#shipAreaA").html(j)
													},
													error : function() {
														alert("\u83b7\u53d6\u5730\u533a\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\uff01")
													}
												});
										$("#shipAreaB")
												.html(
														'<option value="0">\u3000\u3000\u3000\u3000\u3000</option>');
										$("#shipAreaC")
												.html(
														'<option value="0">\u3000\u3000\u3000\u3000\u3000</option>');
										$("#shipAreaA")
												.change(
														function() {
															$
																	.ajax({
																		url : "/user/getCityList.html",
																		data : "id="
																				+ $(
																						"#shipAreaA")
																						.val(),
																		success : function(
																				k) {
																			var j = '<option value="0">\u3000\u3000\u3000\u3000\u3000</option>';
																			for (var h = 0; h < k.length; h++) {
																				j += '<option value="'
																						+ k[h][0]
																						+ '">'
																						+ k[h][1]
																						+ "</option>"
																			}
																			$(
																					"#shipAreaB")
																					.html(
																							j);
																			$(
																					"#shipAreaC")
																					.html(
																							'<option value="0">\u3000\u3000\u3000\u3000\u3000</option>')
																		},
																		error : function() {
																			alert("\u83b7\u53d6\u5730\u533a\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\uff01")
																		}
																	})
														});
										$("#shipAreaB")
												.change(
														function() {
															var j = $(
																	"#shipAreaB")
																	.val();
															var h = $(
																	"#shipAreaB option:selected")
																	.text();
															$
																	.ajax({
																		url : "/user/getDistrictList.html",
																		data : "id="
																				+ j,
																		success : function(
																				m) {
																			var l = '<option value="0">\u3000\u3000\u3000\u3000\u3000</option>';
																			if (m == "") {
																				l += '<option value="'
																						+ k
																						+ '">'
																						+ h
																						+ "</option>"
																			} else {
																				for (var k = 0; k < m.length; k++) {
																					l += '<option value="'
																							+ m[k][0]
																							+ '">'
																							+ m[k][1]
																							+ "</option>"
																				}
																			}
																			$(
																					"#shipAreaC")
																					.html(
																							l)
																		},
																		error : function() {
																			alert("\u83b7\u53d6\u5730\u533a\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5\uff01")
																		}
																	})
														})
									});
					$("[name=selectAddrID]").unbind("click").bind("click",
							function() {
								g.hide();
								b.show();
								$("#addrIDOther").attr("checked", false)
							});
					$("#btn_consignee_save")
							.unbind("click")
							.bind(
									"click",
									function() {
										if ($("#shipAreaA").val() == 0
												|| $("#shipAreaB").val() == 0
												|| $("#shipAreaC").val() == 0) {
											$("#shipAreaValidMsg")
													.html(
															'<p class="error"><s></s>\u8bf7\u6b63\u786e\u9009\u62e9\u7701\u5e02\u533a</p>');
											return false
										} else {
											$("#shipAreaValidMsg").html("")
										}
										if ($("#shipAddress").val() == "") {
											$("#shipAddressValidMsg")
													.html(
															'<p class="error"><s></s>\u8bf7\u8f93\u5165\u8857\u9053\u5730\u5740\uff0c\u4e0d\u8981\u91cd\u590d\u8f93\u5165\u7701\u5e02\u533a\u540d\u79f0</p>');
											return false
										} else {
											$("#shipAddressValidMsg").html("")
										}
										if ($("#shipName").val() == "") {
											$("#shipNameValidMsg")
													.html(
															'<p class="error"><s></s>\u8bf7\u8f93\u5165\u6536\u8d27\u4eba\u59d3\u540d</p>');
											return false
										} else {
											$("#shipNameValidMsg").html("")
										}
										if ($("#shipMobile").val() == "") {
											$("#shipMobileValidMsg")
													.html(
															'<p class="error"><s></s>\u8bf7\u8f93\u5165\u624b\u673a\u53f7\u7801</p>');
											return false
										} else {
											$("#shipMobileValidMsg").html("")
										}
										var h = {
											userId : c,
											province : $(
													"#shipAreaA > option:checked")
													.text(),
											city : $(
													"#shipAreaB > option:checked")
													.text(),
											district : $(
													"#shipAreaC > option:checked")
													.text(),
											address : $("#shipAddress").val(),
											zipCode : $("#shipZip").val() == "" ? 0
													: $("#shipZip").val(),
											consignee : $("#shipName").val(),
											phone : $("#shipMobile").val()
										};
										h = e(h);
										$
												.ajax({
													url : "/user/addAddress.html",
													data : "userJSON="
															+ encodeURIComponent(h),
													success : function(i) {
														if (i == "success") {
															$
																	.PageDialog(
																			'<dl class="sAltOK"><dd>\u64cd\u4f5c\u6210\u529f\uff01</dd></dl>',
																			{
																				W : 160,
																				H : 50,
																				autoClose : true
																			});
															location.reload()
														} else {
															if (i == "sizeError") {
																$
																		.PageDialog(
																				'<dl class="sAltFail"><dd>\u5bf9\u4e0d\u8d77\uff0c\u6700\u591a\u53ea\u80fd\u5f55\u51654\u4e2a\u6536\u8d27\u5730\u5740\uff0c\u8bf7\u5220\u9664\u5176\u4e2d\u7684\u67d0\u4e2a\u6536\u8d27\u5730\u5740\uff01</dd></dl>',
																				{
																					W : 430,
																					H : 50
																				})
															}
														}
													},
													error : function() {
														alert("\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u4e0e\u7ba1\u7406\u5458\u8054\u7cfb\uff01");
														location.reload()
													}
												})
									});
					$("#btn_consignee_cancle").unbind("click").bind(
							"click",
							function() {
								g.hide();
								b.show();
								$("[name=selectAddrID]:eq(0)").attr("checked",
										true);
								$("#addrIDOther").attr("checked", false)
							});
					d
							.click(function() {
								var h = $(
										'input:radio[name="selectAddrID"]:checked')
										.val();
								if (h == null) {
									$
											.PageDialog(
													'<dl class="sAltFail"><dd>\u8bf7\u9009\u62e9\u4e00\u4e2a\u6536\u8d27\u5730\u5740\uff01</dd></dl>',
													{
														W : 250,
														H : 50
													});
									return false
								} else {
									var i = {
										userId : c,
										id : h,
										orderRemarks : $("#shipRemark").val(),
										postDate : $(
												"#shipTime > option:checked")
												.val(),
										hidOrderNO : $("#hidOrderNO").val()
									};
									i = e(i);
									$
											.ajax({
												url : "/user/OrderDetailAddAddress.html",
												data : "userJSON="
														+ encodeURIComponent(i),
												success : function(j) {
													if (j == "success") {
														$
																.PageDialog(
																		'<dl class="sAltOK"><dd>\u64cd\u4f5c\u6210\u529f\uff01</dd></dl>',
																		{
																			W : 160,
																			H : 50,
																			autoClose : true
																		});
														location.reload()
													}
												},
												error : function() {
													alert("\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u4e0e\u7ba1\u7406\u5458\u8054\u7cfb\uff01");
													location.reload()
												}
											})
								}
							});
					var a = function() {
						var h = $("#hidOrderNO").val();
						$
								.ajax({
									url : "/user/confirmOrderDetail.html",
									data : "id=" + h,
									success : function(i) {
										if (i == "success") {
											$
													.PageDialog(
															'<dl class="sAltOK"><dd>\u64cd\u4f5c\u6210\u529f\uff01</dd></dl>',
															{
																W : 160,
																H : 50,
																autoClose : true
															});
											location.reload()
										} else {
											$
													.PageDialog(
															'<dl class="sAltFail"><dd>\u786e\u8ba4\u6536\u8d27\u5931\u8d25\uff0c\u8bf7\u786e\u5b9a\u5df2\u7ecf\u53d1\u8d27</dd></dl>',
															{
																W : 280,
																H : 50
															})
										}
									},
									error : function() {
										alert("\u7f51\u7edc\u9519\u8bef\uff0c\u8bf7\u4e0e\u7ba1\u7406\u5458\u8054\u7cfb\uff01");
										location.reload()
									}
								});
						return false
					};
					$("[name=btnReceived]")
							.click(
									function() {
										$.PageDialog
												.showConfirm(
														"\u60a8\u786e\u5b9a\u6536\u5230\u8d27\u4e86\u5417?",
														a)
									});
					function e(k) {
						var j = [];
						for ( var h in k) {
							k[h] = typeof k[h] == "string" ? '"' + k[h] + '"'
									: (typeof k[h] == "object" ? e(k[h]) : k[h]);
							j.push(h + ":" + k[h])
						}
						return "{" + j.join(",") + "}"
					}
				});
