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
                        <h3>关于我们</h3>
                        <ul>
                            <li><a href="index.jsp">首页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--about section area -->
    <section class="about_section"> 
       <div class="container">
            <div class="row">
                <div class="col-12">
                   <figure>
                        <div class="about_thumb">
                            <img src="assets/img/about/about1.jpg" alt="">
                        </div>
                        <figcaption class="about_content">
                            <h1>我们是专注于潮鞋、运动耳机的商务型网站！</h1>
                            <p>随着电子商务行业的发展，商务网站越来越常见，“Nunoah男鞋”是一个专注于分享鞋类商品与运动耳机商品的商务型购物网站。“Nunoah男鞋”商务网站有着自己的风格，个性。通过为更多人分享潮鞋，好鞋，定制鞋，针对各个消费者的个人需求，实现浏览商品、留言互动、加入购物车、支付等功能来完成对“Nunoah男鞋”商务网站推广促销。</p>
                            <div class="about_signature">
                                <img src="assets/img/about/about-us-signature.png" alt="">
                            </div>
                        </figcaption>
                    </figure>
                </div>    
            </div>  
        </div> 
    </section>
    <!--about section end-->

    <!--chose us area start-->
    <div class="choseus_area" data-bgimg="assets/img/about/about-us-policy-bg.jpg">
        <div class="container">   
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="assets/img/about/About_icon1.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>下单便捷</h3>
                            <p></p>

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="assets/img/about/About_icon2.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>100% 退款保证</h3>
                          

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4">
                    <div class="single_chose">
                        <div class="chose_icone">
                            <img src="assets/img/about/About_icon3.png" alt="">
                        </div>
                        <div class="chose_content">
                            <h3>全天候在线支持</h3>
                         

                        </div>
                    </div>
                </div>
            </div>
        </div>    
    </div>

    <!--chose us area end-->      

    <!--services img area-->
    <div class="about_gallery_section"> 
        <div class="container">
           <div class="about_gallery_container">
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="assets/img/about/about2.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>合作伙伴</h3>
                                
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="assets/img/about/about3.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>营销中心</h3>
                                   
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-4 col-md-4">
                        <article class="single_gallery_section">
                            <figure>
                                <div class="gallery_thumb">
                                    <img src="assets/img/about/about4.jpg" alt="">
                                </div>
                                <figcaption class="about_gallery_content">
                                   <h3>廉政举报</h3>
                                  
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                </div> 
            </div>
        </div>      
    </div>
    <!--services img end-->    

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