<%@ page import="com.primeplus.cakeshop.entity.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CraveX</title>
    <link rel="stylesheet" href="asset/styles/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        .clearfix {
            content: "";
            display: table;
            clear: both;
        }

        #site-header, #site-footer {
            background: #fff;
        }

        #site-header {
            margin: 0 0 30px 0;
        }

        #site-header h1 {
            font-size: 31px;
            font-weight: 300;
            padding: 40px 0;
            position: relative;
            margin: 0;
        }

        a {
            color: #000;
            text-decoration: none;

            -webkit-transition: color .2s linear;
            -moz-transition: color .2s linear;
            -ms-transition: color .2s linear;
            -o-transition: color .2s linear;
            transition: color .2s linear;
        }

        a:hover {
            color: rgba(255, 57, 57, 0.69);
        }

        #site-header h1 span {
            color: #ff3939;
        }

        #site-header h1 span.last-span {
            background: #fff;
            padding-right: 150px;
            position: absolute;
            left: 217px;

            -webkit-transition: all .2s linear;
            -moz-transition: all .2s linear;
            -ms-transition: all .2s linear;
            -o-transition: all .2s linear;
            transition: all .2s linear;
        }

        #site-header h1:hover span.last-span, #site-header h1 span.is-open {
            left: 363px;
        }

        #site-header h1 em {
            font-size: 16px;
            font-style: normal;
            vertical-align: middle;
        }

        .container {
            margin: 0 auto;
            width: 980px;
        }

        #cart {
            width: 100%;
        }

        #cart h1 {
            font-weight: 300;
        }

        #cart a {
            color: #ff3939;
            text-decoration: none;

            -webkit-transition: color .2s linear;
            -moz-transition: color .2s linear;
            -ms-transition: color .2s linear;
            -o-transition: color .2s linear;
            transition: color .2s linear;
        }

        #cart a:hover {
            color: #000;
        }

        .product.removed {
            margin-left: 980px !important;
            opacity: 0;
        }

        .product {
            border: 1px solid #eee;
            margin: 20px 0;
            width: 100%;
            height: 195px;
            position: relative;

            -webkit-transition: margin .2s linear, opacity .2s linear;
            -moz-transition: margin .2s linear, opacity .2s linear;
            -ms-transition: margin .2s linear, opacity .2s linear;
            -o-transition: margin .2s linear, opacity .2s linear;
            transition: margin .2s linear, opacity .2s linear;
        }

        .product img {
            width: 100%;
            height: 100%;
        }

        .product header, .product .content {
            background-color: #fff;
            border: 1px solid #ccc;
            border-style: none none solid none;
            float: left;
        }

        .product header {
            background: #000;
            margin: 0 1% 20px 0;
            overflow: hidden;
            padding: 0;
            position: relative;
            width: 24%;
            height: 195px;
        }

        .product header:hover img {
            opacity: .7;
        }

        .product header:hover h3 {
            bottom: 73px;
        }

        .product header h3 {
            background: #ff3939;
            color: #fff;
            font-size: 22px;
            font-weight: 300;
            line-height: 49px;
            margin: 0;
            padding: 0 30px;
            position: absolute;
            bottom: -50px;
            right: 0;
            left: 0;

            -webkit-transition: bottom .2s linear;
            -moz-transition: bottom .2s linear;
            -ms-transition: bottom .2s linear;
            -o-transition: bottom .2s linear;
            transition: bottom .2s linear;
        }

        .remove {
            cursor: pointer;
        }

        .product .content {
            box-sizing: border-box;
            -moz-box-sizing: border-box;
            height: 140px;
            padding: 0 20px;
            width: 75%;
        }

        .product h1 {
            color: #ff3939;
            font-size: 25px;
            font-weight: 300;
            margin: 17px 0 20px 0;
        }

        .product footer.content {
            height: 50px;
            margin: 6px 0 0 0;
            padding: 0;
        }

        .product footer .price {
            background: #fcfcfc;
            color: #000;
            float: right;
            font-size: 15px;
            font-weight: 300;
            line-height: 49px;
            margin: 0;
            padding: 0 30px;
        }

        .product footer .full-price {
            background: #ff3939;
            color: #fff;
            float: right;
            font-size: 22px;
            font-weight: 300;
            line-height: 49px;
            margin: 0;
            padding: 0 30px;

            -webkit-transition: margin .15s linear;
            -moz-transition: margin .15s linear;
            -ms-transition: margin .15s linear;
            -o-transition: margin .15s linear;
            transition: margin .15s linear;
        }

        .qt, .qt-plus, .qt-minus {
            display: block;
            float: left;
        }

        .qt {
            font-size: 19px;
            line-height: 50px;
            width: 70px;
            text-align: center;
        }

        .qt-plus, .qt-minus {
            background: #fcfcfc;
            border: none;
            font-size: 30px;
            font-weight: 300;
            height: 100%;
            padding: 0 20px;
            -webkit-transition: background .2s linear;
            -moz-transition: background .2s linear;
            -ms-transition: background .2s linear;
            -o-transition: background .2s linear;
            transition: background .2s linear;
        }

        .qt-plus:hover, .qt-minus:hover {
            background: rgba(255, 57, 57, 0.69);
            color: #fff;
            cursor: pointer;
        }

        .qt-plus {
            line-height: 50px;
        }

        .qt-minus {
            line-height: 47px;
        }

        #site-footer {
            margin: 30px 0 0 0;
        }

        #site-footer {
            padding: 40px;
        }

        #site-footer h1 {
            background: #fcfcfc;
            border: 1px solid #ccc;
            border-style: none none solid none;
            font-size: 24px;
            font-weight: 300;
            margin: 0 0 7px 0;
            padding: 14px 40px;
            text-align: center;
        }

        #site-footer h2 {
            font-size: 24px;
            font-weight: 300;
            margin: 10px 0 0 0;
        }

        #site-footer h3 {
            font-size: 19px;
            font-weight: 300;
            margin: 15px 0;
        }

        .left {
            float: left;
        }

        .right {
            float: right;
        }

        .btn {
            background: #ff3939;
            border: 1px solid #999;
            border-style: none none solid none;
            cursor: pointer;
            display: block;
            color: #fff;
            font-size: 20px;
            font-weight: 300;
            padding: 16px 0;
            width: 290px;
            text-align: center;

            -webkit-transition: all .2s linear;
            -moz-transition: all .2s linear;
            -ms-transition: all .2s linear;
            -o-transition: all .2s linear;
            transition: all .2s linear;
        }

        .btn:hover {
            color: #fff;
            background: rgba(255, 57, 57, 0.69);
        }

        .minused {
            margin: 0 50px 0 0 !important;
        }

        .added {
            margin: 0 -50px 0 0 !important;
        }
    </style>

</head>

<body id="menu">
<div class="container1">

    <div class="nav-box">
        <div class="logo">
            <img src="asset/images/14.png" alt="">
        </div>

        <div class="nav-bar">
            <ul>
                <li>
                    <a href="user-portal.jsp">home</a>
                </li>
                <li>about</li>
                <li>offers</li>
                <li onclick="loadItemsToMenuPage()"><a href="menuPage.jsp">menu</a></li>
                <li>contact</li>
                <li>
                        <i class="fa-solid fa-bag-shopping"></i>
                </li>
            </ul>
        </div>
    </div>


    <!-- ----------------------------------------------------------- -->
    <!-- hero section -->
    <div class="hero-section">
        <div class="box1">
            <h2><span>SWEET</span>SOFT</h2>
        </div>
        <div class="box2">
            <h1>Cakezz</h1>
        </div>
    </div>

    <!--    <div class="footer">-->
    <!--        <a href="#">SEE MORE</a>-->
    <!--    </div>-->
</div>

<div class="box-container mt-5">
    <div section="cart">
        <%-- Dynamically load cart items from the session or request attribute --%>
            <%
                // Retrieve cart items from the session
                List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");

                if (cartItems != null && !cartItems.isEmpty()) {
                    for (CartItem item : cartItems) {
            %>
            <article class="product">
                <header>
                    <a class="remove" href="removeItem?itemId=<%= item.getId() %>">
                        <img src="<%= item.getImage() %>" alt="<%= item.getName() %>">
                        <h3>Remove product</h3>
                    </a>
                </header>

                <div class="content">
                    <h1><%= item.getName() %></h1>
                    <p><%= item.getDescription() != null ? item.getDescription() : "No description available." %></p>
                </div>

                <footer class="content">
                    <span class="qt-minus">-</span>
                    <span class="qt"><%= item.getQuantity() %></span>
                    <span class="qt-plus">+</span>

                    <h2 class="full-price">
                        <%= (item.getPrice() * item.getQuantity()) %>€
                    </h2>

                    <h2 class="price">
                        <%= item.getPrice() %>€
                    </h2>
                </footer>
            </article>
            <%
                }
            } else {
            %>
            <p>Your cart is empty!</p>
            <%
                }
            %>

    </div>
</div>
<footer id="site-footer">
    <div class="container clearfix">

        <div class="left">
            <h2 class="subtotal">Subtotal: <span>163.96</span>€</h2>
            <h3 class="tax">Taxes (5%): <span>8.2</span>€</h3>
            <h3 class="shipping">Shipping: <span>5.00</span>€</h3>
        </div>

        <div class="right">
            <h1 class="total">Total: <span>177.16</span>€</h1>
            <a class="btn">Checkout</a>
        </div>

    </div>
</footer>
<div class="container10">

    <div class="detail1">

        <div class="detail-heading-box">
            <h1>Cravex</h1>
        </div>

        <div class="detail-para">

            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do</p>

        </div>

        <div class="social-media">

            <div class="media1"> <a href="#">
                <img src="https://i.postimg.cc/3R9bC0SB/instagram-1.png" alt="">
            </a></div>

            <div class="media2"> <a href="#">
                <img src="https://i.postimg.cc/4yfRXTM8/facebook.png" alt="">
            </a></div>

            <div class="media3">
                <a href="#">
                    <img src="https://i.postimg.cc/SKBt7kxR/twitter-1.png" alt="">
                </a>
            </div>




        </div>

    </div>

    <!-- ---------------------------------------- -->
    <div class="detail2">

        <div class="detail-heading-box">

            <h1>Contact us</h1>

        </div>


        <div class="address-box">

            <div class="address-logo">
                <img src="https://i.postimg.cc/QC9Q6WYr/pin.png" alt="">
            </div>

            <div class="address-name">
                <h5>Street name 1, City</h5>
            </div>

        </div>


        <div class="address-box">
            <div class="address-logo">
                <img src="https://i.postimg.cc/SRFjdjnn/phone-call.png" alt="">
            </div>
            <div class="address-name">
                <h5>+569 2698 0256</h5>
            </div>
        </div>


        <div class="address-box">

            <div class="address-logo">
                <img src="https://i.postimg.cc/wjdZzzmD/email-1.png" alt="">
            </div>
            <div class="address-name">
                <h5>email@companyname.com</h5>
            </div>

        </div>

        <div class="address-box">

            <div class="address-logo">
                <img src="https://i.postimg.cc/wjdZzzmD/email-1.png" alt="">
            </div>
            <div class="address-name">
                <h5>email2@companyname.com</h5>
            </div>

        </div>

    </div>
    <!-- ---------------------------------------- -->
    <div class="detail3">

        <h1>Subscribe</h1>

        <input type="text" id="name" required placeholder="Enter your email here...">

        <a href="#">Subscribe</a>

        <h6>Get the latest special offers</h6>

    </div>

</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();

    // send all the cart items to the cart-item-servlet from the Cart array in local storage
    $(document).ready(function() {
        var cart = JSON.parse(localStorage.getItem("Cart"));
        var cartItems = [];
        for (var i = 0; i < cart.length; i++) {
            var cartItem = {
                "id": cart[i].id,
                "name": cart[i].name,
                "price": cart[i].price,
                "quantity": cart[i].quantity,
                "description": cart[i].description,
                "image": String(cart[i].image),  // Ensure image is a string
                "discount": cart[i].discount
            };
            cartItems.push(cartItem);
        }

        // Sending the cart items in JSON format via AJAX
        $.ajax({
            type: "POST",
            url: "cart-item-servlet",
            contentType: "application/json",  // Set the Content-Type to application/json
            data: JSON.stringify(cartItems),  // Send the data as a JSON array
            success: function(response) {
                // Optionally, you can handle the response here
                console.log(response);
            },
            error: function(xhr, status, error) {
                console.error("Error: ", error);  // Log error if the request fails
            }
        });
    });

</script>

<script>
    AOS.init();

    var check = false;

    function changeVal(el) {
        var qt = parseFloat(el.parent().children(".qt").html());
        var price = parseFloat(el.parent().children(".price").html());
        var eq = Math.round(price * qt * 100) / 100;

        el.parent().children(".full-price").html( eq + "€" );

        changeTotal();
    }

    function changeTotal() {

        var price = 0;

        $(".full-price").each(function(index){
            price += parseFloat($(".full-price").eq(index).html());
        });

        price = Math.round(price * 100) / 100;
        var tax = Math.round(price * 0.05 * 100) / 100
        var shipping = parseFloat($(".shipping span").html());
        var fullPrice = Math.round((price + tax + shipping) *100) / 100;

        if(price == 0) {
            fullPrice = 0;
        }

        $(".subtotal span").html(price);
        $(".tax span").html(tax);
        $(".total span").html(fullPrice);
    }

    $(document).ready(function(){

        $(".remove").click(function(){
            var el = $(this);
            el.parent().parent().addClass("removed");
            window.setTimeout(
                function(){
                    el.parent().parent().slideUp('fast', function() {
                        el.parent().parent().remove();
                        if($(".product").length == 0) {
                            if(check) {
                                $("#cart").html("<h1>The shop does not function, yet!</h1><p>If you liked my shopping cart, please take a second and heart this Pen on <a href='https://codepen.io/ziga-miklic/pen/xhpob'>CodePen</a>. Thank you!</p>");
                            } else {
                                $("#cart").html("<h1>No products!</h1>");
                            }
                        }
                        changeTotal();
                    });
                }, 200);
        });

        $(".qt-plus").click(function(){
            $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);

            $(this).parent().children(".full-price").addClass("added");

            var el = $(this);
            window.setTimeout(function(){el.parent().children(".full-price").removeClass("added"); changeVal(el);}, 150);
        });

        $(".qt-minus").click(function(){

            child = $(this).parent().children(".qt");

            if(parseInt(child.html()) > 1) {
                child.html(parseInt(child.html()) - 1);
            }

            $(this).parent().children(".full-price").addClass("minused");

            var el = $(this);
            window.setTimeout(function(){el.parent().children(".full-price").removeClass("minused"); changeVal(el);}, 150);
        });

        window.setTimeout(function(){$(".is-open").removeClass("is-open")}, 1200);

        $(".btn").click(function(){
            check = true;
            $(".remove").click();
        });
    });
</script>

</body>
</html>
