<%@ page import="com.primeplus.cakeshop.entity.Item" %>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

</head>

<body id="home">
<div class="container1">

    <div class="nav-box">
        <div class="logo">
            <img src="asset/images/15.png" alt="">
        </div>

        <div class="nav-bar">
            <ul>
                <li onclick="loadHomeItems()">home</li>
                <li>
                    <a href="#container2">about</a>
                </li>
                <li>
                    <a href="#container3">offers</a>
                </li>
                <li>
                    <a href="menuPage.jsp">menu</a>
                </li>
                <li>
                    <a href="#container10">contact</a>
                </li>
                <li>
                    <a href="cart.jsp">
                        <i class="fa-solid fa-bag-shopping"></i>
                    </a>
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

    <div class="footer">
        <a href="#">SEE MORE</a>
    </div>
</div>

<!-- ---------------------------------------------------------------------------- -->

<div id="container2" class="container2">
    <div class="box1" data-aos="zoom-in">

    </div>
    <div class="box2">
        <div class="about-box">
            <h5>about us</h5>
            <h2>Delivering best ingredients for our trusty cake lovers</h2>
            <p>Welcome to CraveX, where every slice tells a story of love, passion, and indulgence. Founded with a vision to craft extraordinary cakes that ignite joy, we are more than just a cake shop – we are creators of memories. From irresistible flavors to intricate designs, each cake is a masterpiece made with the finest ingredients and a sprinkle of creativity.

                Whether it's a grand celebration or a simple treat to brighten your day, CraveX promises to deliver the perfect combination of taste and artistry. Join us in making every occasion sweeter – because at CraveX, life is meant to be savored.</p>
            <h4>"CraveX – Where Every Bite is a Celebration of Joy!"</h4>
        </div>
    </div>
</div>
<!-- ------------------------------------------------------------------------------------------------------ -->
<div id="container3" class="container3">
    <h1>Special offers</h1>

    <div class="offer-box">

        <div class="num-box1">

            <div class="special-box" data-aos="fade-right">

                <div class="item1">
                    <h5>new in town</h5>
                </div>

                <div class="item2">
                    <img src="asset/images/ChocolateFudge.png" alt="">
                </div>

                <div class="item3">
                    <h3>Chocolate Fudge Cake</h3>
                </div>

                <div class="item4">

                    <div class="product1">
                        fat 18g
                    </div>

                    <div class="product2">
                        sugars 42g
                    </div>

                    <div class="product3">
                        carbs 36g
                    </div>

                </div>

                <div class="item5">

                    <p>Rich and moist chocolate fudge cake layered with creamy frosting, perfect for every occasion.</p>

                </div>

                <div class="item6">

                    <div class="rate1">
                        $20
                    </div>

                    <div class="rate2">
                        <a href="#">learn more</a>
                    </div>

                </div>

            </div>

        </div>
        <!-- ---------------------------------------------------------- -->
        <div class="num-box2">
            <div class="col-md-6 mb-4">
                <!-- --------------------------------------------------- -->
                <%
                    List<Item> items = (List<Item>) session.getAttribute("home_items");
                    if (items != null) {
                        for (Item item : items) {
                %>
                <div id="codepen" data-category="<%= item.getCategoryId() %>" data-price="<%= item.getPrice() %>">
                    <div class="w-[200px] shadow-lg rounded-lg bg-neutral-50 p-4" id="card">
                        <img src="data:image/jpeg;base64,<%= new String(item.getImage()) %>" alt="Product Image" class="w-full h-[200px] object-cover rounded-md"/>
                        <div class="mt-4">
                            <h2 class="font-title text-lg font-semibold"><%= item.getName() %></h2>
                            <p class="mt-2 text-sm text-neutral-700"><%= item.getDescription() %></p>
                        </div>
                        <div class="mt-4 flex justify-between items-center">
                            <span class="text-lg font-semibold">$<%= item.getPrice() %></span>
                            <button class="bg-primary rounded-md text-white py-2 px-4" id="add-to-cart">
                                <i class="fa-solid fa-bag-shopping"></i>
                            </button>
                        </div>
                        <div class="mt-4 flex justify-between items-center">
                            <button class="bg-primary rounded-full text-white w-[40px] h-[40px] flex justify-center items-center">
                                <span class="material-symbols-outlined" id="favourite">favorite</span>
                            </button>
                            <button class="bg-primary rounded-full text-white w-[40px] h-[40px] flex justify-center items-center">
                                <span class="material-symbols-outlined" id="share">share</span>
                            </button>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>

<!-- ---------------------------------------------------------------------------------------=== -->
<div class="container4">

    <div class="container4-box1" data-aos="fade-right">

        <img src="asset/images/container4-1.png" alt="">

    </div>

    <div class="container4-box2">

        <div class="container4-contentbox">
            <h5>-25% OFF</h5>
            <h2>Enjoy our specially prepared cakes for you</h2>
            <h4>Dont miss out on our daily special offers</h4>
            <a href="menuPage.jsp">SEE MENU</a>
        </div>

    </div>
</div>

<!-- ---------------------------------------------------------------------------------------=== -->
<div class="container5">

    <div class="container5-box1">

        <div class="container5-contentbox">
            <h5>-15% OFF</h5>
            <h2>New, amazing pastries offers every day</h2>
            <h4>
                Just add some of our juicy side dishes</h4>
            <a href="menuPage.jsp">SEE MENU</a>
        </div>

    </div>

    <div class="container5-box2" data-aos="fade-right">

        <img src="asset/images/container4-2.png" alt="">


    </div>
</div>

<!-- -------------------------------------------------------------------------------------- -->
<div class="container6">
    <h1>Trending Cakes</h1>

    <div class="trending-box">

        <div class="trending-box-list1" data-aos="zoom-out">
            <div class="photo">
                <img src="asset/images/9.png" alt="">
            </div>

            <div class="heading">
                <h5>Fudgy Muffins</h5>
            </div>

            <div class="para">
                <p>"Rich, chocolatey Fudy Muffins with a luscious glaze – the perfect treat to satisfy your sweet cravings!"</p>
            </div>

            <div class="submit">
                <div class="price">
                    <h4>$8</h4>
                </div>

                <div class="add-cart">
                    <a href="#"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>
            </div>
        </div>

        <!-- ---------------Dynamically will be added------------------------------ -->

    </div>
</div>





<!-- ---------------------------------------------container9---------------------------------- -->

<div class="container9">

    <div class="categories1" data-aos="fade-right">

    </div>

    <div class="categories2" data-aos="fade-right">

    </div>

    <div class="categories3" data-aos="fade-right">

    </div>

    <div class="categories4" data-aos="fade-right">

    </div>
</div>
<!-- ----------------------------------------------container10-------------------------------- -->
<div id="container10" class="container10">

    <div class="detail1">

        <div class="detail-heading-box">
            <h1>CraveX</h1>
        </div>

        <div class="detail-para">
            <p>Welcome to CraveX, where every bite is crafted with love and creativity. Indulge in our irresistible cakes and treats!</p>
        </div>

        <div class="social-media">

            <div class="media1">
                <a href="https://instagram.com/cravexcakes" target="_blank">
                    <img src="https://i.postimg.cc/3R9bC0SB/instagram-1.png" alt="Instagram">
                </a>
            </div>

            <div class="media2">
                <a href="https://facebook.com/cravexcakes" target="_blank">
                    <img src="https://i.postimg.cc/4yfRXTM8/facebook.png" alt="Facebook">
                </a>
            </div>

            <div class="media3">
                <a href="https://twitter.com/cravexcakes" target="_blank">
                    <img src="https://i.postimg.cc/SKBt7kxR/twitter-1.png" alt="Twitter">
                </a>
            </div>

        </div>

    </div>

    <!-- ---------------------------------------- -->
    <div class="detail2">

        <div class="detail-heading-box">
            <h1>Contact Us</h1>
        </div>

        <div class="address-box">
            <div class="address-logo">
                <img src="https://i.postimg.cc/QC9Q6WYr/pin.png" alt="Location">
            </div>
            <div class="address-name">
                <h5>123 Sweet Avenue, Cake City</h5>
            </div>
        </div>

        <div class="address-box">
            <div class="address-logo">
                <img src="https://i.postimg.cc/SRFjdjnn/phone-call.png" alt="Phone">
            </div>
            <div class="address-name">
                <h5>+1 234 567 890</h5>
            </div>
        </div>

        <div class="address-box">
            <div class="address-logo">
                <img src="https://i.postimg.cc/wjdZzzmD/email-1.png" alt="Email">
            </div>
            <div class="address-name">
                <h5>info@cravexcakes.com</h5>
            </div>
        </div>

        <div class="address-box">
            <div class="address-logo">
                <img src="https://i.postimg.cc/wjdZzzmD/email-1.png" alt="Email">
            </div>
            <div class="address-name">
                <h5>support@cravexcakes.com</h5>
            </div>
        </div>

    </div>

    <!-- ---------------------------------------- -->
    <div class="detail3">

        <h1>Subscribe</h1>

        <input type="text" id="name" required placeholder="Enter your email here...">

        <a href="#">Subscribe</a>

        <h6>Get the latest special offers, delicious recipes, and news directly to your inbox!</h6>

    </div>

</div>

<form action="load-home-items" method="post" id="home-items-form">
    <button type="submit" id="home-items-submit" style="display: none;"></button>
</form>




<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init({
        offset:300,
    });

    function loadHomeItems() {
        document.getElementById("home-items-submit").click();
    }
</script>
</body>

</html>
