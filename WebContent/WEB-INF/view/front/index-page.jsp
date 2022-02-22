<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BLOG INDEX</title>
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


    
    <!-- owl carousel 2 stylesheet-->
    <link rel="stylesheet" href="plugins/owl-carousel2/assets/owl.carousel.min.css" id="theme-stylesheet">
    <link rel="stylesheet" href="plugins/owl-carousel2/assets/owl.theme.default.min.css" id="theme-stylesheet">
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
            <!-- Navbar Brand --><a href="index.html" class="navbar-brand">Home of Blogs</a>
            <!-- Toggle Button-->
            <button type="button" data-toggle="collapse" data-target="#navbarcollapse" aria-controls="navbarcollapse" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler"><span></span><span></span><span></span></button>
          </div>
          <!-- Navbar Menu -->
          <div id="navbarcollapse" class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item"><a href="" class="nav-link">Home</a>
              </li>
              <li class="nav-item"><a href="blog-page" class="nav-link">Blog</a>
              </li>
              <li class="nav-item"><a href="contact-page" class="nav-link active">Contact</a>
              </li>
            </ul>
            <div class="navbar-text"><a href="#" class="search-btn"><i class="icon-search-1"></i></a></div>
          </div>
        </div>
      </nav>
    </header>

    <!-- Hero Section-->
    <div id="index-slider" class="owl-carousel">
      <section style="background: url(img/featured-pic-1.jpeg); background-size: cover; background-position: center center" class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-7">
              <h1>Greatest blogs, just for you. Don't hesitate to read one per day! Our blogs take breath away!</h1>
              <a href="https://www.urbantravelblog.com/category/nightlife/" class="hero-link">Discover More</a>
            </div>
          </div>
        </div>
      </section>
      <section style="background: url(img/featured-pic-2.jpeg); background-size: cover; background-position: center center" class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-7">
              <h1>Whatever you feel like doing today, just do it. But don't forget to read one of our blogs at least !</h1>
              <a href="https://www.melyssagriffin.com/about-me-page-blog/" class="hero-link">Checkout More</a>
            </div>
          </div>
        </div>
      </section>
      <section style="background: url(img/featured-pic-3.jpeg); background-size: cover; background-position: center center" class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-7">
              <h1>Blogs define a certain phase of life. Make your life more colourful with our blogs !</h1>
              <a href="https://thehackerblog.com/" class="hero-link">Find out More</a>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- Intro Section-->
    <section class="intro">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <h2 class="h3">It is all about Blogs</h2>
            <p class="text-big">To read<strong> good Blogs</strong> means  to <strong> better understand life</strong>.</p>
          </div>
        </div>
      </div>
    </section>
    <section class="featured-posts no-padding-top">
      <div class="container">
        <!-- Post-->
         <c:forEach var="i" begin="0" end="${blog.size()-1}" >
         <c:if test="${i%2 == 1 }">
        <div class="row d-flex align-items-stretch">
          <div class="text col-lg-7">
            <div class="text-inner d-flex align-items-center">
              <div class="content">
                <header class="post-header">
                  <div class="category"><a href="${blog[i].category}">${blog[i].category.name}</a></div><a href="blog-page">
                    <h2 class="h4">${blog[i].name}</h2></a>
                </header>
                <p>${blog[i].text}</p>
                <footer class="post-footer d-flex align-items-center"><a href="${blog[i].image}" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="${blog[i].author.image}" alt="..." class="img-fluid"></div>
                    <div class="title"><span>${blog[i].author.name}</span></div></a>
                  <div class="date"><i class="icon-clock"></i> ${blog[i].time}</div>
                  <div class="comments"><i class="icon-comment"></i>${blog[i].commentsNumber}</div>
                </footer>
              </div>
            </div>
          </div>
          <div class="image col-lg-5"><img src="${blog[i].image}" alt="..."></div>
        </div>
         </c:if>
         
         <c:if test="${i%2 == 0 }">
         
          <div class="row d-flex align-items-stretch">
          <div class="image col-lg-5"><img src="${blog[i].image}" alt="..."></div>
          <div class="text col-lg-7">
            <div class="text-inner d-flex align-items-center">
              <div class="content">
                <header class="post-header">
                  <div class="category"><a href="blog-page">${blog[i].category.name}</a></div><a href="blog-page">
                    <h2 class="h4">${blog[i].name}</h2></a>
                </header>
                <p>${blog[i].text}</p>
                <footer class="post-footer d-flex align-items-center"><a href="blog-author.html" class="author d-flex align-items-center flex-wrap">
                    <div class="avatar"><img src="${blog[i].author.image}" alt="..." class="img-fluid"></div>
                    <div class="title"><span>${blog[i].author.name}</span></div></a>
                  <div class="date"><i class="icon-clock"></i> ${blog[i].time}</div>
                  <div class="comments"><i class="icon-comment">${blog[i].commentsNumber}</i></div>
                </footer>
              </div>
            </div>
          </div>
        </div>
         </c:if>
        </c:forEach>
        
    <!-- Divider Section-->
    <section style="background: url(img/divider-bg.jpg); background-size: cover; background-position: center bottom" class="divider">
      <div class="container">
        <div class="row">
          <div class="col-md-7">
            <h2>If you would like to contact us, we would be very pleased to help. We can give you support every single day!</h2>
            <a href="contact-page" class="hero-link">Contact Us</a>
          </div>
        </div>
      </div>
    </section>
    <!-- Latest Posts -->
    <section class="latest-posts"> 
      <div class="container">
        <header> 
          <h2>Latest Blogs from our Authors</h2>
          <p class="text-big">Always be up to date with our Blogs!</p>
        </header>
       
        <div class="owl-carousel" id="latest-posts-slider">
          <div class="row">
           <c:forEach var="i" begin="0" end="${blog.size()-1}" >
            <div class="post col-md-4">
              <div class="post-thumbnail"><a href="blog-page"><img src="${blog[i].image}" alt="..." class="img-fluid"></a></div>
              <div class="post-details">
                <div class="post-meta d-flex justify-content-between">
                  <div class="date">${blog[i].time}</div>
                  <div class="category"><a href="blog.category">${blog[i].category.name}</a></div>
                </div><a href="blog-post.html">
                  <h3 class="h4">${blog[i].name}</h3></a>
                <p class="text-muted">${blog[i].text}</p>
              </div>
            </div>
            </c:forEach>
            
          </div>
        </div>
      </div>
    </section>
    <!-- Gallery Section-->
    <section class="gallery no-padding">    
      <div class="row">
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="img/gallery-1.jpg" data-fancybox="gallery" class="image">
              <img src="img/gallery-1.jpg" alt="gallery image alt 1" class="img-fluid" title="gallery image title 1">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="img/gallery-2.jpg" data-fancybox="gallery" class="image">
              <img src="img/gallery-2.jpg" alt="gallery image alt 2" class="img-fluid" title="gallery image title 2">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="img/gallery-3.jpg" data-fancybox="gallery" class="image">
              <img src="img/gallery-3.jpg" alt="gallery image alt 3" class="img-fluid" title="gallery image title 3">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        <div class="mix col-lg-3 col-md-3 col-sm-6">
          <div class="item">
            <a href="img/gallery-4.jpg" data-fancybox="gallery" class="image">
              <img src="img/gallery-4.jpg" alt="gallery image alt 4" class="img-fluid" title="gallery image title 4">
              <div class="overlay d-flex align-items-center justify-content-center"><i class="icon-search"></i></div>
            </a>
          </div>
        </div>
        
      </div>
    </section>
    <!-- Page Footer-->
    <footer class="main-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="logo">
              <h6 class="text-white">Blog Site</h6>
            </div>
            <div class="contact-details">
              <p>15 Oxford Street, London</p>
              <p>Phone: (020) 123 456 789</p>
              <p>Email: <a href="mailto:info@company.com">info@blogcompany.com</a></p>
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
                <li> <a href="">Home</a></li>
                <li> <a href="blog-page">Blog</a></li>
                <li> <a href="contact-page">Contact</a></li>
                <li> <a href="#">Login</a></li>
              </ul>
            
            </div>
          </div>
          <div class="col-md-4">
            <div class="latest-posts"><a href="blog-page" >
           
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


    <script src="plugins/owl-carousel2/owl.carousel.min.js"></script>
    <script>
      $("#index-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });

      $("#latest-posts-slider").owlCarousel({
        "items": 1,
        "loop": true,
        "autoplay": true,
        "autoplayHoverPause": true
      });
    </script>
    
  </body>
</html>