<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored ="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">
<c:if test="${empty shops_desc}">
    <c:redirect url="/ForwardShopsServlet"></c:redirect>
</c:if>
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
                        <ul>
                            <li><a href="index.jsp">首页</a></li>
                            <li>商品详情页</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--product details start-->
    <div class="product_details mt-100 mb-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product-details-tab">
                        <div id="img-1" class="zoomWrapper single-zoom">
                            <a href="#">
                                <img id="zoom1" src="assets/img/product/productbig7.jpg" data-zoom-image="assets/img/product/productbig7.jpg" alt="big-1">
                            </a>
                        </div>
                        <div class="single-zoom-thumb">
                            <ul class="s-tab-zoom owl-carousel single-product-active" id="gallery_01">
                                <li>
                                    <a href="#" class="elevatezoom-gallery active" data-update="" data-image="assets/img/product/productbig7.jpg" data-zoom-image="assets/img/product/productbig7.jpg">
                                        <img src="assets/img/product/productbig7.jpg" alt="zo-th-1"/>
                                    </a>

                                </li>
                                <li >
                                    <a href="#" class="elevatezoom-gallery active" data-update="" data-image="assets/img/product/productbig8.jpg" data-zoom-image="assets/img/product/productbig8.jpg">
                                        <img src="assets/img/product/productbig8.jpg" alt="zo-th-1"/>
                                    </a>

                                </li>
                                <li >
                                    <a href="#" class="elevatezoom-gallery active" data-update="" data-image="assets/img/product/productbig5.jpg" data-zoom-image="assets/img/product/productbig5.jpg">
                                        <img src="assets/img/product/productbig5.jpg" alt="zo-th-1"/>
                                    </a>

                                </li>
                                <li >
                                    <a href="#" class="elevatezoom-gallery active" data-update="" data-image="assets/img/product/productbig6.jpg" data-zoom-image="assets/img/product/productbig6.jpg">
                                        <img src="assets/img/product/productbig6.jpg" alt="zo-th-1"/>
                                    </a>

                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product_d_right">
                       <form action="#">
                           
                            <h1><a href="#"> Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h1>
                            <div class="product_nav">
                                <ul>
                                    <li class="prev"><a href="product-details.jsp"><i class="fa fa-angle-left"></i></a></li>
                                    <li class="next"><a href="variable-product.html"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                            <div class=" product_ratting">
                                <ul>
                                    <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                   <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                   <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                   <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                   <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                    <li class="review"><a href="#">  </a></li>
                                </ul>
                                
                            </div>
                            <div class="price_box">
                                <span class="current_price">￥543.00</span>
                                <span class="old_price">￥659.00</span>
                                
                            </div>
                            <div class="product_desc">
                                <p> </p>
                            </div>
                            <div class="product_variant color">
                                <h3>颜色</h3>
                               
                                <ul>
                                    <li class="color1"><a href="#"></a></li>
                                    <li class="color2"><a href="#"></a></li>
                                    <li class="color3"><a href="#"></a></li>
                                    <li class="color4"><a href="#"></a></li>
                                </ul>
                            </div>
                            <div class="product_variant quantity">
                                <label>数量</label>
                                <input min="1" max="100" value="1" type="number">
                                <button class="button" type="submit">加入购物车</button>  
                                
                            </div>
                            <div class=" product_d_action">
                               <ul>
                                   <li><a href="#" title="Add to wishlist">+ 加入购物清单</a></li>
                                   <li><a href="#" title="Add to wishlist">+ 比较</a></li>
                               </ul>
                            </div>
                            <div class="product_meta">
                                <span>品牌: <a href="#">nike耐克</a></span>
                            </div>
                            
                        </form>
                        <div class="priduct_social">
                            <ul>
                                <li><a class="facebook" href="#" title="facebook"><i class="fa fa-facebook"></i> 喜欢</a></li>           
                                <li><a class="twitter" href="#" title="twitter"><i class="fa fa-twitter"></i> 推特</a></li>           
                                <li><a class="pinterest" href="#" title="pinterest"><i class="fa fa-pinterest"></i> 保存</a></li>           
                                <li><a class="google-plus" href="#" title="google +"><i class="fa fa-google-plus"></i> 分享</a></li>        
                                <li><a class="linkedin" href="#" title="linkedin"><i class="fa fa-linkedin"></i> 联系</a></li>        
                            </ul>      
                        </div>

                    </div>
                </div>
            </div>
        </div>    
    </div>
    <!--product details end-->
    
    <!--product info start-->
    <div class="product_d_info mb-90">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="product_d_inner">   
                        <div class="product_info_button">    
                            <ul class="nav" role="tablist">
                                <li >
                                    <a class="active" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">商品详情</a>
                                </li>
                                <li>
                                     <a data-toggle="tab" href="#sheet" role="tab" aria-controls="sheet" aria-selected="false"></a>
                                </li>
                                <li>
                                   <a data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">累计评价 (1)</a>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="info" role="tabpanel" >
                                <div class="product_info_content">
                                  <ul>
                                    <li> 品牌名称：Nike/耐克</li>
                                    <li>产品参数：</li>
                                    <li>品牌: Nike/耐克功能: 减震</li>
                                    <li>鞋码: 38.5 39 40 40.5 41 42 42.5 43 44 44.5 45 45.5 46 47.5</li>
                                    <li>颜色分类: 002黑/白色 001黑/大学红/白色 004狼灰/白 400深藏青/白-海雾蓝 402深藏青/太空灰-激光红-芬蓝-白适合路面: 公路吊牌价: 599</li>
                                    <li>款号: CI3787..上市时间: 2019年秋季适用场景: 休闲健步</li>
                                    <li>性别: 男子 是否商场同款: 是</li>
                                   
                                </ul>
                                    
                                </div>    
                            </div>
                            <div class="tab-pane fade" id="sheet" role="tabpanel" >
                                
                                <div class="product_info_content">
                                  
                                </div>    
                            </div>

                            <div class="tab-pane fade" id="reviews" role="tabpanel" >
                                <div class="reviews_wrapper">
                                    <h2>十五</h2>
                                    <div class="reviews_comment_box">
                                        <div class="comment_thmb">
                                            <img src="assets/img/about/testimonial1.png" alt="">
                                        </div>
                                        <div class="comment_text">
                                            <div class="reviews_meta">
                                                <div class="star_rating">
                                                    <ul>
                                                        <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                       <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                                    </ul>   
                                                </div>
                                                <p><strong>十五 </strong>- 2020.11.1</p>
                                                <span>鞋子挺好的，穿着很舒适！！</span>
                                            </div>
                                        </div>
                                        
                                    </div>
                                    <div class="comment_title">
                                        <h2>追加评论 </h2>
                                        <p>鞋子真的超级舒适！ </p>
                                    </div>
                                    <div class="product_ratting mb-10">
                                       <h3>回复</h3>
                                        <ul>
                                            <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                            <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product_review_form">

                                        <form action="#">
                                            <div class="row">
                                                <div class="col-12">
                                                    <label for="review_comment"></label>
                                                    <textarea name="comment" id="review_comment" ></textarea>
                                                </div> 
                                                <div class="col-lg-6 col-md-6">
                                                    <label for="author">名称</label>
                                                    <input id="author"  type="text">

                                                </div> 
                                                <div class="col-lg-6 col-md-6">
                                                    <label for="email">	QQ/微信 </label>
                                                    <input id="email"  type="text">
                                                </div>  
                                            </div>
                                            <button type="submit">回复</button>
                                         </form>   
                                    </div> 
                                </div>     
                            </div>
                        </div>
                    </div>     
                </div>
            </div>
        </div>    
    </div>  
    <!--product info end-->
    
    <!--product area start-->
      <section class="product_area related_products">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                       <h2>店长 <span>推荐</span></h2>
                    
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
                                    <a class="primary_img" href="详情页2.jsp"><img src="assets/img/product/product10.jpg" alt=""></a>
                                    <a class="secondary_img" href="详情页2.jsp"><img src="assets/img/product/product9.jpg" alt=""></a>
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
                                    <h4 class="product_name"><a href="详情页2.jsp">FILA FUSION潮牌男休闲鞋秋冬新款CAGE时尚运动鞋!</a></h4>
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
                                    <h4 class="product_name"><a href="详情页2.jsp"> Nike耐克官方AIR MONARCH IV男子训练鞋休闲健身老爹鞋潮流!</a></h4>
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
    </section>
    <!--product area end-->
    
     <!--product area start-->
    <section class="product_area upsell_products">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                       <h2>店内热销<span></span></h2>
                     
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
                                            <a class="primary_img" href="详情页5.jsp"><img src="assets/img/product/product21.jpg" alt=""></a>
                                            <a class="secondary_img" href="详情页5.jsp"><img src="assets/img/product/product11.jpg" alt=""></a>
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
                                            <h4 class="product_name"><a href="详情页5.jsp">CONVERSE匡威1970s高帮三星标男鞋女鞋休闲帆布鞋!</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">￥420.00</span>
                                                <span class="old_price">￥430.00</span>
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
                                            <a class="primary_img" href="详情页6 .jsp"><img src="assets/img/product/product20.jpg" alt=""></a>
                                            <a class="secondary_img" href="详情页6 .jsp"><img src="assets/img/product/product11.jpg" alt=""></a>
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
                                            <h4 class="product_name"><a href="详情页6 .jsp">CONVERSE匡威1970s高帮三星标男鞋女鞋休闲帆布鞋</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">￥420.00</span>
                                                <span class="old_price">￥450.00</span>
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
                                            <a class="primary_img" href="详情页7.jsp"><img src="assets/img/product/product19.jpg" alt=""></a>
                                            <a class="secondary_img" href="详情页7.jsp"><img src="assets/img/product/product12.jpg" alt=""></a>
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
                                            <h4 class="product_name"><a href="详情页7.jsp">CONVERSE匡威1970s高帮三星标男鞋女鞋休闲帆布鞋</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">￥339.00</span>
                                                <span class="old_price">￥350.00</span>
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
                                            <a class="primary_img" href="详情页8.jsp"><img src="assets/img/product/product18.jpg" alt=""></a>
                                            <a class="secondary_img" href="详情页8.jsp"><img src="assets/img/product/product13.jpg" alt=""></a>
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
                                            <h4 class="product_name"><a href="详情页8.htmll"> CONVERSE匡威1970s高帮三星标男鞋女鞋休闲帆布鞋</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">￥435.00</span>
                                                <span class="old_price">￥460.00</span>
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
                                            <a class="primary_img" href="详情页7.jsp"><img src="assets/img/product/product17.jpg" alt=""></a>
                                            <a class="secondary_img" href="详情页7.jsp"><img src="assets/img/product/product14.jpg" alt=""></a>
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
                                            <h4 class="product_name"><a href="详情页7.jsp"> CONVERSE匡威1970s高帮三星标男鞋女鞋休闲帆布鞋</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">￥435.00</span>
                                                <span class="old_price">￥460.00</span>
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
    <!--product area end-->
    
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
            </div>
        </div>
    </section>
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