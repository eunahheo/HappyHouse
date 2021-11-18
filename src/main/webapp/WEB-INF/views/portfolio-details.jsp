<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="include/header.jsp"%>


<main id="main">

	<!-- ======= Breadcrumbs Section ======= -->
	<section class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>Portfolio Details</h2>
				<ol>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="portfolio.jsp">Portfolio</a></li>
					<li>Portfolio Details</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- Breadcrumbs Section -->

	<!-- ======= Portfolio Details Section ======= -->
	<section class="portfolio-details">
		<div class="container">

			<div class="portfolio-details-container">

				<div class="owl-carousel portfolio-details-carousel">
					<img src="${root}/img/portfolio/portfolio-details-1.jpg"
						class="img-fluid" alt=""> <img
						src="${root}/img/portfolio/portfolio-details-2.jpg"
						class="img-fluid" alt=""> <img
						src="${root}/img/portfolio/portfolio-details-3.jpg"
						class="img-fluid" alt="">
				</div>

				<div class="portfolio-info">
					<h3>Project information</h3>
					<ul>
						<li><strong>Category</strong>: Web design</li>
						<li><strong>Client</strong>: ASU Company</li>
						<li><strong>Project date</strong>: 01 March, 2020</li>
						<li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
					</ul>
				</div>

			</div>

			<div class="portfolio-description">
				<h2>This is an example of portfolio detail</h2>
				<p>Autem ipsum nam porro corporis rerum. Quis eos dolorem eos
					itaque inventore commodi labore quia quia. Exercitationem
					repudiandae officiis neque suscipit non officia eaque itaque enim.
					Voluptatem officia accusantium nesciunt est omnis tempora
					consectetur dignissimos. Sequi nulla at esse enim cum deserunt
					eius.</p>
			</div>
		</div>
	</section>
	<!-- End Portfolio Details Section -->

</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-6">
					<div class="footer-info" data-aos="fade-up" data-aos-delay="50">
						<h3>Squadfree</h3>
						<p class="pb-3">
							<em>Qui repudiandae et eum dolores alias sed ea. Qui
								suscipit veniam excepturi quod.</em>
						</p>
						<p>
							A108 Adam Street <br> NY 535022, USA<br>
							<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
							info@example.com<br>
						</p>
						<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
							<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
							<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
					</div>
				</div>

				<div class="col-lg-2 col-md-6 footer-links" data-aos="fade-up"
					data-aos-delay="150">
					<h4>Useful Links</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">About
								us</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
								of service</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
								policy</a></li>
					</ul>
				</div>

				<div class="col-lg-2 col-md-6 footer-links" data-aos="fade-up"
					data-aos-delay="250">
					<h4>Our Services</h4>
					<ul>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Web
								Design</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Web
								Development</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Product
								Management</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
						<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
								Design</a></li>
					</ul>
				</div>

				<div class="col-lg-4 col-md-6 footer-newsletter" data-aos="fade-up"
					data-aos-delay="350">
					<h4>Our Newsletter</h4>
					<p>Tamen quem nulla quae legam multos aute sint culpa legam
						noster magna</p>
					<form action="" method="post">
						<input type="email" name="email"><input type="submit"
							value="Subscribe">
					</form>

				</div>

			</div>
		</div>
	</div>

	<div class="container">
		<div class="copyright">
			&copy; Copyright <strong><span>Squadfree</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</div>
</footer>
<!-- End Footer -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

<!-- Vendor JS Files -->
<script src="${root}/vendor/jquery/jquery.min.js"></script>
<script src="${root}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${root}/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="${root}/vendor/php-email-form/validate.js"></script>
<script src="${root}/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="${root}/vendor/counterup/counterup.min.js"></script>
<script src="${root}/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${root}/vendor/venobox/venobox.min.js"></script>
<script src="${root}/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="${root}/vendor/aos/aos.js"></script>

<!-- Template Main JS File -->
<script src="${root}/js/main.js"></script>

</body>

</html>