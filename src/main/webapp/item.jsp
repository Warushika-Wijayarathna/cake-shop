<%@ page import="com.primeplus.cakeshop.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="com.primeplus.cakeshop.entity.Item" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Analytics Dashboard - This is an example dashboard created using build-in elements and components.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
    <link href="https://demo.dashboardpack.com/architectui-html-free/main.css" rel="stylesheet">
    <link href="asset/styles/styles.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>


<body>
<div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
    <div class="app-header header-shadow">
        <div class="app-header__logo">
            <div class="logo-src" style="background: url(asset/images/img.png)!important; width: 100px;!important;">
                <img src="asset/images/14.png" alt="" width="150px">
            </div>
            <div class="header__pane ml-auto">
                <div>
                    <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                    </button>
                </div>
            </div>
        </div>
        <div class="app-header__mobile-menu">
            <div>
                <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                </button>
            </div>
        </div>
        <div class="app-header__menu">
                <span>
                    <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                        <span class="btn-icon-wrapper">
                            <i class="fa fa-ellipsis-v fa-w-6"></i>
                        </span>
                    </button>
                </span>
        </div>    <div class="app-header__content">
        <div class="app-header-left">
            <div class="search-wrapper">
                <div class="input-holder">
                    <input id="search-item" type="text" class="search-input" placeholder="Type to search">
                    <button id="search-icon" class="search-icon"><span></span></button>
                </div>
                <button class="close"></button>
            </div>
        </div>
        <div class="app-header-right">
            <div class="header-btn-lg pr-0">
                <div class="widget-content p-0">
                    <div class="widget-content-wrapper">
                        <div class="widget-content-left">
                            <div class="btn-group">
                                <a data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="p-0 btn">
                                    <img width="42" class="rounded-circle" src="assets/images/avatars/1.jpg" alt="">
                                    <i class="fa fa-angle-down ml-2 opacity-8"></i>
                                </a>
                                <div tabindex="-1" role="menu" aria-hidden="true" class="dropdown-menu dropdown-menu-right">
                                    <button type="button" tabindex="0" class="dropdown-item">User Account</button>
                                    <button type="button" tabindex="0" class="dropdown-item">Settings</button>
                                    <h6 tabindex="-1" class="dropdown-header">Header</h6>
                                    <button type="button" tabindex="0" class="dropdown-item">Actions</button>
                                    <div tabindex="-1" class="dropdown-divider"></div>
                                    <button type="button" tabindex="0" class="dropdown-item">Dividers</button>
                                </div>
                            </div>
                        </div>
                        <div class="widget-content-left  ml-3 header-user-info">
                            <div class="widget-heading">
                                Alina Mclourd
                            </div>
                            <div class="widget-subheading">
                                VP People Manager
                            </div>
                        </div>
                        <div class="widget-content-right header-user-info ml-3">
                            <button type="button" class="btn-shadow p-1 btn btn-primary btn-sm show-toastr-example">
                                <i class="fa text-white fa-calendar pr-1 pl-1"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>        </div>
    </div>
    </div>        <div class="ui-theme-settings">
    <button type="button" id="TooltipDemo" class="btn-open-options btn btn-warning">
        <i class="fa fa-cog fa-w-16 fa-spin fa-2x"></i>
    </button>
    <div class="theme-settings__inner">
        <div class="scrollbar-container">
            <div class="theme-settings__options-wrapper">
                <h3 class="themeoptions-heading">Layout Options
                </h3>
                <div class="p-3">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-3">
                                        <div class="switch has-switch switch-container-class" data-class="fixed-header">
                                            <div class="switch-animate switch-on">
                                                <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Fixed Header
                                        </div>
                                        <div class="widget-subheading">Makes the header top fixed, always visible!
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-3">
                                        <div class="switch has-switch switch-container-class" data-class="fixed-sidebar">
                                            <div class="switch-animate switch-on">
                                                <input type="checkbox" checked data-toggle="toggle" data-onstyle="success">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Fixed Sidebar
                                        </div>
                                        <div class="widget-subheading">Makes the sidebar left fixed, always visible!
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <div class="widget-content p-0">
                                <div class="widget-content-wrapper">
                                    <div class="widget-content-left mr-3">
                                        <div class="switch has-switch switch-container-class" data-class="fixed-footer">
                                            <div class="switch-animate switch-off">
                                                <input type="checkbox" data-toggle="toggle" data-onstyle="success">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-content-left">
                                        <div class="widget-heading">Fixed Footer
                                        </div>
                                        <div class="widget-subheading">Makes the app footer bottom fixed, always visible!
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <h3 class="themeoptions-heading">
                    <div>
                        Header Options
                    </div>
                    <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-header-cs-class" data-class="">
                        Restore Default
                    </button>
                </h3>
                <div class="p-3">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h5 class="pb-2">Choose Color Scheme
                            </h5>
                            <div class="theme-settings-swatches">
                                <div class="swatch-holder bg-primary switch-header-cs-class" data-class="bg-primary header-text-light">
                                </div>
                                <div class="swatch-holder bg-secondary switch-header-cs-class" data-class="bg-secondary header-text-light">
                                </div>
                                <div class="swatch-holder bg-success switch-header-cs-class" data-class="bg-success header-text-dark">
                                </div>
                                <div class="swatch-holder bg-info switch-header-cs-class" data-class="bg-info header-text-dark">
                                </div>
                                <div class="swatch-holder bg-warning switch-header-cs-class" data-class="bg-warning header-text-dark">
                                </div>
                                <div class="swatch-holder bg-danger switch-header-cs-class" data-class="bg-danger header-text-light">
                                </div>
                                <div class="swatch-holder bg-light switch-header-cs-class" data-class="bg-light header-text-dark">
                                </div>
                                <div class="swatch-holder bg-dark switch-header-cs-class" data-class="bg-dark header-text-light">
                                </div>
                                <div class="swatch-holder bg-focus switch-header-cs-class" data-class="bg-focus header-text-light">
                                </div>
                                <div class="swatch-holder bg-alternate switch-header-cs-class" data-class="bg-alternate header-text-light">
                                </div>
                                <div class="divider">
                                </div>
                                <div class="swatch-holder bg-vicious-stance switch-header-cs-class" data-class="bg-vicious-stance header-text-light">
                                </div>
                                <div class="swatch-holder bg-midnight-bloom switch-header-cs-class" data-class="bg-midnight-bloom header-text-light">
                                </div>
                                <div class="swatch-holder bg-night-sky switch-header-cs-class" data-class="bg-night-sky header-text-light">
                                </div>
                                <div class="swatch-holder bg-slick-carbon switch-header-cs-class" data-class="bg-slick-carbon header-text-light">
                                </div>
                                <div class="swatch-holder bg-asteroid switch-header-cs-class" data-class="bg-asteroid header-text-light">
                                </div>
                                <div class="swatch-holder bg-royal switch-header-cs-class" data-class="bg-royal header-text-light">
                                </div>
                                <div class="swatch-holder bg-warm-flame switch-header-cs-class" data-class="bg-warm-flame header-text-dark">
                                </div>
                                <div class="swatch-holder bg-night-fade switch-header-cs-class" data-class="bg-night-fade header-text-dark">
                                </div>
                                <div class="swatch-holder bg-sunny-morning switch-header-cs-class" data-class="bg-sunny-morning header-text-dark">
                                </div>
                                <div class="swatch-holder bg-tempting-azure switch-header-cs-class" data-class="bg-tempting-azure header-text-dark">
                                </div>
                                <div class="swatch-holder bg-amy-crisp switch-header-cs-class" data-class="bg-amy-crisp header-text-dark">
                                </div>
                                <div class="swatch-holder bg-heavy-rain switch-header-cs-class" data-class="bg-heavy-rain header-text-dark">
                                </div>
                                <div class="swatch-holder bg-mean-fruit switch-header-cs-class" data-class="bg-mean-fruit header-text-dark">
                                </div>
                                <div class="swatch-holder bg-malibu-beach switch-header-cs-class" data-class="bg-malibu-beach header-text-light">
                                </div>
                                <div class="swatch-holder bg-deep-blue switch-header-cs-class" data-class="bg-deep-blue header-text-dark">
                                </div>
                                <div class="swatch-holder bg-ripe-malin switch-header-cs-class" data-class="bg-ripe-malin header-text-light">
                                </div>
                                <div class="swatch-holder bg-arielle-smile switch-header-cs-class" data-class="bg-arielle-smile header-text-light">
                                </div>
                                <div class="swatch-holder bg-plum-plate switch-header-cs-class" data-class="bg-plum-plate header-text-light">
                                </div>
                                <div class="swatch-holder bg-happy-fisher switch-header-cs-class" data-class="bg-happy-fisher header-text-dark">
                                </div>
                                <div class="swatch-holder bg-happy-itmeo switch-header-cs-class" data-class="bg-happy-itmeo header-text-light">
                                </div>
                                <div class="swatch-holder bg-mixed-hopes switch-header-cs-class" data-class="bg-mixed-hopes header-text-light">
                                </div>
                                <div class="swatch-holder bg-strong-bliss switch-header-cs-class" data-class="bg-strong-bliss header-text-light">
                                </div>
                                <div class="swatch-holder bg-grow-early switch-header-cs-class" data-class="bg-grow-early header-text-light">
                                </div>
                                <div class="swatch-holder bg-love-kiss switch-header-cs-class" data-class="bg-love-kiss header-text-light">
                                </div>
                                <div class="swatch-holder bg-premium-dark switch-header-cs-class" data-class="bg-premium-dark header-text-light">
                                </div>
                                <div class="swatch-holder bg-happy-green switch-header-cs-class" data-class="bg-happy-green header-text-light">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <h3 class="themeoptions-heading">
                    <div>Sidebar Options</div>
                    <button type="button" class="btn-pill btn-shadow btn-wide ml-auto btn btn-focus btn-sm switch-sidebar-cs-class" data-class="">
                        Restore Default
                    </button>
                </h3>
                <div class="p-3">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h5 class="pb-2">Choose Color Scheme
                            </h5>
                            <div class="theme-settings-swatches">
                                <div class="swatch-holder bg-primary switch-sidebar-cs-class" data-class="bg-primary sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-secondary switch-sidebar-cs-class" data-class="bg-secondary sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-success switch-sidebar-cs-class" data-class="bg-success sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-info switch-sidebar-cs-class" data-class="bg-info sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-warning switch-sidebar-cs-class" data-class="bg-warning sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-danger switch-sidebar-cs-class" data-class="bg-danger sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-light switch-sidebar-cs-class" data-class="bg-light sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-dark switch-sidebar-cs-class" data-class="bg-dark sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-focus switch-sidebar-cs-class" data-class="bg-focus sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-alternate switch-sidebar-cs-class" data-class="bg-alternate sidebar-text-light">
                                </div>
                                <div class="divider">
                                </div>
                                <div class="swatch-holder bg-vicious-stance switch-sidebar-cs-class" data-class="bg-vicious-stance sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-midnight-bloom switch-sidebar-cs-class" data-class="bg-midnight-bloom sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-night-sky switch-sidebar-cs-class" data-class="bg-night-sky sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-slick-carbon switch-sidebar-cs-class" data-class="bg-slick-carbon sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-asteroid switch-sidebar-cs-class" data-class="bg-asteroid sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-royal switch-sidebar-cs-class" data-class="bg-royal sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-warm-flame switch-sidebar-cs-class" data-class="bg-warm-flame sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-night-fade switch-sidebar-cs-class" data-class="bg-night-fade sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-sunny-morning switch-sidebar-cs-class" data-class="bg-sunny-morning sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-tempting-azure switch-sidebar-cs-class" data-class="bg-tempting-azure sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-amy-crisp switch-sidebar-cs-class" data-class="bg-amy-crisp sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-heavy-rain switch-sidebar-cs-class" data-class="bg-heavy-rain sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-mean-fruit switch-sidebar-cs-class" data-class="bg-mean-fruit sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-malibu-beach switch-sidebar-cs-class" data-class="bg-malibu-beach sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-deep-blue switch-sidebar-cs-class" data-class="bg-deep-blue sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-ripe-malin switch-sidebar-cs-class" data-class="bg-ripe-malin sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-arielle-smile switch-sidebar-cs-class" data-class="bg-arielle-smile sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-plum-plate switch-sidebar-cs-class" data-class="bg-plum-plate sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-happy-fisher switch-sidebar-cs-class" data-class="bg-happy-fisher sidebar-text-dark">
                                </div>
                                <div class="swatch-holder bg-happy-itmeo switch-sidebar-cs-class" data-class="bg-happy-itmeo sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-mixed-hopes switch-sidebar-cs-class" data-class="bg-mixed-hopes sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-strong-bliss switch-sidebar-cs-class" data-class="bg-strong-bliss sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-grow-early switch-sidebar-cs-class" data-class="bg-grow-early sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-love-kiss switch-sidebar-cs-class" data-class="bg-love-kiss sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-premium-dark switch-sidebar-cs-class" data-class="bg-premium-dark sidebar-text-light">
                                </div>
                                <div class="swatch-holder bg-happy-green switch-sidebar-cs-class" data-class="bg-happy-green sidebar-text-light">
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <h3 class="themeoptions-heading">
                    <div>Main Content Options</div>
                    <button type="button" class="btn-pill btn-shadow btn-wide ml-auto active btn btn-focus btn-sm">Restore Default
                    </button>
                </h3>
                <div class="p-3">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h5 class="pb-2">Page Section Tabs
                            </h5>
                            <div class="theme-settings-swatches">
                                <div role="group" class="mt-2 btn-group">
                                    <button type="button" class="btn-wide btn-shadow btn-primary btn btn-secondary switch-theme-class" data-class="body-tabs-line">
                                        Line
                                    </button>
                                    <button type="button" class="btn-wide btn-shadow btn-primary active btn btn-secondary switch-theme-class" data-class="body-tabs-shadow">
                                        Shadow
                                    </button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>        <div class="app-main">
    <div class="app-sidebar sidebar-shadow">
        <div class="app-header__logo">
            <div class="logo-src"></div>
            <div class="header__pane ml-auto">
                <div>
                    <button type="button" class="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                    </button>
                </div>
            </div>
        </div>
        <div class="app-header__mobile-menu">
            <div>
                <button type="button" class="hamburger hamburger--elastic mobile-toggle-nav">
                                <span class="hamburger-box">
                                    <span class="hamburger-inner"></span>
                                </span>
                </button>
            </div>
        </div>
        <div class="app-header__menu">
                        <span>
                            <button type="button" class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
                                <span class="btn-icon-wrapper">
                                    <i class="fa fa-ellipsis-v fa-w-6"></i>
                                </span>
                            </button>
                        </span>
        </div>    <div class="scrollbar-sidebar">
        <div class="app-sidebar__inner">
            <ul class="vertical-nav-menu">
                <li class="app-sidebar__heading">Dashboards</li>
                <li>
                    <a href="user-portal.jsp" class="mm-active">
                        <i class="metismenu-icon pe-7s-rocket"></i>
                        User Portal
                    </a>
                </li>
                <li>
                    <a href="admin-portal.jsp" class="mm-active">
                        <i class="metismenu-icon pe-7s-rocket"></i>
                        Admin Portal
                    </a>
                </li>
                <li class="app-sidebar__heading">UI Components</li>
                <li>
                    <a href="item.jsp">
                        <i class="metismenu-icon pe-7s-diamond"></i>
                        Items
                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                    </a>
                </li>

                <li>
                    <a href="order.jsp">
                        <i class="metismenu-icon pe-7s-diamond"></i>
                        Orders
                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                    </a>
                </li>
                <li>
                    <a href="admin.jsp">
                        <i class="metismenu-icon pe-7s-diamond"></i>
                        Admins
                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                    </a>
                </li>
                <li>
                    <a href="followers.jsp">
                        <i class="metismenu-icon pe-7s-diamond"></i>
                        Followers
                        <i class="metismenu-state-icon pe-7s-angle-down caret-left"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    </div>
    <div class="app-main__outer">
        <div id="item-section" class="app-main__inner">
            <div class="app-page-title">
                <div class="page-title-wrapper">
                    <div class="page-title-heading">
                        <div class="page-title-icon">
                            <i class="pe-7s-box2 icon-gradient bg-mean-fruit"></i>
                        </div>
                        <div>Item Management
                            <div class="page-title-subheading">Manage your items here.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="add-item" class="row">
                <div class="col-md-12">
                    <div class="main-card mb-3 card">
                        <div class="card-header">Add New Item</div>
                        <div class="card-body">
                            <form id="item-form" action="${pageContext.request.contextPath}/add-item-servlet" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemName">Item Name</label>
                                            <input name="name" id="itemName" placeholder="Item Name" type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemDescription">Description</label>
                                            <textarea name="description" id="itemDescription" placeholder="Description" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemImage">Image</label>
                                            <input name="image" id="itemImage" type="file" class="form-control-file" accept="image/*">                                </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemPrice">Price</label>
                                            <input name="price" id="itemPrice" placeholder="Price" type="number" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemDiscount">Discount</label>
                                            <input name="discount" id="itemDiscount" placeholder="Discount" type="number" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="position-relative form-group">
                                            <label for="itemQuantity">Quantity</label>
                                            <input name="quantity" id="itemQuantity" placeholder="Quantity" type="number" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="position-relative form-group">
                                            <label for="itemCategory">Category</label>
                                            <div style="display: flex; align-items: center;">
                                                <select name="category_id" id="itemCategory" class="form-control" onclick="loadCategories()" style="margin-right: 5px;">
                                                    <%
                                                        List<Category> categoriess = (List<Category>) session.getAttribute("category");
                                                        if (categoriess != null) {
                                                            for (Category category : categoriess) {
                                                    %>
                                                    <option value="<%= category.getId() %>"><%= category.getId() %> - <%= category.getName() %></option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                                <button id="add-cat-btn" type="button" class="btn btn-secondary"  onclick="showAddCategoryModal()">+</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="button" id="add-iem-btn" onclick="addItem(event)" class="mt-1 btn btn-primary">Submit</button>
                            </form>
                            <form id="load-categories" action="${pageContext.request.contextPath}/load-all-category-servlet" method="post" style="display: none">
                                <button type="submit" id="load-cat-btn" class="mt-1 btn btn-primary">Load Categories</button>
                            </form>

                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="main-card mb-3 card">
                        <div id="all-items" class="card-header" onclick="loadItems()">All Items</div>
                        <div class="card-body">
                            <table id="itemTable" class="mb-0 table table-bordered">
                                <thead>
                                <tr>
                                    <th onclick="sortTable(0)">#</th>
                                    <th>Image</th>
                                    <th onclick="sortTable(2)">Name</th>
                                    <th onclick="sortTable(3)">Description</th>
                                    <th onclick="sortTable(4)">Price</th>
                                    <th onclick="sortTable(5)">Discount</th>
                                    <th onclick="sortTable(6)">Quantity</th>
                                    <th onclick="sortTable(7)">Category</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    List<Item> items = (List<Item>) session.getAttribute("items");
                                    if (items != null) {
                                        for (Item item : items) {
                                %>
                                <tr>
                                    <td><%= item.getId() %></td>
                                    <td>
                                        <img src="data:image/jpeg;base64,<%= new String(item.getImage()) %>"
                                             alt="Item Image" width="50" height="50">
                                    </td>
                                    <td><%= item.getName() %></td>
                                    <td><%= item.getDescription() %></td>
                                    <td><%= item.getPrice() %></td>
                                    <td><%= item.getDiscount() %></td>
                                    <td><%= item.getQuantity() %></td>
                                    <td><%= item.getCategoryId() %></td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/edit-item-servlet" method="post" style="display:inline;">
                                            <input type="hidden" name="itemId" value="<%= item.getId() %>">
                                            <button type="submit" class="btn btn-warning btn-sm">Edit</button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/delete-item-servlet" method="post" style="display:inline;">
                                            <input type="hidden" name="itemId" value="<%= item.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-sm" onclick="
                                            deleteItem()">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>
</div>
</div>
<form id="load-items-form" action="${pageContext.request.contextPath}/load-all-items-servlet" method="post" style="display: none">
    <button type="submit" id="load-item-btn" class="mt-1 btn btn-primary">Load Items</button>
</form>

<div id="addCategoryModal" class="modal" tabindex="-1" role="dialog" style="display: none;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title">Manage Categories</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <!-- Form to Add a New Category -->
                <form id="addCategoryForm" action="${pageContext.request.contextPath}/add-category-servlet" method="post">
                    <div class="form-group">
                        <label for="newCategoryName">Category Name</label>
                        <input type="text" id="newCategoryName" name="category" class="form-control" placeholder="Enter category name">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Add Category</button>
                </form>

                <!-- Divider -->
                <hr>

            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- External Scripts -->
<script type="text/javascript" src="https://demo.dashboardpack.com/architectui-html-free/assets/scripts/main.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Popper.js (required for Bootstrap JS) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    // Function to scroll to a section and update the URL without reloading the page

    // Show the "Add Category" modal
    function showAddCategoryModal() {
        $('#addCategoryModal').modal('show');
    }

    // Submit the form to add an item, then redirect
    function addItem(event) {
        event.preventDefault();
        var itemForm = document.getElementById('item-form');
        if (itemForm) {
            itemForm.submit();
            goToSection('item-section');
        }
    }

    // Load items by triggering the load item button click
    function loadItems() {
        return new Promise((resolve, reject) => {
            console.log("Loading items...");
            const loadItemsForm = document.getElementById('load-item-btn');
            if (loadItemsForm) {
                loadItemsForm.click();
                resolve();
                goToSection('item-section');
            } else {
                reject("load-item-btn not found");
            }
        });
    }

    // Load categories by triggering the load category button click
    function loadCategories() {
        console.log("Loading categories...");
        const loadCategoriesForm = document.getElementById('load-cat-btn');
        if (loadCategoriesForm) {
            loadCategoriesForm.click();
            goToSection('item-section');
        } else {
            console.error("load-cat-btn not found");
        }
    }

    // Show message alert if session contains a message
    <% if (session.getAttribute("message") != null) { %>
    Swal.fire({
        icon: 'info',
        title: 'Message',
        text: '<%= session.getAttribute("message") %>'
    });
    <% session.removeAttribute("message"); %>
    <% } %>

    // Submit the edit form for category
    function submitEditForm(button) {
        const form = button.closest('tr').querySelector('.edit-category-form');
        if (form) {
            form.submit();
        }
    }

    $(document).ready(function() {
        $("#search-item").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#itemTableBody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.getElementById("itemTable");
        switching = true;
        // Set the sorting direction to ascending:
        dir = "asc";
        /* Make a loop that will continue until
        no switching has been done: */
        while (switching) {
            // Start by saying: no switching is done:
            switching = false;
            rows = table.rows;
            /* Loop through all table rows (except the
            first, which contains table headers): */
            for (i = 1; i < (rows.length - 1); i++) {
                // Start by saying there should be no switching:
                shouldSwitch = false;
                /* Get the two elements you want to compare,
                one from current row and one from the next: */
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                /* Check if the two rows should switch place,
                based on the direction, asc or desc: */
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        // If so, mark as a switch and break the loop:
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                /* If a switch has been marked, make the switch
                and mark that a switch has been done: */
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                // Each time a switch is done, increase this count by 1:
                switchcount ++;
            } else {
                /* If no switching has been done AND the direction is "asc",
                set the direction to "desc" and run the while loop again. */
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }
</script>
<script>
    function deleteItem(itemId) {
        // Create a form element
        const form = document.createElement('form');
        form.setAttribute('action', `${pageContext.request.contextPath}/delete-item-servlet`); // Set form action
        form.setAttribute('method', 'post'); // Set form method

        // Create a hidden input for itemId
        const input = document.createElement('input');
        input.setAttribute('type', 'hidden');
        input.setAttribute('name', 'itemId');
        input.setAttribute('value', itemId); // Pass the item ID dynamically
        form.appendChild(input);

        // Append the form to the body
        document.body.appendChild(form);

        // Submit the form
        form.submit();
    }
</script>
</body>
</html>
