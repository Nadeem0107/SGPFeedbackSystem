<%@page import="in.co.customer.feedback.sys.ctl.CFSView" %>
    <%@page import="in.co.customer.feedback.sys.bean.UserBean" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet" />
            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
            <!-- MDB -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.css" rel="stylesheet" />

            <!-- MDB -->
            <script type="text/javascript"
                src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.0/mdb.min.js"></script>

            <!-- Custom Styles -->
            <link rel="stylesheet" href="<%=CFSView.APP_CONTEXT%>/css/custom_styles.css">

            <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
            <link rel="stylesheet" href="/resources/demos/style.css">
            <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
            <script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
            <script>
                $(function () {
                    $("#datepicker").datepicker({
                        changeMonth: true,
                        changeYear: true,
                        defaultDate: '01/01/1994'
                    });
                });

                $(function () {
                    $("#datepicker1").datepicker({
                        changeMonth: true,
                        changeYear: true

                    });
                });
            </script>

            <% UserBean userBean=(UserBean) session.getAttribute("user"); boolean userLoggedIn=userBean !=null; String
                welcomeMsg="Hi, " ; if (userLoggedIn) { welcomeMsg +=userBean.getName() + " (" + userBean.getRoleName()
                + ")" ; } else { welcomeMsg +="Guest" ; } %>

                <nav class="navbar navbar-expand-lg navbar-light navbar-premium sticky-top">
                    <div class="container">

                        <!-- Brand (Left) -->
                        <a class="navbar-brand navbar-brand-premium d-flex align-items-center"
                            href="<%=CFSView.WELCOME_CTL%>">
                            <img src="<%=CFSView.APP_CONTEXT%>/image/Logo.png" alt="Logo" class="me-2"
                                style="height: 42px; width: auto; object-fit: contain;">
                            <span class="d-none d-sm-inline">Sanjay Gandhi Polytechnic Feedback System</span>
                            <span class="d-inline d-sm-none">SGP Feedback</span>
                        </a>

                        <!-- Toggler -->
                        <button class="navbar-toggler border-0 shadow-none" type="button" data-mdb-toggle="collapse"
                            data-mdb-target="#navbarMain" aria-controls="navbarMain" aria-expanded="false">
                            <i class="fas fa-bars text-dark"></i>
                        </button>

                        <!-- Links (Center) -->
                        <div class="collapse navbar-collapse" id="navbarMain">
                            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 fw-medium" style="gap: 1.5rem;">
                                <li class="nav-item"><a class="nav-link nav-link-premium"
                                        href="<%=CFSView.WELCOME_CTL%>">Home</a>
                                </li>

                                <% if (userLoggedIn) { long roleId=userBean.getRoleId(); boolean
                                    isPrincipal=(roleId==1); boolean isStudent=(roleId==2); boolean isHOD=(roleId==3);
                                    boolean isFaculty=(roleId==4); %>
                                    <% if (isPrincipal || isHOD) { %>
                                        <li class="nav-item"><a class="nav-link nav-link-premium"
                                                href="<%=CFSView.USER_LIST_CTL%>">Students</a></li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link nav-link-premium dropdown-toggle" href="#"
                                                id="facultyDropdown" role="button" data-mdb-toggle="dropdown"
                                                aria-expanded="false">
                                                Faculty
                                            </a>
                                            <ul class="dropdown-menu border-0 shadow-lg p-2 mt-2"
                                                aria-labelledby="facultyDropdown"
                                                style="border-radius: 12px; min-width: 200px;">
                                                <% if (isPrincipal) { %>
                                                    <li><a class="dropdown-item rounded-2 py-2"
                                                            href="<%=CFSView.TEACHER_CTL%>"><i
                                                                class="fas fa-plus-circle me-2 text-primary"></i>Add
                                                            Faculty</a></li>
                                                    <% } %>
                                                        <li><a class="dropdown-item rounded-2 py-2"
                                                                href="<%=CFSView.TEACHER_LIST_CTL%>"><i
                                                                    class="fas fa-address-book me-2 text-primary"></i>Faculty
                                                                Directory</a>
                                                        </li>
                                            </ul>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link nav-link-premium dropdown-toggle" href="#"
                                                id="feedbackDropdown" role="button" data-mdb-toggle="dropdown"
                                                aria-expanded="false">
                                                Feedbacks
                                            </a>
                                            <ul class="dropdown-menu border-0 shadow-lg p-2 mt-2"
                                                aria-labelledby="feedbackDropdown"
                                                style="border-radius: 12px; min-width: 240px;">
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.TEACHER_FEEDBACK_LIST_CTL%>">Teacher
                                                        Feedback</a></li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.COLLEGE_FACILITIES_FEEDBACK_LIST_CTL%>">College
                                                        Facilities</a></li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.COURSE_END_FEEDBACK_LIST_CTL%>">Course End
                                                        Feedback</a></li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.PARENTS_FEEDBACK_LIST_CTL%>">Parents
                                                        Feedback</a></li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.MID_SEM_FEEDBACK_LIST_CTL%>">Mid-Sem
                                                        Feedback</a></li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.END_SEM_FEEDBACK_LIST_CTL%>">End-Sem
                                                        Feedback</a></li>
                                                <div class="dropdown-divider"></div>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.COMPLAINT_LIST_CTL%>"
                                                        style="color: #dc3545; font-weight: bold;">
                                                        <i class="fas fa-exclamation-triangle me-2"></i>Student
                                                        Complaints</a></li>
                                            </ul>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link nav-link-premium dropdown-toggle" href="#"
                                                id="profileDropdown" role="button" data-mdb-toggle="dropdown"
                                                aria-expanded="false">
                                                Settings
                                            </a>
                                            <ul class="dropdown-menu border-0 shadow-lg p-2 mt-2"
                                                aria-labelledby="profileDropdown"
                                                style="border-radius: 12px; min-width: 200px;">
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.MY_PROFILE_CTL%>"><i
                                                            class="fas fa-user-cog me-2 text-info"></i>My Profile</a>
                                                </li>
                                                <li><a class="dropdown-item rounded-2 py-2"
                                                        href="<%=CFSView.CHANGE_PASSWORD_CTL%>"><i
                                                            class="fas fa-key me-2 text-warning"></i>Change Password</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <% } else if (isStudent) { %>
                                            <li class="nav-item"><a class="nav-link nav-link-premium"
                                                    href="<%=CFSView.TEACHERS_LIST_CTL%>">Faculty</a></li>
                                            <li class="nav-item"><a class="nav-link nav-link-premium"
                                                    href="<%=CFSView.COMPLAINT_CTL%>">Complaint</a></li>
                                            <li class="nav-item"><a class="nav-link nav-link-premium"
                                                    href="<%=CFSView.MY_PROFILE_CTL%>">Profile</a></li>
                                            <li class="nav-item"><a class="nav-link nav-link-premium"
                                                    href="<%=CFSView.CHANGE_PASSWORD_CTL%>">Password</a></li>
                                            <% } else if (isFaculty) { %>
                                                <li class="nav-item"><a class="nav-link nav-link-premium"
                                                        href="<%=CFSView.TEACHER_FEEDBACK_LIST_CTL%>">My Reports</a>
                                                </li>
                                                <li class="nav-item"><a class="nav-link nav-link-premium"
                                                        href="<%=CFSView.MY_PROFILE_CTL%>">Profile</a></li>
                                                <li class="nav-item"><a class="nav-link nav-link-premium"
                                                        href="<%=CFSView.CHANGE_PASSWORD_CTL%>">Password</a></li>
                                                <% } %>
                                                    <% } %>
                            </ul>

                            <!-- Auth Dynamic Content (Right) -->
                            <div class="d-flex align-items-center justify-content-end" style="gap: 1.25rem;">

                                <!-- Language Selection -->
                                <div class="dropdown language-dropdown">
                                    <a class="nav-link-premium dropdown-toggle d-flex align-items-center shadow-none border-0 p-0 m-0"
                                        href="#" id="translateDropdown" role="button" data-mdb-toggle="dropdown"
                                        aria-expanded="false" style="text-transform: none;">
                                        <i class="fas fa-globe-americas me-2 text-primary"></i>
                                        <span id="currentLangLabel">Translate</span>
                                    </a>
                                    <ul class="dropdown-menu border-0 shadow-lg p-2 mt-2"
                                        aria-labelledby="translateDropdown"
                                        style="border-radius: 12px; min-width: 160px;">
                                        <li>
                                            <a class="dropdown-item rounded-2 d-flex align-items-center py-2"
                                                href="javascript:void(0)" onclick="translateLanguage('en')">
                                                <span class="me-2">🇺🇸</span> English
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item rounded-2 d-flex align-items-center py-2"
                                                href="javascript:void(0)" onclick="translateLanguage('kn')">
                                                <span class="me-2">🇮🇳</span> ಕನ್ನಡ
                                            </a>
                                        </li>
                                    </ul>
                                </div>

                                <% if (!userLoggedIn) { %>
                                    <div class="d-flex align-items-center" style="gap: 1rem;">
                                        <a href="<%=CFSView.LOGIN_CTL%>"
                                            class="text-dark fw-bold text-decoration-none">Sign In</a>
                                        <a href="<%=CFSView.USER_REGISTRATION_CTL%>"
                                            class="btn btn-primary px-4 py-2 rounded-3 fw-bold shadow-sm"
                                            style="background-color: #2563eb; font-size: 0.9rem;">
                                            Register
                                        </a>
                                    </div>
                                    <% } else { %>
                                        <div class="user-profile-menu d-none d-md-flex">
                                            <div class="user-avatar-circle">
                                                <%=userBean.getName().substring(0, 1).toUpperCase()%>
                                            </div>
                                            <div class="d-flex flex-column">
                                                <span class="fw-bold text-dark"
                                                    style="font-size: 0.85rem; line-height: 1.2;">
                                                    <%=userBean.getName()%>
                                                </span>
                                                <span class="text-muted" style="font-size: 0.7rem;">
                                                    <%=userBean.getRoleName()%>
                                                </span>
                                            </div>
                                            <div class="ms-2 vertical-divider"
                                                style="height: 24px; width: 1px; background: #e2e8f0;"></div>
                                            <a href="<%=CFSView.LOGIN_CTL%>?operation=logout"
                                                class="btn-logout-premium">
                                                Logout
                                            </a>
                                        </div>

                                        <!-- Mobile Logout Icon -->
                                        <a href="<%=CFSView.LOGIN_CTL%>?operation=logout"
                                            class="d-md-none text-danger fs-5 ms-2">
                                            <i class="fas fa-sign-out-alt"></i>
                                        </a>
                                        <% } %>
                            </div>
                        </div>
                    </div>
                </nav>

                <div id="google_translate_element" style="display:none"></div>
                <script type="text/javascript">
                    function setCookie(key, value, expiry) {
                        var expires = new Date();
                        expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
                        document.cookie = key + '=' + value + ';expires=' + expires.toUTCString() + ';path=/';
                    }

                    function getCookie(key) {
                        var name = key + "=";
                        var decodedCookie = decodeURIComponent(document.cookie);
                        var ca = decodedCookie.split(';');
                        for (var i = 0; i < ca.length; i++) {
                            var c = ca[i];
                            while (c.charAt(0) == ' ') {
                                c = c.substring(1);
                            }
                            if (c.indexOf(name) == 0) {
                                return c.substring(name.length, c.length);
                            }
                        }
                        return "";
                    }

                    function googleTranslateElementInit() {
                        new google.translate.TranslateElement({
                            pageLanguage: 'en',
                            includedLanguages: 'en,kn',
                            layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                            autoDisplay: true
                        }, 'google_translate_element');

                        // Persistent Language Logic
                        var preferredLang = localStorage.getItem('preferredLanguage') || getCookie('selectedLang');
                        if (preferredLang && preferredLang !== 'en') {
                            var checkExist = setInterval(function () {
                                var select = document.querySelector('select.goog-te-combo');
                                if (select) {
                                    if (select.value !== preferredLang) {
                                        translateLanguage(preferredLang);
                                    }
                                    clearInterval(checkExist);
                                }
                            }, 100);
                            setTimeout(function () { clearInterval(checkExist); }, 8000);
                        }
                    }

                    function translateLanguage(langCode) {
                        var select = document.querySelector('select.goog-te-combo');

                        // Update persistence
                        localStorage.setItem('preferredLanguage', langCode);
                        setCookie('selectedLang', langCode, 7);
                        setCookie('googtrans', '/en/' + langCode, 7);

                        // Update UI Label
                        var label = document.getElementById('currentLangLabel');
                        if (label) {
                            label.innerText = (langCode === 'kn') ? 'ಕನ್ನಡ' : 'English';
                        }

                        if (select) {
                            select.value = langCode;
                            select.dispatchEvent(new Event('change'));
                        } else {
                            // Retry once if widget not loaded
                            setTimeout(function () {
                                var selectRetry = document.querySelector('select.goog-te-combo');
                                if (selectRetry) {
                                    selectRetry.value = langCode;
                                    selectRetry.dispatchEvent(new Event('change'));
                                }
                            }, 800);
                        }
                    }

                    // Initial Label Setup
                    document.addEventListener('DOMContentLoaded', function () {
                        var preferredLang = localStorage.getItem('preferredLanguage') || getCookie('selectedLang');
                        var label = document.getElementById('currentLangLabel');
                        if (preferredLang === 'kn' && label) {
                            label.innerText = 'ಕನ್ನಡ';
                        }
                    });
                </script>
                <script type="text/javascript"
                    src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>