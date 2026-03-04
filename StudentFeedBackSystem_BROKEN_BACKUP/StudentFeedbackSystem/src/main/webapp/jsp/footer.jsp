<%@ page import="java.util.Date" %>
    <footer class="footer-premium text-center text-lg-start mt-auto py-4">
        <div class="container p-4">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-12 mb-4 mb-md-0 text-lg-start text-center">
                    <h5 class="text-uppercase fw-bold mb-3" style="color: #1a237e;">Sanjay Gandhi Polytechnic</h5>
                    <p class="text-muted small mb-0">
                        "Vidya Soudha", Sanjay Gandhi Nagar, Ballari - 583104 (Karnataka)<br>
                        Ph: 08392 - 266331 / 267833 | Email: sgpbellary@gmail.com
                    </p>
                </div>

                <div class="col-lg-6 col-md-12 text-lg-end text-center">
                    <div class="social-links mb-3">
                        <a href="#" class="me-3 text-muted"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="me-3 text-muted"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="me-3 text-muted"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="text-muted"><i class="fab fa-instagram"></i></a>
                    </div>
                    <p class="text-muted small mb-0">
                        &copy; <%= new java.util.Date().getYear() + 1900 %> Sanjay Gandhi Polytechnic. All rights
                            reserved.
                    </p>
                </div>
            </div>
        </div>
    </footer>

    <style>
        .footer-premium {
            background-color: #f8fafc;
            border-top: 1px solid #e2e8f0;
        }

        .social-links a:hover {
            color: #2563eb !important;
        }
    </style>