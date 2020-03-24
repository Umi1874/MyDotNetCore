/*Insert EmailTemplate*/
INSERT [crm].[EmailTemplate]
    ([Name], [Subject], [Body], [Cc], [Bcc], [LanguageCode], [TemplateDataModel], [CreatedByUser], [CreatedDate], [UpdatedByUser], [UpdatedDate])
VALUES
    (N'Transfer Started Elec VIC', N'TransferStarted Elec VIC', N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Globird Energy Transfer Start Notification</title>
    <style type="text/css">
        /* Client-specific Styles */
        #outlook a {
            padding: 0;
        }
        /* Force Outlook to provide a "view in browser" menu link. */
        body {
            width: 100% !important;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            margin: 0;
            padding: 0;
        }
        /* Prevent Webkit and Windows Mobile platforms from changing default font sizes, while not breaking desktop design. */
        .ExternalClass {
            width: 100%;
        }
            /* Force Hotmail to display emails at full width */
            .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {
                line-height: 100%;
            }
        /* Force Hotmail to display normal line spacing.  */
        #backgroundTable {
            margin: 0;
            padding: 0;
            width: 100% !important;
            line-height: 100% !important;
        }

        img {
            outline: none;
            text-decoration: none;
            border: none;
            -ms-interpolation-mode: bicubic;
        }

        a img {
            border: none;
        }

        .image_fix {
            display: block;
        }

        p {
            margin: 0px 0px !important;
        }

        table td {
            border-collapse: collapse;
        }

        table {
            border-collapse: collapse;
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        a {
            color: #086dd2;
            text-decoration: none;
        }

        ul i {
            color: #E94071;
        }
        /*STYLES*/
        table[class=full] {
            width: 100%;
            clear: both;
        }
        /*IPAD STYLES*/
        @@media only screen and (max-width: 640px) {
            a[href^="tel"], a[href^="sms"] {
                text-decoration: none;
                color: #086dd2; /* or whatever your want */
                pointer-events: none;
                cursor: default;
            }

            .mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
                text-decoration: default;
                color: #086dd2 !important;
                pointer-events: auto;
                cursor: default;
            }

            table[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            td[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            img[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            img[class=banner] {
                width: 440px !important;
                height: 147px !important;
            }

            table[class=devicewidthinner] {
                width: 420px !important;
                text-align: center !important;
            }

            table[class=icontext] {
                width: 345px !important;
                text-align: center !important;
            }

            img[class="colimg2"] {
                width: 420px !important;
                height: 243px !important;
            }

            table[class="emhide"] {
                display: none !important;
            }

            img[class="logo"] {
                width: 440px !important;
                height: 110px !important;
            }
        }
        /*IPHONE STYLES*/
        @@media only screen and (max-width: 480px) {
            a[href^="tel"], a[href^="sms"] {
                text-decoration: none;
                color: #086dd2; /* or whatever your want */
                pointer-events: none;
                cursor: default;
            }

            .mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
                text-decoration: default;
                color: #086dd2 !important;
                pointer-events: auto;
                cursor: default;
            }

            table[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            td[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            img[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            img[class=banner] {
                width: 280px !important;
                height: 93px !important;
            }

            table[class=devicewidthinner] {
                width: 260px !important;
                text-align: center !important;
            }

            table[class=icontext] {
                width: 186px !important;
                text-align: center !important;
            }

            img[class="colimg2"] {
                width: 260px !important;
                height: 150px !important;
            }

            table[class="emhide"] {
                display: none !important;
            }

            img[class="logo"] {
                width: 280px !important;
                height: 70px !important;
            }
        }
    </style>
</head>
<body>

    <!-- Start of LOGO -->
    <table width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0" id="backgroundTable">
        <tbody>
            <tr>
                <td>
                    <table width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                        <tbody>
                            <tr>
                                <td width="100%">
                                    <table bgcolor="#e8eaed" width="600" align="center" cellspacing="0" cellpadding="0" border="0" class="devicewidth">
                                        <tbody>
                                            <tr>
                                                <!-- start of image -->
                                                <td align="center">
                                                    <a target="_blank" href="#"><img width="600" border="0" height="150" alt="" border="0" style="display:block; border:none; outline:none; text-decoration:none;" src="http://www.globirdenergy.com.au/html-email-templates/img/logo.png" class="logo"></a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <!-- end of image -->
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </td>
    </tr>
    </tbody>
    </table>
    <!-- End of LOGO -->
    <!-- start textbox-with-title -->
    <table width="100%" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0" id="backgroundTable">
        <tbody>
            <tr>
                <td>
                    <table width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                        <tbody>
                            <tr>
                                <td width="100%">
                                    <table bgcolor="#ffffff" width="600" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                                        <tbody>
                                            <!-- Spacing -->
                                            <tr>
                                                <td width="100%" height="20"></td>
                                            </tr>
                                            <!-- Spacing -->
                                            <tr>
                                                <td>
                                                    <table width="560" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner">
                                                        <tbody>
                                                            <!-- Title -->
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; font-weight:bold; color: #333333; text-align:left;line-height: 24px;">
                                                                    Hi @Model.Billing.FirstName,
                                                                </td>
                                                            </tr>
                                                            <!-- End of Title -->
                                                            <!-- spacing -->
                                                            <tr>
                                                                <td height="5"></td>
                                                            </tr>
                                                            <!-- End of spacing -->
                                                            <!-- content -->
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 14px; color: #333333; text-align:left;line-height: 24px;">
                                                                    <h3>Everything is on track for your switch to GloBird Energy</h3>
                                                                    <p>We are about to start the transfer/switch process for the electricity supply on <br /><b>@Model.NmiAddress</b>, account no <b>@Model.AccountNumber</b>, NMI/MIRN <b>@Model.Nmi</b>.</p>
                                                                    <p>
                                                                        <br />Thanks for being part of GloBird Energy, we''re proudly making the energy market more competitive with low rates and excellent localised customer service. Gone are the high prices that your old energy company has been charging you over the years.
                                                                    </p>
                                                                    <p><br />As a result; you''ll likely get a call from your old retailer trying to talk you out of your decision to switch, they have many high pressure tactics they might try including telling you: </p>
                                                                    <ul>
                                                                        <li><i>The switch will take months.</i><br><strong>TRUTH:</strong> The switch only takes a couple of weeks.</li>
                                                                        <li><i>They will give you a bigger discount.</i><br><strong>TRUTH:</strong> A bigger discount doesn''t mean your bill will be lower, call us and we''ll compare it for you.</li>
                                                                        <li><i>They will charge you a termination fee.</i><br><strong>TRUTH:</strong>The maximum they can legally charge to end your contract is about $20 if at all</li>
                                                                        <li><i>There will be new "connection fees" or special "meter read" fees</i><br><strong>TRUTH:</strong> We will never charge you any additional fees when you transfer to us.</li>
																		<li><i>Your gas supply will be terminated if you switch or you have to sign a form to stay as a gas customer</i><br><strong>TRUTH:</strong> It is illegal for any retailer to disconnect your gas supply when you switch out the electricity account, and you shouldn’t need to sign anything to stay as a gas customer; in addition, there is no further signature required by GloBird Energy for you to switch.</li>
																	</ul>
                                                                    <div style="display:none;">&nbsp;</div>
                                                                </td>
                                                            </tr>
                                                            <!-- End of content -->

                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 14px; color: #333333; text-align:left;line-height: 24px;">
                                                                    <p>
                                                                        Don''t feel pressured by these tactics. Competition is a good thing. If you''re tired of energy companies taking you for granted, you''ve made the right move joining with us, together we can make the market more competitive and drive rates down.
                                                                    </p>

                                                                </td>

                                                            </tr>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td width="100%" height="5"></td>
                                                            </tr>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 14px; color: #333333; text-align:left;line-height: 24px;">

                                                                    <p> If you have any queries, or need further information please feel free to give us a call on <a href="tel:133456">133456 </a> or <a href="tel:1300516888">1300 516 888</a> (Mon to Fri 8:30am-5:30pm, Sat 10:00am to 4:00pm). Our professional customer service team will be happy to assist.</p>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <img width="600" border="0" height="125" alt="" border="0" style="display:block; border:none; outline:none; text-decoration:none;" src="http://www.globirdenergy.com.au/html-email-templates/img/hero-img.jpg" class="logo">
                                                                </td>
                                                            </tr>

                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td width="100%" height="20"></td>
                                                            </tr>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 14px; color: #333333; text-align:left;line-height: 24px;">Thanks again </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <!-- Spacing -->
                                            <tr>
                                                <td width="100%" height="60"></td>
                                            </tr>
                                            <!-- Spacing -->
                                            <tr>
                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 12px; color: #333333; text-align:left;line-height: 20px;">
                                                    <strong>John McCluskey</strong> <br>
                                                    Executive Manager Sales & Marketing <br>
                                                    Globird Energy Pty Ltd <br>
                                                    Unit 10 613 Whitehorse Road, Mitcham, Vic 3132<br><br>

                                                    Phone: <a href="tel:133456">133456 </a> or <a href="tel:1300516888">1300 516 888</a> <br />
                                                    Email: CustomerService@GloBirdEnergy.com.au <br>
                                                    Web: <a href="http://www.globirdenergy.com.au">www.globirdenergy.com.au</a><br>
                                                    <br>
                                                </td>
                                            </tr>
                                            <!-- Spacing -->
                                            <tr>
                                                <td width="100%" height="20"></td>
                                            </tr>
                                            <!-- Spacing -->
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <!-- end of textbox-with-title -->
</body>
</html>', NULL, NULL, N'EN', N'CorrespondenceModel', N'admin', GETDATE(), N'admin', GETDATE())
go

/*Insert DocumentTemplate*/
INSERT [crm].[DocumentTemplate]
    ([Name], [DocumentContent], [LanguageCode], [TemplateDataModel], [CreatedByUser], [CreatedDate], [UpdatedByUser], [UpdatedDate])
VALUES
    (N'Transfer Started Elec VIC', N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome to GloBird Energy</title>
    <style type="text/css">
        /* Client-specific Styles */
        #outlook a {
            padding: 0;
        }
        /* Force Outlook to provide a "view in browser" menu link. */
        body {
            width: 100% !important;
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
            margin: 0;
            padding: 0;
        }
        /* Prevent Webkit and Windows Mobile platforms from changing default font sizes, while not breaking desktop design. */
        .ExternalClass {
            width: 100%;
        }
            /* Force Hotmail to display emails at full width */
            .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {
                line-height: 100%;
            }
        /* Force Hotmail to display normal line spacing.  */
        #backgroundTable {
            margin: 0;
            padding: 0;
            width: 100% !important;
            line-height: 100% !important;
        }

        img {
            outline: none;
            text-decoration: none;
            border: none;
            -ms-interpolation-mode: bicubic;
        }

        a img {
            border: none;
        }

        .image_fix {
            display: block;
        }

        p {
            margin: 0px 0px;
        }

        table td {
            border-collapse: collapse;
        }

        table {
            border-collapse: collapse;
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        a {
		    color: #086dd2;
            text-decoration: none;
			}
        /*STYLES*/
        table[class=full] {
            width: 100%;
            clear: both;
        }
        /*IPAD STYLES*/
        @@media only screen and (max-width: 640px) {
            a[href^="tel"], a[href^="sms"] {
                text-decoration: none;
                color: #086dd2; /* or whatever your want */
                pointer-events: none;
                cursor: default;
            }

            .mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
                text-decoration: default;
                color: #086dd2 !important;
                pointer-events: auto;
                cursor: default;
            }

            table[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            td[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            img[class=devicewidth] {
                width: 440px !important;
                text-align: center !important;
            }

            img[class=banner] {
                width: 440px !important;
                height: 147px !important;
            }

            table[class=devicewidthinner] {
                width: 420px !important;
                text-align: center !important;
            }

            img[class="logo"] {
                width: 440px !important;
                height: 110px !important;
            }
        }
        /*IPHONE STYLES*/
        @@media only screen and (max-width: 480px) {
            a[href^="tel"], a[href^="sms"] {
                text-decoration: none;
                color: #086dd2; /* or whatever your want */
                pointer-events: none;
                cursor: default;
            }

            .mobile_link a[href^="tel"], .mobile_link a[href^="sms"] {
                text-decoration: default;
                color: #086dd2 !important;
                pointer-events: auto;
                cursor: default;
            }

            table[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            td[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            img[class=devicewidth] {
                width: 280px !important;
                text-align: center !important;
            }

            img[class=banner] {
                width: 280px !important;
                height: 93px !important;
            }

            table[class=devicewidthinner] {
                width: 260px !important;
                text-align: center !important;
            }

            img[class="logo"] {
                width: 280px !important;
                height: 70px !important;
            }
        }

        .logo-image {
            height: 65px;
            background-repeat: no-repeat;
            background-size: 130px 65px;
            background-position: right;
            background-image: url(https://globirdcdn.azureedge.net/smallLogo.jpg)
        }

        .simple-table {
            border-collapse: collapse;
            width: 100%
        }

        .simple-table {
            border: 1px solid black;
            cellpadding:10px
        }


        .simple-table td, .simple-table th {
            border: none;
		    padding-left: 10px;
			padding-right:10px;
        }

        h4 {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .agreement p {
            display: block;
            margin: 8px 0px;
        }

        @@page {
            margin: 25px 90px 0px 90px
        }
    </style>
</head>
<body>
    <table width="100%" table-layout="fixed" bgcolor="#ffffff" cellpadding="0" cellspacing="0" border="0" id="backgroundTable">
        <tbody>
            <tr>
                <td>
                    <table width="800" cellpadding="0" cellspacing="0" border="0" align="center" class="devicewidth">
                        <tbody>
                            <tr>
                                <td width="100%">
                                    <table width="800" align="center" cellspacing="0" cellpadding="0" border="0" class="devicewidth">
                                        <tbody>
                                            <tr>
                                                <td align="center">
                                                    <table width="760" align="center" cellpadding="0" cellspacing="0" border="0" class="devicewidthinner">
                                                        <tr>
                                                            <!-- start of image -->
                                                            <td class="logo-image"></td>
                                                        </tr>
                                                        <tbody>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td width="100%" height="40"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 14px; color: #333333; text-align: left;line-height: 20px;">
                                                                    <p>GloBird Energy Pty Ltd </p>
                                                                    <p>ABN: 68 600 285 827 </p>
                                                                    <p>Postal Address: PO BOX 398, Ringwood, VIC, 3134</p>
                                                                    <p>Ph: 13 3456</p>
                                                                    <p>Website: <a href="http://www.globirdenergy.com.au" style="color: #ed268e; font-family: Asap; font-size: 12pt; font-weight: bold">www.globirdenergy.com.au</a></p>
                                                                </td>
                                                            </tr>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td width="100%" height="45"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; font-weight: bold; color: #333333; text-align: left; padding-left: 50px">
                                                                    @Model.AccountName<br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="15"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align: left; padding-left: 50px">
                                                                    <p>
                                                                        @Model.Billing.PostAddress.AddressLine1
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="15"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align: left; padding-left: 50px">
                                                                    <p>
                                                                        @Model.Billing.PostAddress.AddressLine2
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="15"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align: left; padding-left: 50px">
                                                                    <p>
                                                                        @Model.Billing.PostAddress.StateCode @Model.Billing.PostAddress.Postcode
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <!-- Spacing -->
                                                            <tr>
                                                                <td width="100%" height="40"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; font-weight: bold; color: #333333; text-align: left;">
                                                                    <h4 style="margin-bottom:0px;margin-top:0px">@DateTime.Now.ToString("dd MMM yyyy")</h4>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="20"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; font-weight: bold; color: #333333; text-align: left;">
                                                                    <h4 style="margin-bottom:0px;margin-top:0px">Dear @Model.AccountName</h4>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="20"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; font-weight: bold; color: #00b0f0; text-align: left;">
                                                                    <p>Everything is on track for your switch to GloBird Energy </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>
                                                                        We are about to start the transfer/switch process for the electricity service at @Model.NmiAddress, account no @Model.AccountNumber, NMI/MIRN @Model.Nmi
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>
                                                                        Thanks for being part of GloBird Energy. We are proudly making the energy market more competitive with low rates and excellent localised customer service. Now that you''ve joined us you can say goodbye to the high prices your old energy company were charging you over the years.
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>
                                                                        You''ll likely get a call from your old retailer trying to talk you out of your decision to switch. Competition is a good thing, but don''t feel pressured by these tactics. Here are just some of the things you may hear:
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="20"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table class="simple-table">
                                                                        <tr>
                                                                            <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                                <p>The switch will take months.</p>
                                                                                <p style="font-weight: bold; color: #00b0f0;">FACT: The switch only takes a couple of weeks.</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="100%" height="10"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                                <p>They will give you a bigger discount.</p>
                                                                                <p style="font-weight: bold; color: #00b0f0;">FACT: A bigger discount doesn''t mean your bill will be lower, call us and we''ll compare it for you.</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="100%" height="10"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                                <p>They will charge you a termination fee.</p>
                                                                                <p style="font-weight: bold; color: #00b0f0;">FACT: The maximum they can legally charge to end your contract is about $20 if at all</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="100%" height="10"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                                <p>There will be new “connection fees” or special “meter read” fees</p>
                                                                                <p style="font-weight: bold; color: #00b0f0;">FACT: We will never charge you any additional fees when you transfer to us.</p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td width="100%" height="10"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                                <p>Your gas supply will be terminated if you switch or you have to sign a form to stay as a gas customer</p>
                                                                                <p style="font-weight: bold; color: #00b0f0;">FACT: It is illegal for any retailer to disconnect your gas supply when you switch out the electricity account, and you shouldn''t need to sign anything to stay as a gas customer; in addition, there is no further signature required by GloBird Energy for you to switch.</p>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>If you have any queries or need further information, please call us on 13 3456 (Mon to Fri 8:30am-5:30pm, Sat 10:00am-4:00pm).</p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>Our professional, locally based customer service team will be happy to assist you.</p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="10"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <p>Thanks again,</p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-family: Helvetica, arial, sans-serif; font-size: 16px; color: #333333; text-align:left;line-height: 20px;">
                                                                    <h4>John McCluskey</h4>
                                                                    <p>Executive Manager Sales & Marketing</p>
                                                                    <p>GloBird Energy Pty Ltd</p>
                                                                    <br />
                                                                    <p>
                                                                        <span style="margin-right: 20px">E</span>
                                                                        <span style="color: #ed268e; font-family: Asap; font-size: 16px; font-weight: bold">CustomerService@GloBirdEnergy.com.au</span>
                                                                    </p>
                                                                    <p>
                                                                        <span style="margin-right: 20px">P</span>
                                                                        13 3456 or 03 8813 8899
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>', N'EN', N'CorrespondenceModel', N'admin', GETDATE(), N'admin', GETDATE())
go


/*Inser SmsTemplate*/
INSERT [crm].[SmsTemplate]
    ([Name],[Body],[LanguageCode],[TemplateDataModel],[CreatedByUser],[CreatedDate],[UpdatedByUser],[UpdatedDate])
VALUES(N'Transfer Started Elec VIC', N'GloBird Energy Update, Account #@Model.AccountNumber  Hi, @Model.Billing.FirstName,  Welcome aboard! We have started the transfer of your electricity service to GloBird Energy for @Model.NmiAddress, NMI/MIRN @Model.Nmi. We are proud to offer competitive rates, so let us know if you are contacted by your previous retailer. Remember not all discounts will leave you better off.  Let us do the maths. Call us on 133456, we are open from Mon. to Sat.  ', N'EN', N'CorrespondenceModel', N'admin', GETDATE(), N'admin', GETDATE())
GO
/*Insert EmailTemplateDocumentTemplate*/
DECLARE @EmailTemplateId int
DECLARE @SmsTemplateId int
DECLARE @DocumentTemplateId int

SET @EmailTemplateId = (select [EmailTemplateId]
from crm.EmailTemplate
where [name] = 'Transfer Started Elec VIC')

SET @SmsTemplateId = (select [SmsTemplateId]
from crm.SmsTemplate
where [name] = 'Transfer Started Elec VIC' and LanguageCode = 'EN')

SET @DocumentTemplateId = (select [DocumentTemplateId]
from crm.[DocumentTemplate]
where [name] = 'Transfer Started Elec VIC')

/*Insert EmailTemplateDocumentTemplate*/
INSERT [crm].[EmailTemplateDocumentTemplate]
    ([EmailTemplateId], [DocumentTemplateId])
VALUES
    (@EmailTemplateId, @DocumentTemplateId)

/*Insert MailMergeTemplate*/
INSERT [crm].[MailMergeTemplate]
    ([Name], [CommunicationCategoryId], [DocumentTemplateId], [EmailTemplateId], [SmsTemplateId], [SaveDirectory], [ArchiveDirectory], [FileNameTemplate], [CreatedByUser], [CreatedDate], [UpdatedByUser], [UpdatedDate])
VALUES
    (N'Transfer Started Elec VIC', 2, @DocumentTemplateId, @EmailTemplateId, @SmsTemplateId, N'SaveFiles', N'ArchiveFiles', N'{customer id}_{account id}_{NMI}_{account service id}_{service type}_{template name}_{yyyy}_{MM}_{dd}_{HH}_{mm}_{ss}', N'admin', GETDATE(), N'admin', GETDATE())
GO

/*Insert Segment*/
INSERT [sch].[Segment]
    ([SegmentCategoryId], [Name], [Description], [CommandSql], [CreatedDate], [CreatedByUser], [UpdatedDate], [UpdatedByUser])
VALUES
    (1, N'Transfer Started Elec VIC', NULL, N'SELECT
    crma.CustomerId,
    crma.AccountId,
    crmas.AccountServiceId
FROM
    crm.Customer crmc
    INNER JOIN crm.Account crma ON crmc.CustomerId = crma.CustomerId
    INNER JOIN crm.AccountService crmas ON crma.AccountId = crmas.AccountId
    INNER JOIN price.ServiceType pricest ON crmas.ServiceTypeId = pricest.ServiceTypeId
    INNER JOIN crm.AccountServiceStatus crmass ON crmas.AccountServiceStatusId = crmass.AccountServiceStatusId
WHERE
	pricest.[Name] = ''Power''
    AND crmass.[Name] NOT IN ( ''Pending Move In'', ''Closed'')
    AND crmc.[Name] <> ''The Occupier''
    AND crmas.Nmi <> ''UNKNOWN''
    AND EXISTS ( 
        SELECT 1
        FROM aemo.SiteDetail aemosd
        WHERE crmas.Nmi = aemosd.Nmi AND aemosd.StateCode = ''VIC'' ) /*For VIC*/

    AND EXISTS (
    SELECT
        1
    FROM
        crm.WorkItem crmwi1,
        crm.WorkItemType crmwit1,
        crm.WorkItemStatus crmwis1
    WHERE
        crmas.AccountServiceId = crmwi1.AccountServiceId
        AND crmwi1.WorkItemTypeId = crmwit1.WorkItemTypeId
        AND crmwi1.WorkItemStatusId = crmwis1.WorkItemStatusId
        AND crmwis1.[Name] = ''TaskClosed''
        AND crmwit1.[Name] = ''WelcomPack'' /*WelcomPack Have been sent*/
	)
    AND NOT EXISTS(
            SELECT
        1
    FROM
        crm.WorkItem crmwi2,
        crm.WorkItemType crmwit2
    WHERE
        crmas.AccountServiceId = crmwi2.AccountServiceId
        AND crmwi2.WorkItemTypeId = crmwit2.WorkItemTypeId
        AND crmwit2.[Name] = ''Transfer Started SMS sent'' /*Transfer Have not been sent before*/
    )
    AND 
    (
        crmass.[Name] = ''Transfer Requested''
        /*Change Request 1XXX has been sent*/
        OR
        (
        crmass.[Name] = ''Pending Switch''
        AND EXISTS(SELECT 1
        FROM
            crm.Contact crmco,
            crm.AccountContact crmac,
            crm.ContactType crmct,
            crm.DeliveryType crmdt
        WHERE
			crma.AccountId = crmac.AccountId
            AND crmac.ContactTypeId = crmct.ContactTypeId
            AND crmct.[Name] = ''Billing Contact''
            AND crmac.ContactId = crmco.ContactId
            AND crmco.PreferredDeliveryTypeId = crmdt.DeliveryTypeId
            AND crmdt.[Name] = ''Email''
        )
        AND 
        DATEDIFF(DAY,crmas.CoolOffEndDate,GETDATE()) < 3 
        )
 /*Change Request has NOT been sent, AND email is preferred, AND TODAY - cooling-off end date < 3*/
        OR
        (
			crmass.[Name] = ''Pending Switch''
        AND EXISTS(SELECT 1
        FROM
            crm.Contact crmco,
            crm.AccountContact crmac,
            crm.ContactType crmct,
            crm.DeliveryType crmdt
        WHERE
				crma.AccountId = crmac.AccountId
            AND crmac.ContactTypeId = crmct.ContactTypeId
            AND crmct.[Name] = ''Billing Contact''
            AND crmac.ContactId = crmco.ContactId
            AND crmco.PreferredDeliveryTypeId = crmdt.DeliveryTypeId
            AND crmdt.[Name] = ''PostalMail''
		)
        AND DATEDIFF(DAY,crmas.CoolOffEndDate,GETDATE()) < 7 
		) /*Change Request has NOT been sent, AND post is preferred, AND TODAY - cooling-off end date < 7*/
	
)', getdate(), N'admin', getdate(), N'admin')
go

/*Insert Job*/
INSERT [sch].[Job]
    ([Name], [Description], [JobCategoryId], [SegmentId], [IsRunning], [IsActive], [NextRunTime], [CronExpression], [OmitHoliday], [EffectStartDate], [EffectEndDate], [CreatedDate], [CreatedByUser], [UpdatedDate], [UpdatedByUser], [DeliveryScopeId])
VALUES
    (N'Transfer Started Elec VIC', N'Transfer Started Elec VIC', 5, (select segmentid
        from sch.segment
        where [Name] = 'Transfer Started Elec VIC') , 0, 1, CAST(N'2019-10-22T02:30:00.0000000' AS DateTime2), N'0 30 2 ? * * *', 0, CAST(getdate() AS Date), CAST(N'9999-12-31' AS Date), getdate(), N'admin', getdate(), N'admin', 3)
go

/*Insert JobDetail*/
DECLARE @TaskId int
SET @TaskId = (select JobTaskId
from sch.JobTask
where Name = 'CorrespondenceTask')

DECLARE @MailMergeTemplateId int
SET @MailMergeTemplateId = (select [MailMergeTemplateId]
from [crm].[MailMergeTemplate]
where Name = 'Transfer Started Elec VIC')

DECLARE @WorkItemTypeId int
SET @WorkItemTypeId = (select [WorkItemTypeId]
from [crm].[WorkItemType]
where Name = 'Transfer Started SMS sent')

DECLARE @WorkItemCategoryId INT
SET @WorkItemCategoryId = (select [WorkItemCategoryId]
from [crm].[workItemCategory]
where Name = 'Correspondence')

IF(@TaskId is not null)
BEGIN
    INSERT [sch].[JobDetail]
        ([JobId], [JobTaskId], [TaskSequence], [JsonData], [IsActive], [CreatedDate], [CreatedByUser], [UpdatedDate], [UpdatedByUser])
    VALUES
        ((select jobId
            from sch.job
            where [name] = 'Transfer Started Elec VIC'), @TaskId, 1, N'{"mailMergeTemplateId":"'+cast(@MailMergeTemplateId as varchar)+N'","hasActivity":"true","workItemCategoryId":"'+cast(@WorkItemCategoryId as varchar)+N'","workItemTypeId":"'+cast(@WorkItemTypeId as varchar)+N'"}', 1, getdate(), N'admin', getdate(), N'admin')

END

