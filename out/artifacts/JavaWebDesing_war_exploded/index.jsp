<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/12/26
  Time: 23:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    </script>
</head>

<body>
<!--offcanvas menu area end-->
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
    </div>
</header>
<!--header area end-->

<!--slider area start-->
<section class="slider_section mb-30">
    <div class="slider_area owl-carousel">
        <div class="single_slider d-flex align-items-center" data-bgimg="assets/img/slider/slider1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="slider_content">


                            <a class="button" href="shop.jsp">阅读更多</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single_slider d-flex align-items-center" data-bgimg="assets/img/slider/slider2.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="slider_content">


                            <a class="button" href="shop.jsp">阅读更多</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--slider area end-->

<!--banner area start-->
<div class="banner_area home1_banner mb-95">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-3 col-6">
                <figure class="single_banner">
                    <div class="banner_thumb">
                        <a href="shop.jsp"><img src="assets/img/bg/banner1.jpg" alt=""></a>
                    </div>
                </figure>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                <figure class="single_banner">
                    <div class="banner_thumb">
                        <a href="shop.jsp"><img src="assets/img/bg/banner2.jpg" alt=""></a>
                    </div>
                </figure>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-3 col-6">
                <figure class="single_banner">
                    <div class="banner_thumb">
                        <a href="shop.jsp"><img src="assets/img/bg/banner3.jpg" alt=""></a>
                    </div>
                </figure>
            </div>
        </div>
    </div>
</div>
<!--banner area end-->

<!--product area start-->
<div class="product_area  mb-95">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="product_header">
                    <div class="section_title">
                        <h2><span> 新款上市</span></h2>
                    </div>
                    <div class="product_tab_btn">
                        <ul class="nav" role="tablist">
                            <li>
                                <a class="active" data-toggle="tab" href="#classic" role="tab" aria-controls="classic" aria-selected="true">
                                    潮流
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#display" role="tab" aria-controls="display" aria-selected="false">
                                    百搭
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#processor" role="tab" aria-controls="processor" aria-selected="false">
                                    运动
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#accessories" role="tab" aria-controls="accessories" aria-selected="false">
                                    休闲
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="classic" role="tabpanel">
                <div class="row">
                    <div class="product_carousel product_column4 owl-carousel">
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="详情页2.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页2.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页2.jsp"> Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥543.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="详情页3.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页3.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页3.jsp">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="详情页4.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页4.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页4.jsp">耐克Air Force 1 AF1空军一号纯白男女高帮板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥729.00</span>
                                            <span class="old_price">￥769.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥395.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="display" role="tabpanel">
                <div class="row">
                    <div class="product_carousel product_column4 owl-carousel">
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">耐克Air Force 1 AF1空军一号纯白男女高帮板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥729.00</span>
                                            <span class="old_price">￥769.00.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥395.00.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥543.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋！
                                        </a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="processor" role="tabpanel">
                <div class="row">
                    <div class="product_carousel product_column4 owl-carousel">
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥543.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp"> 耐克Air Force 1 AF1空军一号纯白男女高帮板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥729.00</span>
                                            <span class="old_price">￥769.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥543.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="accessories" role="tabpanel">
                <div class="row">
                    <div class="product_carousel product_column4 owl-carousel">
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp"> 耐克Air Force 1 AF1空军一号纯白男女高帮板鞋！</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥729.00</span>
                                            <span class="old_price">￥769.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp"> FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥395.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                        <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <figcaption class="product_content">
                                        <div class="product_rating">
                                            <ul>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                        <div class="price_box">
                                            <span class="current_price">￥553.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车
                                                t</a>
                                        </div>
                                        <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="product_area  mb-100">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2><span>爆款畅销</span>                    </h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="product_carousel product_column4 owl-carousel">
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <div class="label_product">
                                    <span class="label_new">new</span>
                                    <span class="label_sale">12%</span>
                                </div>
                                <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                <div class="action_links">
                                    <ul>
                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                        <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                        <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content">
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE AIR FORCE 1 '07男子运动鞋空军一号板鞋！</a></h4>
                                <div class="price_box">
                                    <span class="current_price">￥749.00</span>
                                    <span class="old_price">￥799.00</span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                </div>
                                <div class="swatches-colors">
                                    <ul>
                                        <li><a class="color1" href="javascript:void(0)"></a></li>
                                        <li><a class="color2" href="javascript:void(0)"></a></li>
                                        <li><a class="color3" href="javascript:void(0)"></a></li>
                                        <li><a class="color4" href="javascript:void(0)"></a></li>
                                    </ul>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <div class="label_product">
                                    <span class="label_new">new</span>
                                </div>
                                <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                <div class="action_links">
                                    <ul>
                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                        <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                        <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content">
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <h4 class="product_name"><a href="product-details.jsp">FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                <div class="price_box">
                                    <span class="current_price">￥395.00</span>
                                    <span class="old_price">￥435.00</span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                </div>
                                <div class="swatches-colors">
                                    <ul>
                                        <li><a class="color1" href="javascript:void(0)"></a></li>
                                        <li><a class="color2" href="javascript:void(0)"></a></li>
                                        <li><a class="color3" href="javascript:void(0)"></a></li>
                                        <li><a class="color4" href="javascript:void(0)"></a></li>
                                    </ul>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <div class="label_product">
                                    <span class="label_new">new</span>
                                </div>
                                <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                <div class="action_links">
                                    <ul>
                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                        <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                        <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content">
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                <div class="price_box">
                                    <span class="current_price">￥709.00</span>
                                    <span class="old_price">￥799.00</span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <div class="label_product">
                                    <span class="label_new">new</span>
                                    <span class="label_sale">10%</span>
                                </div>
                                <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                <div class="action_links">
                                    <ul>
                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                        <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                        <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content">
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <h4 class="product_name"><a href="product-details.jsp"> Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                <div class="price_box">
                                    <span class="current_price">￥534.00</span>
                                    <span class="old_price">￥659.00</span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                </div>
                                <div class="swatches-colors">
                                    <ul>
                                        <li><a class="color1" href="javascript:void(0)"></a></li>
                                        <li><a class="color2" href="javascript:void(0)"></a></li>
                                        <li><a class="color3" href="javascript:void(0)"></a></li>
                                        <li><a class="color4" href="javascript:void(0)"></a></li>
                                    </ul>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_product">
                        <figure>
                            <div class="product_thumb">
                                <div class="label_product">
                                    <span class="label_new">new</span>
                                </div>
                                <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                <div class="action_links">
                                    <ul>
                                        <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                        <li class="wishlist"><a href="#" title="喜欢"><i class="icon icon-Heart"></i></a></li>
                                        <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <figcaption class="product_content">
                                <div class="product_rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <h4 class="product_name"><a href="product-details.jsp">耐克Air Force 1 AF1空军一号纯白男女高帮板鞋！</a></h4>
                                <div class="price_box">
                                    <span class="current_price">￥729.00</span>
                                    <span class="old_price">$769.00</span>
                                </div>
                                <div class="add_to_cart">
                                    <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                </div>
                            </figcaption>
                        </figure>
                    </article>
                </div>
            </div>
        </div>
    </div>
</div>
<!--product area end-->

<!--testimonial area start-->
<div class="testimonial_area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-5 col-md-12">
                <div class="section_title testileft_title">

                    <h2>买家 <span>好评！</span></h2>
                </div>
            </div>
            <div class="col-lg-7 col-md-12">
                <div class="testimonial_container">
                    <div class="testimonial_carousel testimonial_column1 owl-carousel">
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial1.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“ 喜欢喜欢 特别好看的鞋子 非常快的速度来到我手上 爱了爱了! ”</p>

                                <div class="testimonial_author">
                                    <a href="#">-十五</a>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial2.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“上脚很好看，真的这鞋爱了爱了，样子太好看了，穿起来挺舒服的，码数标准码刚刚好！ ”</p>

                                <div class="testimonial_author">
                                    <a href="#">- 汤姆猫</a>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial3.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“ 风格款式介绍：特别好看 舒适度：特别舒服 尺码推荐：特别划算合适 鞋底材质：特别舒服 鞋面材质：特别舒服! ”</p>

                                <div class="testimonial_author">
                                    <a href="#">- Amber</a>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial4.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“ 风格款式介绍：超出预期 质量很好 做工精细 很好 很满意 感谢感谢! ”</p>

                                <div class="testimonial_author">
                                    <a href="#">- 杰尼龟</a>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial5.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“ 东西很好，正品，比实体店便宜！！！！！！！！！！！！！！！！！! ”</p>

                                <div class="testimonial_author">
                                    <a href="#">- Rebecka</a>
                                </div>
                            </div>
                        </div>
                        <div class="single-testimonial">
                            <div class="testimonial_thumb">
                                <a href="#"><img src="assets/img/about/testimonial6.png" alt=""></a>
                            </div>
                            <div class="testimonial_content">
                                <div class="testimonial-rating">
                                    <ul>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    </ul>
                                </div>
                                <p>“发货快，价格合适，还收到了小礼品，打开快递，满满的幸福感! ”</p>

                                <div class="testimonial_author">
                                    <a href="#">-Laha</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--testimonial area end-->

<!--blog area start-->
<section class="blog_section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section_title">
                    <h2>买家 <span>博客</span></h2>
                    <p>最新的博客帖子</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="blog_carousel blog_column3 owl-carousel">
                <div class="col-lg-3">
                    <article class="single_blog">
                        <figure>
                            <div class="blog_thumb">
                                <a href="blog-details.html"><img src="assets/img/blog/blog1.jpg" alt=""></a>
                            </div>
                            <figcaption class="blog_content">
                                <h4 class="post_title"><a href="blog-details.html">潮鞋传塔. </a></h4>
                                <div class="articles_date">
                                    <span><i class="fa fa-calendar" aria-hidden="true"></i> 21/10/2020</span>
                                    <span><i class="fa fa-user" aria-hidden="true"></i> 十五</span>
                                </div>
                                <p class="post_desc">除了早前的白橙配色Air Force 1外，Nike还为即将开幕的SoHo旗舰店带来两双独占「Laser」版本。该鞋款设计经典的Air Force 1鞋身由白色皮革构成，搭载标志性白色大底，分别将突显纽约多元化特性的黑白镭射图案遍布于鞋身并以醒目的橙色Nike Swoosh划过，而鞋舌与后跟还融入了深蓝色的“NYC”字样点缀。</p>
                                <a href="#">+ 阅读更多</a>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_blog">
                        <figure>
                            <div class="blog_thumb">
                                <a href="blog-details.html"><img src="assets/img/blog/blog2.jpg" alt=""></a>
                            </div>
                            <figcaption class="blog_content">
                                <h4 class="post_title"><a href="blog-details.html"> 潮鞋穿搭.</a></h4>
                                <div class="articles_date">
                                    <span><i class="fa fa-calendar" aria-hidden="true"></i> 20/10/2020</span>
                                    <span><i class="fa fa-user" aria-hidden="true"></i> 杰尼龟</span>
                                </div>
                                <p class="post_desc">除了即将登场的 Nike AirVaporMax 新款跑鞋之外，Air Max 家族日前再迎来新成员 Air Max Modern。设计上，新款沿袭了初代的 Air Max 的外形，并进一步简化重塑，采用轻薄透气的网面打造鞋身，并于鞋带及后跟承托位置注入抢眼 3M 反光细节，最后搭载 Max Air 气垫中底而成，整体设计简洁利落。</p>
                                <a href="#">+ 阅读更多</a>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_blog">
                        <figure>
                            <div class="blog_thumb">
                                <a href="blog-details.html"><img src="assets/img/blog/blog3.jpg" alt=""></a>
                            </div>
                            <figcaption class="blog_content">
                                <h4 class="post_title"><a href="blog-details.html">潮鞋穿搭. </a></h4>
                                <div class="articles_date">
                                    <span><i class="fa fa-calendar" aria-hidden="true"></i> 19/10/2020</span>
                                    <span><i class="fa fa-user" aria-hidden="true"></i>Nunoah</span>
                                </div>
                                <p class="post_desc">耐克WMNS Air Max 97 PRM。耐克经典跑鞋Air Max 97始终以复古的风格展示给大家，但这些鞋是基于白色为底色设计的，鞋身的标志性轮廓采用明亮的珍珠色，多彩亮片和波点装饰，风格超赞！视觉效果更加丰富，外底采用半透明的水晶底，呼应鞋身清新的气质，优雅而神秘。太想要了！</p><p> </p>
                                <a href="#">+阅读更多</a>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_blog">
                        <figure>
                            <div class="blog_thumb">
                                <a href="blog-details.html"><img src="assets/img/blog/blog4.jpg" alt=""></a>
                            </div>
                            <figcaption class="blog_content">
                                <h4 class="post_title"><a href="blog-details.html">潮流穿搭. </a></h4>
                                <div class="articles_date">
                                    <span><i class="fa fa-calendar" aria-hidden="true"></i> 18/10/2020</span>
                                    <span><i class="fa fa-user" aria-hidden="true"></i> 杰尼龟</span>
                                </div>
                                <p class="post_desc">Onitsuka Tiger FABRE 是品牌历史上经典的篮球鞋，日本的mita sneakers 此次以 FABRE 为原型与 Onitsuka Tiger 合作推出了 FABRE RB “大熊猫” 鞋款。以东京都恩赐上野动物园的大熊猫为设计灵感，外形上的黑白配色也很明显得突出了大熊猫的标志色。鞋垫上还印有篮球场地板图案和 mita sneakers 的铁丝网以及 “东京改” 字样，售价为 1021人民币！</p>
                                <a href="#">+ 阅读更多</a>
                            </figcaption>
                        </figure>
                    </article>
                </div>
                <div class="col-lg-3">
                    <article class="single_blog">
                        <figure>
                            <div class="blog_thumb">
                                <a href="blog-details.html"><img src="assets/img/blog/blog5.jpg" alt=""></a>
                            </div>
                            <figcaption class="blog_content">
                                <h4 class="post_title"><a href="blog-details.html">潮流穿搭. </a></h4>
                                <div class="articles_date">
                                    <span><i class="fa fa-calendar" aria-hidden="true"></i> 17/10/2020</span>
                                    <span><i class="fa fa-user" aria-hidden="true"></i> 十五</span>
                                </div>
                                <p class="post_desc">为即将来临的寒冬做好准备，adidasOriginals近日为NMD_R1带来了全新的「Wool」系列。采用手感柔软同时兼具保暖特性的羊毛材质重塑NMD_R1的简约鞋身轮廓，灰、黑两双配色均搭配上黑色鞋带扣与两侧三线细节，前后稳定块和后跟则选择呼应鞋身的色调示人，并均置于白色BOOST中底之上。</p>
                                <a href="#">+ 阅读更多</a>
                            </figcaption>
                        </figure>
                    </article>
                </div>
            </div>
        </div>
    </div>
</section>
<!--blog area end-->

<!--newsletter area start-->
<div class="newsletter_area_start">
    <div class="container">
        <div class="newsletter_container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2>报名 <span>获取更多消息</span></h2>
                        <p>联系方式</p>
                    </div>
                    <div class="subscribe_form">
                        <form id="mc-form" class="mc-form footer-newsletter" >
                            <input id="mc-email" type="email" autocomplete="off" placeholder="请输入QQ或者微信" />
                            <button id="mc-submit">订购</button>
                            <div class="email_icon">
                                <i class="icon-mail"></i>
                            </div>
                        </form>

                        <div class="mailchimp-alerts text-centre">
                            <div class="mailchimp-submitting"></div>
                            <div class="mailchimp-success"></div>
                            <div class="mailchimp-error"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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

            <!--footer area end-->
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
