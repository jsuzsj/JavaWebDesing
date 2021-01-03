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
                        <h3>Shop</h3>
                        <ul>
                            <li><a href="index.jsp">首页</a></li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--shop  area start-->
    <div class="shop_area mt-100 mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-12">
                    <!--shop wrapper start-->
                    <!--shop toolbar start-->
                  
                    <!--sidebar widget end-->
                </div>
                <div class="col-lg-9 col-md-12">
                    <!--shop wrapper start-->
                    <!--shop toolbar start-->
                   <div class="shop_toolbar_wrapper">
                        <div class="shop_toolbar_btn">

                            <button data-role="grid_3" type="button" class=" btn-grid-3" data-toggle="tooltip" title="3"></button>

                            <button data-role="grid_4" type="button"  class="active btn-grid-4" data-toggle="tooltip" title="4"></button>

                            <button data-role="grid_list" type="button"  class="btn-list" data-toggle="tooltip" title="List"></button>
                        </div>
                        <div class=" niceselect_option">
                            <form class="select_option" action="#">
                                <select name="orderby" id="short">

                                    <option selected value="1">按平均程度排序</option>
                                    <option  value="2">按受欢迎程度排序</option>
                                    <option value="3">按新鲜程度排序</option>
                                    <option value="4">按最高价降序</option>
                                    <option value="5">按最低价升序</option>
                                
                                </select>
                            </form>
                        </div>
                        <div class="page_amount">
                          
                        </div>
                    </div>
                     <!--shop toolbar end-->
                     <div class="row shop_wrapper">
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                       <a class="secondary_img" href="详情页2.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    <a class="primary_img" href="详情页2.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页2.jsp">Nike耐克官方AIR&nbsp;MONARCH&nbsp;IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页2.jsp">Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
                                       
                                        <div class="price_box"> 
                                            <span class="current_price">￥534.00</span>
                                            <span class="old_price">￥659.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
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
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K&nbsp;TEKNO运动鞋老爹鞋舒适休闲鞋!<br>
                                        </a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克男鞋M2K TEKNO运动鞋老爹鞋舒适休闲鞋!</a></h4>
                                       
                                        <div class="price_box"> 
                                             <span class="current_price">￥709.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="详情页3.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页3.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页3.jsp">Nike耐克官方NIKE&nbsp;AIR&nbsp;FORCE&nbsp;1&nbsp;&apos;07男子运动鞋空军一号板鞋！</a></h4>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页3.jsp">Nike耐克官方NIKE&nbsp;AIR&nbsp;FORCE&nbsp;1&nbsp;&apos;07男子运动鞋空军一号板鞋！</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="详情页4.jsp"><img src="assets/img/product/product7.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页4.jsp"><img src="assets/img/product/product8.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页4.jsp">耐克Air&nbsp;Force&nbsp;1&nbsp;AF1空军一号纯白男女高帮板鞋！</a></h4>
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
                                    </div>
                                    <div class="product_content list_content">

                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                         <h4 class="product_name"><a href="详情页4.jsp">耐克Air&nbsp;Force&nbsp;1&nbsp;AF1空军一号纯白男女高帮板鞋！</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥729.00</span>
                                            <span class="old_price">￥769.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="详情页5.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页5.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页5.jsp">FILA&nbsp;FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥395.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页5.jsp">FILA&nbsp;FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥395.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="详情页6 .jsp"><img src="assets/img/product/product11.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页6 .jsp"><img src="assets/img/product/product12.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页6 .jsp"> CONVERSE匡威1970S三星标黑高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥439.00</span>
                                            <span class="old_price">￥459.00</span>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                       <h4 class="product_name"><a href="详情页6 .jsp"> CONVERSE匡威1970S三星标黑高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥439.00</span>
                                            <span class="old_price">￥459.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                        </div>
                                        <a class="primary_img" href="详情页7.jsp"><img src="assets/img/product/product19.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页7.jsp"><img src="assets/img/product/product20.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页7.jsp">CONVERSE匡威1970S三星标浅蓝色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
                                        </div>
                                        <div class="add_to_cart">
                                            <a href="cart.jsp" title="加入购物车">加入购物车</a>
                                        </div>
                                    </div>
                                    <div class="product_content list_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页7.jsp">CONVERSE匡威1970S三星标浅蓝色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="详情页8.jsp"><img src="assets/img/product/product13.jpg" alt=""></a>
                                        <a class="secondary_img" href="详情页8.jsp"><img src="assets/img/product/product14.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="详情页8.jsp">CONVERSE匡威1970S三星标白色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥425.00</span>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                         <h4 class="product_name"><a href="详情页8.jsp">CONVERSE匡威1970S三星标白色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥425.00</span>
                                            <span class="old_price">￥435.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product20.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product21.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">CONVERSE匡威1970S三星标橙色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                         <h4 class="product_name"><a href="product-details.jsp">CONVERSE匡威1970S三星标橙色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product15.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product16.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp"> Fear of God Converse匡威Chuck70联名FOG花纹高帮帆布鞋</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥339.00</span>
                                            <span class="old_price">￥345.00</span>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                       <h4 class="product_name"><a href="product-details.jsp"> Fear of God Converse匡威Chuck70联名FOG花纹高帮帆布鞋</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥339.00</span>
                                            <span class="old_price">￥345.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE&nbsp;AIR&nbsp;FORCE&nbsp;1&nbsp;&apos;07男子运动鞋空军一号板鞋！</a></h4>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                       <h4 class="product_name"><a href="product-details.jsp">Nike耐克官方NIKE&nbsp;AIR&nbsp;FORCE&nbsp;1&nbsp;&apos;07男子运动鞋空军一号板鞋！</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥749.00</span>
                                            <span class="old_price">￥799.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12 ">
                            <article class="single_product">
                                <figure>
                                    <div class="product_thumb">
                                       <div class="label_product">
                                            <span class="label_new">new</span>
                                            <span class="label_sale">10%</span>
                                        </div>
                                        <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product17.jpg" alt=""></a>
                                        <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product18.jpg" alt=""></a>
                                        <div class="action_links">
                                            <ul>
                                                <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="product_content grid_content">
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.jsp">CONVERSE匡威1970S三星标黄色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                         <h4 class="product_name"><a href="product-details.jsp">CONVERSE匡威1970S三星标黄色高帮低帮男女休闲帆布板鞋酷动城正品</a></h4>
                                        <div class="price_box"> 
                                            <span class="current_price">￥335.00</span>
                                            <span class="old_price">￥345.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.jsp" title="加入购物车">加入购物车</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="快速视图"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="喜欢"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="加以比较"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
                    </div>

                    <div class="shop_toolbar t_bottom">
                        <div class="pagination">
                            <ul>
                                <li class="current">1</li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li class="next"><a href="#">next</a></li>
                            </ul>
                        </div>
                    </div>
                    <!--shop toolbar end-->
                    <!--shop wrapper end-->
       

                  
                    <!--shop toolbar end-->
                    <!--shop wrapper end-->
                </div>
                <div class="col-lg-3 col-md-12">
                 <aside class="sidebar_widget">
                        <div class="widget_inner">
                            <div class="widget_list widget_filter">
                                <h3>价格筛选</h3>
                                <form action="#"> 
                                    <div id="slider-range"></div>   
                                    <button type="submit">筛选</button>
                                    <input type="text" name="text" id="amount" />   

                                </form> 
                            </div>
                            <div class="widget_list widget_color">
                                <h3>颜色分类</h3>
                                <ul>
                                    <li>
                                        <a href="#">黑色  <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> 蓝色 <span>(8)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">棕色 <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> 绿色 <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">粉色 <span>(4)</span></a> 
                                    </li>
                                  
                                </ul>
                            </div>
                            <div class="widget_list widget_color">
                                <h3>尺寸分类</h3>
                                <ul>
                                    <li>
                                        <a href="#">S  <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> M <span>(8)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">L <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> XL <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">XLL <span>(4)</span></a> 
                                    </li>
                                  
                                </ul>
                            </div>
                            <div class="widget_list widget_manu">
                                <h3>品牌</h3>
                                <ul>
                                    <li>
                                        <a href="#">NIKE耐克 <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">CONVERSE匡威<span>(10)</span></a> 
                                    </li>
                                   
                                </ul>
                            </div>
                            <div class="widget_list tags_widget">
                                <h3>产品标签</h3>
                                <div class="tag_cloud">
                                    <a href="#">男鞋</a>
                                    <a href="#">女鞋</a>
                                    <a href="#">潮流</a>
                                    <a href="#">运动</a>
                                    <a href="#">百搭</a>
                                    <a href="#">休闲</a>
                                    <a href="#">耳机</a>
                                
                                </div>
                            </div>
                            <div class="widget_list widget_compare">
                                <h3>比较</h3>
                                <div class="shop_sidebar_product">
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product1.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product2.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details.jsp"></a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">￥709.00</span>
                                                        <span class="old_price">￥799.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product3.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product4.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details.jsp"></a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">￥534.00</span>
                                                        <span class="old_price">￥659.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                    <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <a class="primary_img" href="product-details.jsp"><img src="assets/img/product/product5.jpg" alt=""></a>
                                                    <a class="secondary_img" href="product-details.jsp"><img src="assets/img/product/product6.jpg" alt=""></a>
                                                </div>
                                                <figcaption class="product_content">
                                                    <h4 class="product_name"><a href="product-details.jsp"> </a></h4>
                                                    <div class="product_rating">
                                                       <ul>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       </ul>
                                                    </div>
                                                    <div class="price_box"> 
                                                        <span class="current_price">￥749.00</span>
                                                        <span class="old_price">￥799.00</span> 
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                </div>
                            </div>
                            <div class="widget_list shopside_banner">
                                <div class="banner_thumb">
                                    <a href="#"><img src="assets/img/bg/banner6.jpg" alt="" width="441" height="250"></a>
                                </div>
                            </div>
                        </div>
                    </aside>
                    <!--sidebar widget end-->
                </div>
                </div>
                
    
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
 
    <!--footer area end-->
   
            </div>
        </div>
  
    </footer>
        </div>
    </div>
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