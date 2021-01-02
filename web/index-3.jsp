<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </div>
</header>

    <!--header area end-->
    
    <!--slider area start-->
    <section class="slider_section slider_s_three color_three">
        <div class="slider_area owl-carousel">
            <div class="single_slider d-flex align-items-center" data-bgimg="assets/img/slider/slider5.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_three">
                              <h2><font color="rgba(251,245,246,1.00)">Nunoah给您的耳朵带来最好的体验</font></h2>
                                <a class="button" href="shop.jsp">阅读更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="assets/img/slider/slider6.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_three">
                             <h2><font color= "rgba(244,243,243,1.00)">享受生活，享受音乐</font></h2>
                                <a class="button" href="shop.jsp">阅读更多</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--slider area end-->
    
    <!--category product area-->
    <div class="category_product_area">
        <div class="container">
            <div class="row">
                <div class="category_product_container category_product_column5 owl-carousel">
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category1.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">入耳式耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category2.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">专业耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category3.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">蓝牙耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category4.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">头戴式耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category5.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">无线耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category1.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">入耳式耳机</a></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="single_category_product">
                            <div class="category_product_thumb">
                                <a href="#"><img src="assets/img/category/category2.jpg" alt=""></a>
                            </div>
                            <div class="category_product-text">
                                <h3><a href="shop.jsp">专业耳机</a></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--category product area-->
    
    <!--product area start-->
    <div class="product_area product_style2 color_three  mb-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                       <h2>新品 <span>上新</span></h2>
                       
                    </div>
                </div>
            </div> 
            <div class="row">
                <div class="product_carousel product_column6 owl-carousel">
                    <div class="col-lg-3">
                       <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                           <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="详情页9.jsp"><img src="assets/img/product/product33.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页9.jsp"><img src="assets/img/product/product34.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="详情页9.jsp"> 真无线蓝牙耳机双耳运动跑步入耳式耳塞挂耳开车迷你超小隐形5.0苹果安卓手机通用防水x男女微小型头戴式xs</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥220.00</span>
                                            <span class="old_price">￥240.00</span>
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
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product35.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product36.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">米8SE手机专用6X黑鲨note3入耳式耳塞mix2s华为p20重低音Mate10Pro锤子荣耀青春版降噪耳麦9</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥225.00</span>
                                            <span class="old_price">￥235.00</span>
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
                    <div class="col-lg-3">
                        <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product37.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product38.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">米8SE手机专用6X黑鲨note3入耳式耳塞mix2s华为p20重低音Mate10Pro锤子荣耀青春版降噪耳麦9!</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥142.00</span>
                                            <span class="old_price">￥173.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车
                                            </a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product39.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product40.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp"> RGB发光7.1声道USB头戴式电脑游戏耳机台式笔记本3.5mm接口重低音降噪有线带麦克风电竞职业吃鸡电竞专业耳麦</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥145.00</span>
                                            <span class="old_price">￥178.00</span>
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
                    <div class="col-lg-3">
                        <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product41.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product42.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">黑爵ax120 耳机头戴式游戏耳麦吃鸡电竞耳机带麦克风有线台式电脑笔记本<p>!</p></a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥179.00</span>
                                            <span class="old_price">￥190.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product43.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product33.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">RGB发光7.1声道USB头戴式电脑游戏耳机台式笔记本3.5mm接口重低音降噪有线带麦克风电竞职业吃鸡电竞专业耳麦</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥145.00</span>
                                            <span class="old_price">￥178.00</span>
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
                    <div class="col-lg-3">
                       <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                           <span class="label_new">new</span>
                                            <span class="label_sale">12%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product42.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product34.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">HP/惠普H200电脑耳机头戴式电竞游戏专用7.1声道绝地求生吃鸡听声辩位有线耳麦台式笔记本带麦克风话筒</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥220.00</span>
                                            <span class="old_price">￥240.00</span>
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
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product41.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product35.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp"> Lenovo/联想电脑耳机头戴式游戏吃鸡听声辨位电竞专用耳麦降噪台式笔记本通用有线带麦克风7.1声道网吧</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥225.00</span>
                                            <span class="old_price">￥235.00</span>
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
                    <div class="col-lg-3">
                        <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product40.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product36.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">兰士顿 D4重低音炮四核双动圈耳机入耳式耳塞K歌HiFi手机通用男女有线高音质吃鸡苹果电脑耳麦游戏带麦挂耳式</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥142.00</span>
                                            <span class="old_price">￥173.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product40.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product37.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">钛度taiduTHS108暗鸦M电竞游戏耳机入耳式长麦和平精英吃鸡听声辩位带话筒手机type-c笔记本台式电脑带麦通用</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥145.00</span>
                                            <span class="old_price">￥178.00</span>
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
                    <div class="col-lg-3">
                        <div class="product_items">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product39.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product38.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp">兰士顿耳机入耳式原装正品适用vivo手机oppo苹果6华为荣耀有线k歌高音质小米通用韩版可爱女生半圆孔安卓六核</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥179.00</span>
                                            <span class="old_price">￥190.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </figcaption>
                                </figure>
                            </article>
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product35.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product36.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
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
                                        <h4 class="product_name"><a href="product-details.jsp"> 夏新S19不入耳无线蓝牙耳机5.0单耳双耳一对迷你隐形挂耳式运动跑步男女适用苹果华为vivo小米oppo安卓通用型</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥145.00</span>
                                            <span class="old_price">￥178.00</span>
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
        </div> 
    </div>
    <!--product area end--> 
      
    <!--banner area start-->
    <div class="banner_area home-banner2 mb-95">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="shop.jsp"><img src="assets/img/bg/banner7.jpg" alt=""></a>
                        </div>
                    </figure>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="shop.jsp"><img src="assets/img/bg/banner8.jpg" alt=""></a>
                        </div>
                    </figure>
                </div>
            </div>
        </div>
    </div>
    <!--banner area end-->      
       
    <!--testimonial area start-->
    <div class="testimonial_area testimonial_three color_three mb-95">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                     
                       <h2>买家 <span>好评</span></h2>
                    </div>
                </div>
            </div>    
            <div class="testimonial_container2">
                <div class="row">
                    <div class="testimonial_carousel testimonial_column5 owl-carousel">
                        <div class="col-lg-4">
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
                                    <p>“ 续航能力：能用很长时间 佩戴感受：舒服 外观材质：黑色简约好看 3D环绕音效 ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 十五</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“耳机音质很好，在宿舍戴着很方便，去*场慢跑也贴合牢固不会掉，值得这个价位。 ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 汤姆猫</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 在这个价位区间音质方面蛮好的、吃鸡延时肯定是有的毕竟是不能与有线耳机相比!”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- Amber </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 耳机不错很好用 也很牢固 续航也行 性价比很好了！！”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 杰尼龟</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 东西收到了，发货速度挺快的。音质很好，很喜欢! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- Rebecka </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 没想到漫步者竟然有如此高性价比、优良品质的TWS耳机，网易严选不负众望，赞👍🏻! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- Laha</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 没想到漫步者竟然有如此高性价比、优良品质的TWS耳机，网易严选不负众望，赞👍🏻! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 十五</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 没想到漫步者竟然有如此高性价比、优良品质的TWS耳机，网易严选不负众望，赞👍🏻! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 汤姆猫</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 没想到漫步者竟然有如此高性价比、优良品质的TWS耳机，网易严选不负众望，赞👍🏻! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- Amber </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
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
                                    <p>“ 没想到漫步者竟然有如此高性价比、优良品质的TWS耳机，网易严选不负众望，赞👍🏻! ”</p>

                                    <div class="testimonial_author">
                                        <a href="#">- 杰尼龟</a>
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

    <!--newsletter area end-->

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
    <!--footer area end-->
   
    <!-- modal area start-->
  
    
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