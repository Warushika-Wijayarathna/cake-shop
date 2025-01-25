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
    <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

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
                <li onclick="loadItemsToMenuPage()">menu</li>
                <li>contact</li>
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

    <!--    <div class="footer">-->
    <!--        <a href="#">SEE MORE</a>-->
    <!--    </div>-->
</div>

<div class="box-container mt-5">
    <div class="row">
        <div class="col-md-3" style="font-family: var(--subfont-family);">
            <br><br>
            <h4><i class="fa-solid fa-filter" style="color: black; font-size: 20px;"></i> Sort By</h4>
            <form id="filterForm">
                <div class="form-group">
                    <label>Category</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="cake" id="categoryCake">
                        <label class="form-check-label" for="categoryCake">Cake</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="pastry" id="categoryPastry">
                        <label class="form-check-label" for="categoryPastry">Pastry</label>
                    </div>
                </div>
                <div class="form-group">
                    <label>Price Range</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="0-10" id="priceRange0-10">
                        <label class="form-check-label" for="priceRange0-10">$0 - $10</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="10-20" id="priceRange10-20">
                        <label class="form-check-label" for="priceRange10-20">$10 - $20</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="20-30" id="priceRange20-30">
                        <label class="form-check-label" for="priceRange20-30">$20 - $30</label>
                    </div>
                </div>
                <button id="filter-btn" type="button" class="btn btn-primary" onclick="applyFilter()" style="">Apply Filter</button>
            </form>
        </div>
        <div class="col-md-9">
            <div class="row" id="menuItems">
                <%
                    List<Item> items = (List<Item>) session.getAttribute("menu_items");
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
                            <button class="bg-primary rounded-md text-white py-2 px-4" id="add-to-cart"><i class="fa-solid fa-bag-shopping"></i></button>
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
<form action="load-items-to-menu-page" method="post" id="loadItemsForm"style="display: none">
    <button type="submit" id="loadItemsButton"></button>
</form>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init();

    function applyFilter() {
        var categories = [];
        var priceRanges = [];
        var minPrice = 0, maxPrice = Infinity;

        if ($('#categoryCake').is(':checked')) {
            categories.push('cake');
        }
        if ($('#categoryPastry').is(':checked')) {
            categories.push('pastry');
        }

        if ($('#priceRange0-10').is(':checked')) {
            priceRanges.push([0, 10]);
        }
        if ($('#priceRange10-20').is(':checked')) {
            priceRanges.push([10, 20]);
        }
        if ($('#priceRange20-30').is(':checked')) {
            priceRanges.push([20, 30]);
        }

        $('.menu-item').each(function() {
            var itemCategory = $(this).data('category');
            var itemPrice = parseFloat($(this).data('price'));
            var categoryMatch = categories.length === 0 || categories.includes(itemCategory);
            var priceMatch = priceRanges.length === 0 || priceRanges.some(range => itemPrice >= range[0] && itemPrice <= range[1]);

            if (categoryMatch && priceMatch) {
                $(this).addClass('active');
            } else {
                $(this).removeClass('active');
            }
        });
    }

    function loadItemsToMenuPage() {
        $('#loadItemsButton').click();
    }

    $(document).ready(function() {
        applyFilter();
    });
</script>
</body>
</html>
