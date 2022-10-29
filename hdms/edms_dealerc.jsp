<html>
<head>
<title>e-HONDA-DMS</title>
<script language="javascript">
function goFind()
{
window.location="edms_dealerfc.jsp";
}
</script>
</head>
<body bgcolor="#FDF5E6">

<center>
<table width="98%" bgcolor="marroon"><tr><td height="60" align="middle">
<font color="white" size="6">e-HONDA-DMS</font></td></tr>
</table>
</center>
<center>
<font color="black" size="5" >Dealer Profile</font>
</center>

<form name="f1" action="edms_dealers.jsp" method="get">
<center>
<table width="600" border="0" >
<tr>
<td><font class="head2">Dealer Code:</td>
<td><input type="text" name="txtDcode" title="Input your dealercode" class="ovalstyle" required><font color="blue">*</font></td>
</tr>

<tr> 
<td><font class="head2">Dealer Name:</td>
<td><input type="text" name="txtDname" title="Input your name"  class="ovalstyle" required><font color="blue">*</font></td>
</tr>

<tr>
<td><font class="head2">Contact Person:</td>
<td><input type="text" name="txtConperson" class="ovalstyle" ></font></td>
</tr>

<tr>
<td><font class="head2">Locality:</td>
<td><input type="text" name="txtlocality" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">City:</td>
<td><input type="text" name="txtcity" autocomplete="on" class="ovalstyle" ></td>
</tr>

<tr>
<td><font class="head2">State/Union Territory:</td>
<td><select name="cmbstate" class="ovalstyle" >
<option value="null">-select-</option>
<option value="Andhrapradesh">Andhrapradesh</option>Aparajita
<option value="Arunachaalpradesh">Arunachalpradesh</option>
<option value="Assam">Assam</option>
<option value="Bihar">Bihar</option>
<option value="Chhattisgarh">Chhattisgarh</option>
<option value="Goa">Goa</option>
<option value="Gujurat">Gujurat</option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jharkhand">Jharkhand</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharastra">Maharastra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram/option>
<option value="Nagaland">Nagaland</option>
<option value="Odisha">Odisha</option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Telengana">Telengana</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="Uttarakhand">Uttarakhand</option>
<option value="West Bengal">West Bengal</option>
</select></td><br>
</tr>

<tr>
<td><font class="head2">G.S.T no:</td>
<td><input type="text" name="txtGstno" title="Enter your unique gst no" class="ovalstyle" required><font color="blue">*</font></td>
</tr>

<tr>
<td><font class="head2">Phone no:</td>
<td><input type="tel" name="telphoneno" class="ovalstyle" required><font color ="blue">*</font></td>
<td><font class="head2">Fax no:</td>
<td><input type="text" name="txtfaxno"class="ovalstyle"></td><br>
</tr>

<tr>
<td><font class="head2">Emailid:</td>
<td><input type="text" name="txtMid" class="ovalstyle"required><font color="blue" class="ovalstyle" >*</font></td>
<td><font class="head2">Website:</td>
<td><input type="url" name="urlwebsite" class="ovalstyle"></td><br>
</tr>
</table>
</center>
<br>
<center>
<input type="submit" name="btnSUb" value="Submit" class="ovalstyle" >
<input type="button" name="btnFind" value="Find" class="ovalstyle" onclick="goFind()">
<input type="Reset" name="btnRes" value="Reset" class="ovalstyle" >
</center>

<br>
<center><hr width="98%" height="2" color="marroon"></center>
<center>
<table width="98%" bgcolor="black">
<tr><td height="50" align="middle"><font color="white" size="4">&copy SATYAM HONDA-2020&nbsp;&nbsp;&nbsp;</font>
</td></tr></table>
</center>

</form>
</body>
</html> 