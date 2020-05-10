<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Treatment.Pages.Setting.Auth.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>EMCS - Login </title>
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
    <link rel="icon" href="~\Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\bower_components\bootstrap\css\bootstrap.min.css" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\themify-icons\themify-icons.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\icofont\css\icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\css\style.css" />
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\css\jquery.mCustomScrollbar.css"/>

    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\icon\feather\css\feather.css"/>
    <!-- Notification.css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\assets\pages\notification\notification.css" />

     <!-- Animate.css -->
    <link rel="stylesheet" type="text/css" href="~\Theme\files\bower_components\animate.css\css\animate.css"/>

    <script>
        function notify(from, align, icon, type, animIn, animOut, Message_title, new_message) {
            setTimeout(function () {
            $.growl({
                icon: icon,
                title: Message_title,
                message: new_message,
                url: ''
            }, {
                element: 'body',
                type: type,
                allow_dismiss: true,
                placement: {
                    from: from,
                    align: align
                },
                offset: {
                    x: 30,
                    y: 30
                },
                spacing: 10,
                z_index: 999999,
                delay: 2500,
                timer: 10000,
                url_target: '_blank',
                mouse_over: false,
                animate: {
                    enter: animIn,
                    exit: animOut
                },
                icon_type: 'class',
                template: '<div data-growl="container" class="alert" role="alert">' +
                '<button type="button" class="close" data-growl="dismiss">' +
                '<span aria-hidden="true">&times;</span>' +
                '<span class="sr-only">Close</span>' +
                '</button>' +
                '<span data-growl="icon"></span>' +
                '<span data-growl="title"></span>' +
                '<span data-growl="message"></span>' +
                '<a href="#" data-growl="url"></a>' +
                '</div>'
            });
            }, 1000);
        }
    </script>
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
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <!-- Authentication card start -->


                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">

                                        <!--<div class="text-center col-md-12">
                                            <img src="..\..\..\..\Theme\files\assets\images\logo.png" alt="logo.png" />
                                            <br />
                                            <br />
                                        </div>-->
                                        
                                        <div class="col-md-12">
                                            <h3 class="text-center">Login</h3>
                                        </div>
                                    </div>
                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control" required="" placeholder="Your Email"></asp:TextBox>
                                        <span class="form-bar"></span>
                                    </div>
                                    <div class="form-group form-primary">
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" required="" placeholder="Your Password" TextMode="Password"></asp:TextBox>
                                        <span class="form-bar"></span>
                                    </div>
                                    <div class="row m-t-25 text-left">
                                        <div class="col-12">
                                            <div class="forgot-phone text-right f-right">
                                                <a href="ResetPassword.aspx" class="text-right f-w-600">Forgot Password?</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <asp:Button ID="btLogin" runat="server" Text="Login" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20" OnClick="btLogin_Click" />
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0">Welcome...</p>
                                        </div>

                                        <div class="col-md-2">
                                            <img src="..\..\..\..\Theme\files\assets\images\favicon.ico" alt="small-logo.jpg" width="100%" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- end of form -->
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

        </div>
    </form>

    <!-- Warning Section Ends -->
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
    <script type="text/javascript" src="..\..\..\..\Theme\files\assets\js\common-pages.js"></script>

    <!-- notification js -->
   <script type="text/javascript" src="..\..\..\..\Theme\files\assets\js\bootstrap-growl.min.js"></script>
   <script type="text/javascript" src="..\..\..\..\Theme\files\assets\pages\notification\notification.js"></script>



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
