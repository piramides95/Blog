<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog Project</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom icon font-->
    <link rel="stylesheet" href="css/fontastic.css">
    <!-- Google fonts - Open Sans-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
    <!-- Fancybox-->
    <link rel="stylesheet" href="vendor/@fancyapps/fancybox/jquery.fancybox.min.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
    <header class="header">
      <!-- Main Navbar-->
      <nav class="navbar navbar-expand-lg">
        <div class="search-area">
          <div class="search-area-inner d-flex align-items-center justify-content-center">
            <div class="close-btn"><i class="icon-close"></i></div>
            <div class="row d-flex justify-content-center">
              <div class="col-md-8">
                <form action="blog-search.html">
                  <div class="form-group">
                    <input type="search" name="search" id="search" placeholder="What are you looking for?">
                    <button type="submit" class="submit"><i class="icon-search-1"></i></button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <!-- Navbar Brand -->
          <div class="navbar-header d-flex align-items-center justify-content-between">
            <!-- Navbar Brand --><a href="index.html" class="navbar-brand">Blog Project</a>
            <!-- Toggle Button-->
            <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
          </div>
          <!-- Navbar Menu -->
          <div id="navbarcollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a href="index-page" class="nav-link">Home</a>
              </li>
              <li class="nav-item"><a href="blog-page" class="nav-link">Blog</a>
              </li>
              <li class="nav-item"><a href="" class="nav-link active">Contact</a>
              </li>
            </ul>
            <div class="navbar-text"><a href="#" class="search-btn"><i class="icon-search-1"></i></a></div>
          </div>
        </div>
      </nav>
    </header>
    <!-- Hero Section -->
    <section style="background: url(img/hero.jpg); background-size: cover; background-position: center center" class="hero">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h1>Have an interesting news or idea? Feel free to contact us! We are available 24/7</h1>
          </div>
        </div>
      </div>
    </section>
    <div class="container">
      <div class="row">
        <!-- Latest Posts -->
        <main class="col-lg-8"> 
          <div class="container">
            <form:form method="post" action="contact-save" modelAttribute="contact" role="form" class="commenting-form">
              <div class="row">
                <div class="form-group col-md-6">
                  <form:input  type="text" placeholder="Your Name" class="form-control" path="name"/>
                  <form:errors path="name" cssClass="text-danger"/>
                </div>
                <div class="form-group col-md-6">
                  <form:input type="email" placeholder="Email Address" class="form-control" path="email"/>
                    <form:errors path="email" cssClass="text-danger"/>
                </div>
                <div class="form-group col-md-12">
                  <form:textarea placeholder="Type your message" class="form-control" rows="20" path="message"/></textarea>
                   <form:errors path="message" cssClass="text-danger"/>
                </div>
                <div class="form-group col-md-12">
                  <button type="submit" class="btn btn-secondary">Submit Your Message</button>
                </div>
              </div>
            </form:form>
          </div>
        </main>
        <aside class="col-lg-4">
          <!-- Widget [Contact Widget]-->
          <div class="widget categories">
            <header>
              <h3 class="h6">Contact Info</h3>
              <div class="item d-flex justify-content-between">
                <span>15 Oxford Street, London</span>
                <span><i class="fa fa-map-marker"></i></span>
              </div>
              <div class="item d-flex justify-content-between">
                <span>(020) 123 456 789</span>
                <span><i class="fa fa-phone"></i></span>
              </div>
              <div class="item d-flex justify-content-between">
                <span>info@blogcompany.com</span>
                <span><i class="fa fa-envelope"></i></span>
              </div>
            </header>
            
          </div>
           <div class="widget latest-posts">
            <header>
              <h3 class="h6">Latest Posts</h3>
            </header>
            <div class="blog-posts"><a href="blog-post.html">
            <c:forEach var="i" begin="0" end="${blog.size()-1}" >
		                <div class="item d-flex align-items-center">
		                  <div class="image"><img src="${blog[i].image}" alt="..." class="img-fluid"></div>
		                  <div class="title"><strong>${blog[i].name}</strong>
		                    <div class="d-flex align-items-center">
		                      <div class="views"><i class="icon-eye"></i>${blog[i].viewNumber}</div>
		                      <div class="comments"><i class="icon-comment"></i>${blog[i].commentsNumber}</div>
		                    </div>
		                  </div>
		                </div></a><a href="blog-post.html">
              </c:forEach>
                
          </div>
        </aside>
      </div>
    </div>
    <!-- Page Footer-->
    <footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="logo">
              <h6 class="text-white">Blog</h6>
            </div>
            <div class="contact-details">
              <p>15 Oxford Street, London</p>
              <p>Phone: (020) 123 456 789</p>
              <p>Email: <a href="mailto:info@blogcompany.com">Info@Company.com</a></p>
              <ul class="social-menu">
                <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-instagram"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-behance"></i></a></li>
                <li class="list-inline-item"><a href="#"><i class="fa fa-pinterest"></i></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
            <div class="menus d-flex">
              <ul class="list-unstyled">
                <li> <a href="index-page">Home</a></li>
                <li> <a href="blog-page">Blog</a></li>
                <li> <a href="">Contact</a></li>
                <li> <a href="#">Login</a></li>
              </ul>
             
            </div>
          </div>
          <div class="col-md-4">
            <div class="latest-posts"><a href="blog-page" >
            <c:forEach var="i" begin="0" end="${blog.size()-1}">
                <div class="post d-flex align-items-center" >
                  <div class="image"><img src="${blog[i].image}" alt="..." class="img-fluid"></div>
                  <div class="title"><strong>${blog[i].name}</strong><span class="date last-meta">${blog[i].time}</span></div>
                </div></a><a href="blog-page">
                </c:forEach>
          </div>
        </div>
      </div>
      <div class="copyrights">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <p>&copy; 2021. All rights reserved. Your great site.</p>
            </div>
            <div class="col-md-6 text-right">
              <p><a href="https://bootstrapious.com/p/bootstrap-carousel" class="text-white">Blog Life</a>
                <!-- Please do not remove the backlink to Bootstrap Temple unless you purchase an attribution-free license @ Bootstrap Temple or support us at http://bootstrapious.com/donate. It is part of the license conditions. Thanks for understanding :)                         -->
              </p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/@fancyapps/fancybox/jquery.fancybox.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>