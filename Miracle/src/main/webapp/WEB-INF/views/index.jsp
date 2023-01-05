<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>TravelByMe</title>

    <!--=============== [CSS CDN]===============-->

    <!-- --------------- FAVICON --------------- -->
    <link
      rel="shortcut icon"
      href="recources/img/home/favicon.png"
      type="image/x-icon"
    />

    <!-- --------------- REMIXICONS --------------- -->
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <!--=============== [JS CDN] ===============-->

    <!-- --------------- Jquerry --------------- -->
    <script
      src="https://code.jquery.com/jquery-3.6.3.min.js"
      integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
      crossorigin="anonymous"
    ></script>

    <!-- --------------- imagesLoaded --------------- -->
    <script
      type="text/javascript"
      src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"
    ></script>

    <!-- --------------- SCROLLREVEAL --------------- -->
    <script src="https://unpkg.com/scrollreveal"></script>

    <!--=============== [CSS MEMBER]===============-->
    <link rel="stylesheet" href="resources/css/index.css" />
    <link rel="stylesheet" href="resources/css/account/account.css" />
    <link rel="stylesheet" href="resources/css/review/review.css" />
    <link rel="stylesheet" href="resources/css/commnunity/commnunity.css" />
    <link rel="stylesheet" href="resources/css/event/eventMain.css" />
	
    <!--=============== [JS MEMBER]===============-->
    <script src="resources/js/home/nav.js"></script>
    <script src="resources/js/account/account_check.js"></script>
    <script src="resources/js/account/account_go.js"></script>
    <script src="resources/js/review/review_go.js"></script>
    <script src="resources/js/community/community_go.js"></script>
    <script src="resources/js/account/kakaoLogin.js"></script>
    <script src="resources/js/mypage/go.js"></script>
    
    <!-- ---------------------------------------------------------------------------- -->
  </head>

  <body>
    <!--==================== HEADER ====================-->
    <header class="header" id="header">
      <nav class="nav container">
        <a href="index.go" class="nav__logo">
          <!-- index.go -->
          <img src="resources/img/home/logo.png" alt="logo image" /> Travel
        </a>
        <a href="index2.go">2&nbsp;&nbsp;&nbsp;</a>
        <a href="index3.go">3&nbsp;&nbsp;&nbsp;</a>
        <a href="index4.go">4&nbsp;&nbsp;&nbsp;</a>

        <div class="nav__menu" id="nav-menu">
          <ul class="nav__list">
            <li class="nav__item">
              <a href="index.go" class="nav__link">홈</a>
              <!-- index5.go -->
            </li>
            <li class="nav__item">
              <a href="rec.kakao.go" class="nav__link">코스</a>
              <!-- rec5.main.go -->
            </li>
            <li class="nav__item">
              <a style="cursor: pointer" onclick="reviewGo()" class="nav__link">트립리뷰</a>
              <!-- event5.main.go -->
            </li>
            <li class="nav__item">
              <li id="community">
              <a style="cursor: pointer" onclick="communityGo()" class="nav__link">커뮤니티</a>
              <ul class="community_menu">
              <li style="cursor: pointer" onclick="commnunity_one_go()">잡담</li>
              <li style="cursor: pointer" onclick="commnunity_two_go()">Q&amp;A</li>
              <li style="cursor: pointer" onclick="commnunity_three_go()">꿀팁</li>
              </ul>
              </li>
              <!-- myPage5.main.go -->
            <li class="nav__item">
              <a href="myPage.main.go" class="nav__link">뉴스</a>
              <!-- myPage5.main.go -->
            </li>
            <li class="nav__item">
              <a class="nav__link"
                ><jsp:include page="${loginPage }"></jsp:include
              ></a>
              <!-- myPage5.main.go -->
            </li>
          </ul>

          <!-- close button -->
          <div class="nav__close" id="nav-close">
            <i class="ri-close-line"></i>
          </div>

          <img
            src="resources/img/home/leaf-branch-4.png"
            alt="nav image"
            class="nav__img-1"
          />
          <img
            src="resources/img/home/leaf-branch-3.png"
            alt="nav image"
            class="nav__img-2"
          />
        </div>

        <div class="nav__buttons">
          <!-- Theme change button 라이트모드/다크모드-->
          <i class="ri-moon-line change-theme" id="theme-button"></i>

          <!-- Toggle button 폰으로 볼때 위에 내비처럼 생기는거-->
          <div class="nav__toggle" id="nav-toggle">
            <i class="ri-apps-line"></i>
          </div>
        </div>
      </nav>
    </header>

    <div align="center"><jsp:include page="${contentPage }"></jsp:include></div>

    <!--==================== FOOTER ====================-->
    <footer class="footer">
      <div class="footer__container container grid">
        <div>
          <a href="#" class="footer__logo">
            <img src="resources/img/home/logo.png" alt="logo image" /> Travel
          </a>

          <p class="footer__description">
            당신이 선택한 여행 <br />
            다양한 사람과 경험을 나누며 <br />
            여행할수 있도록 도와드립니다.
          </p>
        </div>

        <div class="footer__content">
          <div>
            <h3 class="footer__title">Main Menu</h3>
            <ul class="footer__links">
              <li><a href="#" class="footer__link">코스</a></li>
              <li><a href="#" class="footer__link">트립리뷰</a></li>
              <li><a href="#" class="footer__link">커뮤니티</a></li>
              <li><a href="#" class="footer__link">뉴스</a></li>
            </ul>
          </div>

          <div>
            <h3 class="footer__title">Information</h3>
            <ul class="footer__links">
              <li><a href="#" class="footer__link">Information</a></li>
              <li><a href="#" class="footer__link">Team Miracle</a></li>
              <li><a href="#" class="footer__link">Videos</a></li>
              <li><a href="#" class="footer__link">Reservation</a></li>
            </ul>
          </div>

          <div>
            <h3 class="footer__title">Address</h3>
            <ul class="footer__links">
              <li class="footer__information">
                서울특별시 미라클시 <br />
                미라클빌딩 777호
              </li>
            </ul>
          </div>

          <div>
            <h3 class="footer__title">Social Media</h3>
            <ul class="footer__social">
              <a
                href="https://www.facebook.com"
                target="_blank"
                class="footer__social-link"
              >
                <i class="ri-facebook-circle-fill"></i>
              </a>
              <a
                href="https://www.instagram.com"
                target="_blank"
                class="footer__social-link"
              >
                <i class="ri-instagram-fill"></i>
              </a>
              <a
                href="https://www.twitter.com"
                target="_blank"
                class="footer__social-link"
              >
                <i class="ri-twitter-fill"></i>
              </a>
            </ul>
          </div>
        </div>

        <img
          src="resources/img/home/spring-onion.png"
          alt="footer image"
          class="footer__onion"
        />
        <img
          src="resources/img/home/spinach-leaf.png"
          alt="footer image"
          class="footer__spinach"
        />
        <img
          src="resources/img/home/leaf-branch-4.png"
          alt="footer image"
          class="footer__leaf"
        />
      </div>

      <div class="footer__info container">
        <div class="footer__card">
          <img src="resources/img/home/footer-card-1.png" alt="footer image" />
          <img src="resources/img/home/footer-card-2.png" alt="footer image" />
          <img src="resources/img/home/footer-card-3.png" alt="footer image" />
          <img src="resources/img/home/footer-card-4.png" alt="footer image" />
        </div>

        <span class="footer__copy">
          &#169; Cpoyright TeamMiracle. All rights reserved
        </span>
      </div>
    </footer>

    <!--========== SCROLL UP ==========-->
    <a href="#" class="scrollup" id="scroll-up">
      <i class="ri-arrow-up-line"></i>
    </a>

    <!--=============== MAIN JS ===============-->
    <script src="resources/js/index.js"></script>
  </body>
</html>
