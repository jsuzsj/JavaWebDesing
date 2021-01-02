<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Nunoah男鞋</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/font.awesome.css">
    <link rel="stylesheet" href="assets/css/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/animate.css">
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/slinky.menu.css">
    <link rel="stylesheet" href="assets/css/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>
    <script type="text/javascript">
        var ajax1 = function (shopid){
            var ajaxa = new XMLHttpRequest();
            console.log(shopid);
            var url = "AddOnCarServlet?shopid="+shopid;
            ajaxa.open("GET",url,true);
            ajaxa.send();
            ajaxa.onreadystatechange = function (){
                if (ajaxa.readyState == 4 && ajaxa.status == 200)
                {
                    alert(ajaxa.responseText);
                    var ajaxa1 = new XMLHttpRequest();
                    console.log("test");
                    var url = "ShopingCarServlet";
                    ajaxa1.open("GET",url,true);
                    ajaxa1.send();
                    ajaxa1.onreadystatechange = function (){
                        if (ajaxa.readyState == 4 && ajaxa.status == 200)
                        {
                            location.reload();
                        }
                    }
                }
            }
        }
        var ajax2 = function (shopid){
            var ajaxa = new XMLHttpRequest();
            var url = "DeletCarShopServlet?shopid="+shopid;
            ajaxa.open("GET",url,true);
            ajaxa.send();
            ajaxa.onreadystatechange = function (){
                if (ajaxa.readyState == 4 && ajaxa.status == 200)
                {
                    location.reload();
                }
            }
        }
    </script>
</head>

<body>

   
     <header>
        <div class="main_header sticky-header">
            <div class="container-fluid">
                <div class="header_container">
                    <div class="row align-items-center">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="index.jsp"><img src="assets/img/logo/logo.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <!--main menu start-->
                            <div class="main_menu menu_position"> 
                                <nav>  
                                    <ul>
                                        <li><a class="active"  href="index.jsp">首页<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu">
                                                <li><a href="index.jsp">首页 1</a></li>
                                                <li><a href="index-2.jsp">首页 2</a></li>
                                                <li><a href="index-3.jsp">首页 3</a></li>
                                    
                                            </ul>
                                        </li>
                                        <li class="mega_items"><a href="shop.jsp">商品<i class="fa fa-angle-down"></i></a>
                                            <div class="mega_menu">
                                                <ul class="mega_menu_inner">
                                                    <li>
                                                        <ul>
                                                            <li><a href="shop-fullwidth.jsp">全列展示</a></li>
                                                            <li><a href="shop-fullwidth-list.jsp">单列展示</a></li>
                                                            <li><a href="shop-right-sidebar.jsp">分类展示 </a></li>
                                                      		<li><a href="cart.jsp">购物车</a></li>
                                                            <li><a href="checkout.jsp">结算</a></li>
                                                          </ul></li>
                                                </ul>
                                              
                                            </div>
                                        </li>
                                       
                                        <li><a href="#">"Nunoah"男鞋简介 <i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                                <li><a href="about.jsp">关于我们</a></li>
                                                <li><a href="faq.jsp">常见问题</a></li>
                                                <li><a href="404.jsp">错误 404</a></li>
                                            </ul>
                                        </li> 
                                        <li><a href="contact.jsp"> 联系作者</a></li>
                                        <li>
                                        <c:if test="${not empty USER_NAME}">
                                            ${USER_NAME}<a href="OutLoginServlet">退出</a></c:if>
                                        <c:if test="${empty USER_NAME}">
                                            <a href="登入.html">登录/注册</a></c:if>
                                        </li>
                            
                                    </ul>  
                                </nav> 
                            </div>
                            <!--main menu end-->
                        </div>
                        <div class="col-lg-2">
                            <div class="header_account_area">
                                <div class="header_account-list search_bar">
                                   <a href="javascript:void(0)"><span class="icon icon-Search"></span></a>
                                    <div class="dropdown_search">
                                        <div class="search_close_btn">
                                            <a href="#"><i class="ion-close-round"></i></a>
                                        </div>
                                        <form action="#">
                                            <input placeholder="Search entire store here ..." type="text">
                                            <button type="submit"><span class="icon icon-Search"></span></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="header_account-list  mini_cart_wrapper">
   <a href="javascript:void(0)"><i class="icon icon-FullShoppingCart"></i><span class="item_count">${shopingcar.size()}</span></a>
                              
                                    <div class="mini_cart">
                                        <div class="cart_gallery">
                                            <div class="cart_item">
                                               <div class="cart_img">
                                                   <a href="#"><img src="assets/img/s-product/product.jpg" alt=""></a>
                                               </div>
                                                <div class="cart_info">
                                                    <a href="#">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋.</a>
                                                    <p>1 x <span> ￥709.00 </span></p>    
                                                </div>
                                                <div class="cart_remove">
                                                    <a href="#"><i class="ion-ios-close-outline"></i></a>
                                                </div>
                                            </div>
                                            <div class="cart_item">
                                               <div class="cart_img">
                                                   <a href="#"><img src="assets/img/s-product/product1.jpg" alt=""></a>
                                               </div>
                                                <div class="cart_info">
                                                    <a href="#">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋.</a>
                                                    <p>1 x <span> ￥709.00 </span></p>    
                                                </div>
                                                <div class="cart_remove">
                                                     <a href="#"><i class="ion-ios-close-outline"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="mini_cart_table">
                                            <div class="cart_table_border">
                                                <div class="cart_total">
                                                    <span>小计:</span>
                                                    <span class="price">￥1458.00</span>
                                                </div>
                                                <div class="cart_total mt-10">
                                                    <span>总计:</span>
                                                    <span class="price">￥1458.00</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mini_cart_footer">
                                           <div class="cart_button">
                                                <a href="cart.jsp"><i class="fa fa-shopping-cart"></i> 购物车</a>
                                          </div>
                                            <div class="cart_button">
                                                <a href="checkout.jsp"><i class="fa fa-sign-in"></i> 结算</a>
                                            </div>

                                        </div>
                                    </div>
                                    <!--mini cart end-->
                               </div>
                                <div class="header_account-list top_links">
                                    <a href="javascript:void(0)"><i class="icon icon-Settings"></i></a>
                                    <div class="dropdown_links">
                                        <div class="dropdown_links_list">
                                            <h3>设置</h3>
                                            <ul>
                                                <li><a href="#">￥ 人民币</a></li>
                                                <li><a href="#">￥ US 美元</a></li>
                                            </ul>
                                        </div>
                                        <div class="dropdown_links_list">
                                            <h3> 语言</h3>
                                            <ul>
                                                <li><a href="#"> 中文</a></li>
                                                <li><a href="#"> 英文</a></li>
                                            </ul>
                                        </div>
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </header>
    <!--header area end-->

    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                       <h3>结算</h3>
                        <ul>
                            <li><a href="index.jsp">首页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--Checkout page section-->
    <div class="Checkout_section mt-100">
       <div class="container">
            <div class="row">
               <div class="col-12">
                    <div class="user-actions">
                        <h3>
                            <c:if test="${empty USER_NAME}">
                            <i class="fa fa-file-o" aria-hidden="true"></i>
                           回头客？
                            <a class="Returning" href="登入.html" data-toggle="collapse" data-target="#checkout_login" aria-expanded="true">点击这里登录</a>     

                        </h3>
                         <div id="checkout_login" class="collapse" data-parent="#accordion">
                            <div class="checkout_info">
                                <p>如果您以前和我们一起购物过，请在下面的框中输入您的详细信息。 如果您是新客户，请前往付款及注册账户。</p>  
                                <form action="LoginServlet">
                                    <div class="form_group">
                                        <label name ="name">用户名以及邮箱 <span>*</span></label>
                                        <input type="text">     
                                    </div>
                                    <div class="form_group">
                                        <label name ="pswd">密码 <span>*</span></label>
                                        <input type="text">     
                                    </div> 
                                    <div class="form_group group_3 ">
                                        <button  type="submit">登录</button>
                                        <label for="remember_box">
                                            <input id="remember_box" type="checkbox">
                                            <span> 记住密码 </span>
                                        </label>     
                                    </div>
                                    <a href="#">忘记密码</a>
                                </form>          
                            </div>
                        </div>    
                    </div>
                   </c:if>
                   <form action="AddOrderServlet" method="get">
            <div class="checkout_form">
                <div class="row">
                    <div class="col-lg-6 col-md-6">

                            <h3>账单</h3>
                            <div class="row">

                                <div class="col-lg-6 mb-20">
                                    <label>姓名<span>*</span></label>
                                    <input type="text" name = "name">
                                </div>
                               
                                <div class="col-12 mb-20">
                                    <label for="country">省份<span>*</span></label>
                                    <select class="select_option" name="city" id="country">
                                        <option value="2">黑龙江</option>      
                                        <option value="3">吉林</option> 
                                        <option value="4">辽宁</option>    
                                        <option value="5">河北</option>    
                                        <option value="6">山西</option>    
                                        <option value="7">江苏</option>    
                                        <option value="8">浙江</option>    
                                        <option value="9">安徽</option>   
                                       	<option value="10">福建</option> 
                                       	<option value="11">江西</option> 
                                       	<option value="12">江西</option> 
                                       	<option value="13">湖北</option> 
                                       	<option value="14">湖南</option> 
                                        <option value="15">广东</option> 
                                       	<option value="16">四川</option>
                                       	<option value="17">贵州</option> 
                                      	 <option value="18">云南</option>   
                                       	<option value="19">陕西</option> 
                                       	<option value="20">甘肃</option> 
                                       	<option value="21">青海</option> 
                                       	<option value="22">台湾</option> 
                                       	<option value="23">香港</option> 
                                        <option value="24">澳门</option> 
                                       	<option value="25">北京</option>
                                       	<option value="26">上海</option> 
                                      	<option value="27">重庆</option> 
                                       	<option value="28">天津</option> 
                                       	<option value="29">内蒙古</option> 
                                        <option value="30">广西</option> 
                                       	<option value="31">宁夏</option>
                                       	<option value="32">新疆</option>                            
                                       	<option value="33">西藏</option>               

                                    </select>
                                </div>

                                <div class="col-12 mb-20">
                                    <label>详细地址  <span>*</span></label>
                                    <input placeholder="详细地址" type="text" name="desc">
                                </div>
                                <div class="col-12 mb-20">
                                    <input placeholder="门牌号和街名" type="text" name="moreadd">
                                </div>
                              
                                <div class="col-lg-6 mb-20">
                                    <label>电话<span>*</span></label>
                                    <input type="text" name="phone">

                                </div> 
                                 <div class="col-lg-6 mb-20">
                                    <label> 邮箱地址  <span>*</span></label>
                                      <input type="text" name="email">

                                </div> 
                               
                               
                                <div class="col-12">
                                    <div class="order-notes">
                                         <label for="order_note">订货单</label>
                                        <textarea id="order_note" placeholder="有关订单的说明，例如送货的特别说明。"></textarea>
                                    </div>    
                                </div>     	    	    	    	    	    	    
                            </div>

                    </div>
                    <div class="col-lg-6 col-md-6">
                            <h3>你的订单</h3> 
                            <div class="order_table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>商品</th>
                                            <th>价格</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="shop" items="${shopingcar}">
                                        <tr>
                                            <td> <strong>${shop.name}</strong></td>
                                            <td> <strong>￥${shop.price}</strong></td>
                                        </tr>
                                    </c:forEach>

                                       
                                       
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>购物车小计</th>
                                            <td><strong>￥${shopingcar_sum}</strong></td>
                                        </tr>
                                        <tr>
                                            <th>运费</th>
                                            <td><strong>￥0</strong></td>
                                        </tr>
                                        <tr class="order_total">
                                            <th>订单总数</th>
                                            <td><strong>${shopingcar_size}</strong></td>
                                        </tr>
                                         <tr>
                                            <th>购物车总计</th>
                                            <td><strong>￥${shopingcar_sum}</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>     
                            </div>
                            <div class="payment_method">
                              
                               <div class="panel-default">
                                    <input class="payment_defult" name="check_method" type="radio" data-target="createp_account" />
                                    <label for="payment_defult" data-toggle="collapse" data-target="#collapsedefult" aria-controls="collapsedefult">支付宝支付 <img src="assets/img/icon/papye1.png" alt=""></label>

                                <div class="order_button">
                                     <div class="panel-default">
                                    <input id="payment_defult" name="check_method" type="radio" data-target="createp_account" />
                                    <label for="payment_defult" data-toggle="collapse" data-target="#collapsedefult" aria-controls="collapsedefult">微信支付 <img src="assets/img/icon/papye2.png" alt=""></label>

                                <div class="order_button">
                                    <button  type="submit">确认支付</button> 
                                </div>
                            </div>
                    </div>
                </div>
            </div>
    <!--Checkout page section end-->
                    </div></div></div>
                   </form>
</body>
     <!--footer area start-->
                            <footer class="footer_widgets">
                                <div class="footer_top">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-8 col-sm-8">
                                                <div class="widgets_container footer_contact">
                                                    <h1>关于我们</h1>
                                                    <p>Nunoah男鞋，您的优质选择，欢迎你的到来.</p>
                                                    <p><i class="icon icon-Pointer"></i>
                                                        xxxxxxx</p>
                                                    <p><i class="icon icon-Phone"></i> <a href="tel:+123.456.789">+18670627107</a> - <a href="tel:+123.456.678">+15584813632</a></p>
                                                    <p><i class="icon icon-Mail"></i> <a href="#">#1598950239@qq.com</a></p>
                                                </div>
                                            </div>


                                        </div>

                                        <div class="footer_bottom">
                                            <div class="container">
                                                <div class="row align-items-center">
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="copyright_area">
                                                            <p><strong>版权信息</strong><strong>:</strong><br>
                                                                Copyright © 2020 Nunoah All Rights Reserved.  湘ICP备12345678号</p>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="footer_social">
                                                            <ul>
                                                                <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                                                                <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                                                                <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                                                                <li><a href="#"><i class="ion-social-youtube-outline"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </footer>


                            <!-- modal area end-->
    
<script src="assets/js/vendor/jquery-3.4.1.min.js"></script>
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/jquery.countdown.js"></script>
<script src="assets/js/jquery.ui.js"></script>
<script src="assets/js/jquery.elevatezoom.js"></script>
<script src="assets/js/isotope.pkgd.min.js"></script>
<script src="assets/js/slinky.menu.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>



</html>