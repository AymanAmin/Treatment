<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LockScreen.aspx.cs" Inherits="Treatment.Pages.Setting.Auth.LockScreen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lock System</title>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="#" />
    <meta name="keywords" content="Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app" />
    <meta name="author" content="#" />
    <!-- Favicon icon -->
    <link rel="icon" href="..\..\..\..\Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\bower_components\bootstrap\css\bootstrap.min.css" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\themify-icons\themify-icons.css" />
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\feather\css\feather.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\icofont\css\icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\css\style.css" />
</head>
<body class="fix-menu">
    <form id="form1" runat="server">
        <div>
            <!-- Pre-loader start -->
            <div class="theme-loader">
                <div class="ball-scale">
                    <div class='contain'>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                        <div class="ring">
                            <div class="frame"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Pre-loader end -->
            <section class="login-block">
                <!-- Container-fluid starts -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Login card start -->

                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row">                                        
                                        <div class="col-md-12">
                                            <h3 class="text-center"><i class="feather icon-lock text-primary f-60 p-t-15 p-b-20 d-block"></i></h3>
                                        </div>
                                    </div>
                                    <div class="sub-title text-center">
                                        <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                    </div>
                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                                        <span class="form-bar"></span>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <asp:Button ID="Unlock" runat="server" Text=" Unlock System" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" OnClick="Unlock_Click" />
                                        </div>
                                    </div>
                                    <p class="text-inverse text-right"><a href="../../../../Pages/Setting/Auth/Logout.ashx">Switch User</a></p>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <p class="text-inverse text-left m-b-0">Thank you.</p>
                                        </div>
                                        <div class="col-md-4">
                                            <img src="..\..\..\..\Theme\files\assets\images\Logo.png" alt="small-logo.png" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Login card end -->
                        </div>
                        <!-- end of col-sm-12 -->
                    </div>
                    <!-- end of row -->
                </div>
                <!-- end of container-fluid -->
            </section>
            <!-- Warning Section Starts -->
            <!-- Older IE warning message -->
            <!--[if lt IE 10]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="../files/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="../files/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="../files/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="../files/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="../files/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
            <!-- Warning Section Ends -->
        </div>
    </form>

    <!-- Required Jquery -->
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\jquery\js\jquery.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\jquery-ui\js\jquery-ui.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\popper.js\js\popper.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\modernizr\js\modernizr.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\modernizr\js\css-scrollbars.js"></script>
    <!-- i18next.min.js -->
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\i18next\js\i18next.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\i18next-xhr-backend\js\i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\i18next-browser-languagedetector\js\i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\Theme\files\bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>
    <!--Color Script Common-->
    <script type="text/javascript" src="..\..\..\..\Theme\files\assets\js\common-pages.js"></script>


    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-23581568-13');
    </script>
</body>
</html>
