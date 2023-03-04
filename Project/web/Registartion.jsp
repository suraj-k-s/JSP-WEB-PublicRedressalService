<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">

        <head>
            <!-- Required meta tags-->
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="description" content="Colorlib Templates">
            <meta name="author" content="Colorlib">
            <meta name="keywords" content="Colorlib Templates">

            <!-- Title Page-->
            <title>Au Register Forms by Colorlib</title>

            <!-- Icons font CSS-->
            <link href="Assets/Template/Registartion/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
            <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
            <!-- Font special for pages-->
            <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

            <!-- Vendor CSS-->
            <link href="Assets/Template/Registartion/vendor/select2/select2.min.css" rel="stylesheet" media="all">
            <link href="Assets/Template/Registartion/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

            <!-- Main CSS-->
            <link href="Assets/Template/Registartion/css/main.css" rel="stylesheet" media="all">
        </head>

        <body onload="createCaptcha()">
            <div class="page-wrapper p-t-130 p-b-100 font-poppins">
                <div class="wrapper wrapper--w680">
                    <div class="card card-4">
                        <div class="card-body">
                            <h2 class="title">Registration Form</h2>
                            <form method="POST" enctype="multipart/form-data" action="Assets/ActionPages/UserActionPage.jsp">
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Name</label>
                                            <input required="" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" class="input--style-4" type="text" name="first_name">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">last name</label>
                                            <input required="" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" class="input--style-4" type="text" name="last_name">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Birthday</label>
                                            <div class="input-group-icon">
                                                <input required="" class="input--style-4 js-datepicker" type="text" name="birthday">
                                                <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Gender</label>
                                            <div class="p-t-10">
                                                <label class="radio-container m-r-45">Male
                                                    <input required="" type="radio" checked="checked" name="gender" value="Male">
                                                    <span class="checkmark"></span>
                                                </label>
                                                <label class="radio-container">Female
                                                    <input type="radio" name="gender" value="Female">
                                                    <span class="checkmark"></span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Email 1</label>
                                            <input required="" class="input--style-4" type="email" name="email">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Email 2</label>
                                            <input required="" class="input--style-4" type="email" name="email">
                                        </div> 
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Contact 1</label>
                                            <input required="" class="input--style-4" pattern="[6-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9" type="text" name="number">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Contact 2</label>
                                            <input required="" class="input--style-4" pattern="[6-9]{1}[0-9]{9}" 
                title="Phone number with 7-9 and remaing 9 digit with 0-9" type="text" name="number">
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Photo</label>
                                            <input required="" accept="image/png, image/jpeg" class="input--style-4" type="file" name="file_photo">
                                        </div>
                                    </div>
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Proof</label>
                                            <input required="" class="input--style-4" type="file" name="file_proof">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <label class="label">Address</label>
                                    <textarea name="txt_address" rows="5" required="" style="width: 100%;background: #fafafa;border-radius: 5px;border: #666;outline: none !important;box-sizing: border-box;"></textarea>
                                </div>


                                <div class="row row-space">
                                    <div class="col-2">
                                        <div class="input-group">
                                            <label class="label">Country</label>
                                            <div class="rs-select2 js-select-simple select--no-search">
                                                <select onchange="getState(this.value)" required="" class="form-control" name="sel_country" id="sel_country">
                                                    <option value="" >Select</option>
                                                <%                                                            String conQry = "select * from tbl_country";
                                                    ResultSet rs1 = con.selectCommand(conQry);
                                                    while (rs1.next()) {
                                                %>
                                                <option value="<%=rs1.getString("country_id")%>"><%=rs1.getString("country_name")%></option>
                                                <%
                                                    }

                                                %>
                                            </select>
                                            <div class="select-dropdown"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">State</label>
                                        <div class="rs-select2 js-select-simple select--no-search">
                                            <select onchange="getDistrict(this.value)" required="" class="form-control" name="sel_state" id="sel_state">
                                                <option value="">Select</option>
                                            </select>
                                            <div class="select-dropdown"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">District</label>
                                        <div class="rs-select2 js-select-simple select--no-search">
                                            <select onchange="getPlace(this.value)" required="" class="form-control" name="sel_district" id="sel_district">
                                                <option value="" >Select</option>
                                            </select>
                                            <div class="select-dropdown"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Place</label>
                                        <div class="rs-select2 js-select-simple select--no-search">
                                            <select onchange="getPincode(this.value)" required="" class="form-control" name="sel_place" id="sel_place">
                                                <option value="" >Select</option>
                                            </select>
                                            <div class="select-dropdown"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Pin Code </label>
                                        <input required="" readonly="" class="input--style-4" type="text" name="txt_pincode" id="txt_pincode">
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="input-group">
                                        <label class="label">Password</label>
                                        <input required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                         title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" class="input--style-4" type="text" name="txt_password">
                                    </div>
                                </div>
                            </div>

                            <div class="row row-space">
                                <div class="col-2">
                                    <div class="p-t-15">

                                        <input type="text" required="" placeholder="Captcha"  class="input--style-4" id="cpatchaTextBox"/>
                                        <div id="captcha">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="p-t-15">
                                        <label onclick="validateCaptcha()" class="btn btn--radius-2 btn--green">Validate</label>                                    
                                    </div>
                                </div>
                            </div>
                            <div class="p-t-15" align="center">
                                <button class="btn btn--radius-2 btn--blue" id="btn_button"  type="submit">Submit</button>
                            </div>
                        </form>
                                            <a href="index.html" >Back to Home </a>
                    </div>
                </div>
            </div>
        </div>
        <script src="Assets/JQ/jQuery.js"></script>
        <script>
                                            function getState(cid)
                                            {

                                                $.ajax({url: "Assets/AjaxPages/AjaxState.jsp?cid=" + cid,
                                                    success: function(result) {

                                                        $("#sel_state").html(result);
                                                    }});
                                            }
                                            function getDistrict(sid)
                                            {

                                                $.ajax({url: "Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                                                    success: function(result) {

                                                        $("#sel_district").html(result);
                                                    }});
                                            }
                                            function getPlace(did)
                                            {

                                                $.ajax({url: "Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                                    success: function(result) {

                                                        $("#sel_place").html(result);
                                                    }});
                                            }
                                            function getPincode(pid)
                                            {

                                                $.ajax({url: "Assets/AjaxPages/AjaxPincode.jsp?pid=" + pid,
                                                    success: function(result) {

                                                        document.getElementById("txt_pincode").value = result;
                                                    }});
                                            }

        </script>
        <script>
document.getElementById("btn_button").disabled = true;
            var code;
            function createCaptcha() {
                //clear the contents of captcha div first 
                document.getElementById('captcha').innerHTML = "";
                var charsArray =
                        "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@!#$%^&*";
                var lengthOtp = 6;
                var captcha = [];
                for (var i = 0; i < lengthOtp; i++) {
                    //below code will not allow Repetition of Characters
                    var index = Math.floor(Math.random() * charsArray.length + 1); //get the next character from the array
                    if (captcha.indexOf(charsArray[index]) == -1)
                        captcha.push(charsArray[index]);
                    else
                        i--;
                }
                var canv = document.createElement("canvas");
                canv.id = "captcha";
                canv.width = 100;
                canv.height = 50;
                var ctx = canv.getContext("2d");
                ctx.font = "25px Georgia";
                ctx.strokeText(captcha.join(""), 0, 30);
                //storing captcha so that can validate you can save it somewhere else according to your specific requirements
                code = captcha.join("");
                document.getElementById("captcha").appendChild(canv); // adds the canvas to the body element
            }
            function validateCaptcha() {
                event.preventDefault();
                debugger
                if (document.getElementById("cpatchaTextBox").value == code) {
                    alert("Valid Captcha");
                    document.getElementById("btn_button").disabled = false;
                } else {
                    alert("Invalid Captcha. try Again");
                    createCaptcha();
                }
            }

        </script>
        <!-- Jquery JS-->
        <script src="Assets/Template/Registartion/vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="Assets/Template/Registartion/vendor/select2/select2.min.js"></script>
        <script src="Assets/Template/Registartion/vendor/datepicker/moment.min.js"></script>
        <script src="Assets/Template/Registartion/vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="Assets/Template/Registartion/js/global.js"></script>

    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->