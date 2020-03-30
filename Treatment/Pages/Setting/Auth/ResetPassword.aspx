<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Treatment.Pages.Setting.Auth.ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ECMS - Rest Password </title>
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
    <link rel="icon" href="..\..\..\..\..\Theme\files\assets\images\favicon.ico" type="image/x-icon" />
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet" />
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\bower_components\bootstrap\css\bootstrap.min.css" />
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\icon\themify-icons\themify-icons.css" />
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\icon\icofont\css\icofont.css" />
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\css\style.css" />
    <!-- Notification.css -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\pages\notification\notification.css" />

    <!-- feather Awesome -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\icon\feather\css\feather.css" />

    <!-- Animate.css -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\bower_components\animate.css\css\animate.css" />

    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\css\style.css" />
    <link rel="stylesheet" type="text/css" href="..\..\..\..\..\Theme\files\assets\css\jquery.mCustomScrollbar.css" />

    <script>
        function show_model_sucess() {
            setTimeout(() => { document.getElementById("buttonModel_Sucess").click();}, 1000);
        }

        function show_model_error() {
            setTimeout(() => { document.getElementById("buttonModel_Error").click(); }, 1000);
        }

        function show_model_notfound() {
            setTimeout(() => { document.getElementById("buttonModel_Notfound").click(); }, 1000);
        }

    </script>
</head>
<body class="fix-menu">
    <button type="button" style="display: none;" id="buttonModel_Sucess" class="btn btn-info waves-effect" data-toggle="modal" data-target="#Modal-lightbox_sucess"></button>
    <!-- Modal sucess -->
    <div class="modal fade" id="Modal-lightbox_sucess" tabindex="-1" role="dialog" style="margin-top:11%;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <img src="..\..\..\..\Theme\files\assets\images\success.png" alt="" class="img img-fluid" />
                    <div class="">
                        <h5>The Email Sent Sucessfully</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button type="button" style="display: none;" id="buttonModel_Error" class="btn btn-info waves-effect" data-toggle="modal" data-target="#Modal-lightbox_error"></button>
    <!-- Modal error -->
    <div class="modal fade" id="Modal-lightbox_error" tabindex="-1" role="dialog" style="margin-top:11%;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <img src="..\..\..\..\Theme\files\assets\images\error.png" alt="" class="img img-fluid" />
                    <div class="">
                        <h5>Please return to system admin</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button type="button" style="display: none;" id="buttonModel_Notfound" class="btn btn-info waves-effect" data-toggle="modal" data-target="#Modal-lightbox_notfound"></button>
    <!-- Modal Not found -->
    <div class="modal fade" id="Modal-lightbox_notfound" tabindex="-1" role="dialog" style="margin-top:11%;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <img src="..\..\..\..\Theme\files\assets\images\notfound.png" alt="" class="img img-fluid" />
                    <div class="">
                        <h5>This account not existed</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <form id="form1" runat="server" class="md-float-material form-material">
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
                        <!-- Authentication card start -->

                        <div class="text-center">
                            <img src="..\..\..\..\..\Theme\files\assets\images\logo.png" alt="logo.png" width="200" height="100" />
                        </div>
                        reu
                        <div class="auth-box card">
                            <div class="card-block">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left">Recover your password</h3>
                                    </div>
                                </div>

                                <div class="form-group form-primary">
                                    <asp:TextBox ID="txtEmail" runat="server" name="email-address" class="form-control" required="" placeholder="Your Email Address" TextMode="Email"></asp:TextBox>
                                    <span class="form-bar"></span>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btRest" runat="server" Text="Reset Password" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20" OnClick="btRest_Click" />
                                    </div>
                                </div>
                                <p class="f-w-600 text-right">Back to <a href="Login.aspx">Login.</a></p>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you.</p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="..\..\..\..\..\Theme\files\assets\images\Logo.png" alt="small-logo.png" width="50" height="30" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--<div class="login-card card-block auth-body mr-auto ml-auto">-->
                        <!--<form class="md-float-material form-material">-->
                        <!--<div class="text-center">-->
                        <!--<img src="../files/assets/images/logo.png" alt="logo.png">-->
                        <!--</div>-->
                        <!--<div class="auth-box">-->
                        <!---->
                        <!--</div>-->
                        <!--</form>-->
                        <!--&lt;!&ndash; end of form &ndash;&gt;-->
                        <!--</div>-->
                        <!-- Authentication card end -->
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
    </form>
    <!-- Modal small-->

    <!-- Required Jquery -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\jquery\js\jquery.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\jquery-ui\js\jquery-ui.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\popper.js\js\popper.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\bootstrap\js\bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\jquery-slimscroll\js\jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\modernizr\js\modernizr.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\modernizr\js\css-scrollbars.js"></script>
    <!-- i18next.min.js -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\i18next\js\i18next.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\i18next-xhr-backend\js\i18nextXHRBackend.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\i18next-browser-languagedetector\js\i18nextBrowserLanguageDetector.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\bower_components\jquery-i18next\js\jquery-i18next.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\assets\js\common-pages.js"></script>
    <script src="..\..\..\..\..\Theme\files\assets\js\pcoded.min.js"></script>
    <script src="..\..\..\..\..\Theme\files\assets\js\vartical-layout.min.js"></script>
    <script src="..\..\..\..\..\Theme\files\assets\js\jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- notification js -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\assets\js\bootstrap-growl.min.js"></script>
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\assets\pages\notification\notification.js"></script>

    <!-- Custom js -->
    <script type="text/javascript" src="..\..\..\..\..\Theme\files\assets\js\script.js"></script>

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
