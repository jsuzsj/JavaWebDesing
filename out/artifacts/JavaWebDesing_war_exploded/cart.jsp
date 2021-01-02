<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Nunoah男鞋 </title>
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
                                            ${USER_NAME}<a href="OutLoginServlet">退出</a></li></c:if>
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

                                <c:if test="${not empty USER_NAME}">
                                    <div class="mini_cart" >
                                        <div class="cart_gallery">
                                            <c:forEach var="item" items="${shopingcar}">
                                                <div class="cart_item">
                                                    <div class="cart_img">
                                                        <a href="#"><img src="assets/img/s-product/${item.desc}" alt=""></a>
                                                    </div>
                                                    <div class="cart_info">
                                                        <a href="#">${item.name}</a>
                                                        <p>1 x <span> ${item.price} </span></p>
                                                    </div>
                                                    <div class="cart_remove">
                                                        <a href="#" onclick="ajax2(${item.id})"> <i class="ion-ios-close-outline"></i></a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="mini_cart_table">
                                            <div class="cart_table_border">
                                                <div class="cart_total">
                                                    <span>小计:</span>
                                                    <span class="price">￥${shopingcar_sum}</span>
                                                </div>
                                                <div class="cart_total mt-10">
                                                    <span>总计:</span>
                                                    <span class="price">￥${shopingcar_sum}</span>
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
                                </c:if>


                                <!--mini cart end-->
                            </div>
                            <div class="header_account-list top_links">
                                <a href="javascript:void(0)"><i class="icon icon-Settings"></i></a>
                                <div class="dropdown_links">
                                    <div class="dropdown_links_list">
                                        <h3>设置</h3>
                                        <ul>
                                            <li><a href="#">￥ 人民币</a></li>
                                            <li><a href="#">$ US 美元</a></li>
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
    </div></header>
    <!--header area end-->

    
    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                       <h3>购物车</h3>
                        <ul>
                            <li><a href="index.jsp">首页</a></li>
                            <li>购物车</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
     <!--shopping cart area start -->
    <div class="shopping_cart_area mt-100">
        <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                                <table>
                            <thead>
                                <tr>
                                    <th class="product_remove">删除</th>
                                    <th class="product_thumb">商品</th>
                                    <th class="product_name">名称</th>
                                    <th class="product-price">单价</th>
                                    <th class="product_数量">数量</th>
                                    <th class="product_total">小计</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="shop" items="${shopingcar}">
                                <tr>
                                    <td class="product_remove"><a href="#"><i class="fa fa-trash-o"></i></a></td>
                                    <td class="product_thumb"><a href="#"><img src="assets/img/s-product/${shop.desc}" alt=""></a></td>
                                    <td class="product_name"><a href="#">${shop.name}</a></td>
                                    <td class="product-price">￥${shop.price}</td>
                                    <td class="product_数量"><label>数量</label> <input min="1" max="100" value="1" type="number"></td>
                                    <td class="product_total">￥${shop.price}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>   
                            </div>  
                            <div class="cart_submit">
                                <button type="submit">刷新</button>
                            </div>      
                        </div>
                     </div>
                 </div>
                 <!--coupon code area start-->
                <div class="coupon_area">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="coupon_code left">
                                <h3>优惠卷</h3>
                                <div class="coupon_inner">   
                                    <p>如果有优惠券代码，请输入</p>
                                    <form action="UsetTicketServlet" method="get">
                                    <input placeholder="Coupon code" type="text" name = "ticketcode">
                                   <button type="submit">确认</button>
                                    </form>
                                </div>    
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="coupon_code right">
                                <h3>总计</h3>
                                <div class="coupon_inner">
                                   <div class="cart_subtotal">
                                       <p>小计</p>
                                       <p class="cart_amount">￥${shopingcar_sum}</p>
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>总计</p>
                                       <p class="cart_amount">￥${shopingcar_sum}</p>
                                   </div>
                                   <div class="checkout_btn">
                                       <a href="checkout.jsp">结算</a>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--coupon code area end-->
            </form> 
        </div>     
    </div>
     <!--shopping cart area end -->
    
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



</body>

</html>