<html>
<head>
<title>e-HONDA-DMS</title>
<script language="javascript">
function goFind()
{
window.location="edms_vehiclefc.jsp";
}

function showimage(){
	fname1=document.f1.fileImage.value;
	fname=fname1.substr(fname1.lastIndexOf("\\")+1);
	document.f1.imgvcl.src=fname;
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
<font color="black" size="5" >Vehicle Information</font>
</center>

<form name="f1" action="edms_vehicles.jsp" method="get">

<center>
<table width="400" border="0">
<tr>
<td>
<table width="400" border="0">
<tr>
<td><font class="head2">Vehicle Code:</td>
<td><input type="text" name="txtVcode" title="Input your Vehicle code" class="ovalstyle" ></td>
</tr>
<tr> 
<td><font class="head2">Vehicle Name:</td>
<td><input type="text" name="txtVname" class="ovalstyle" ></td>

</tr>
<tr>
<td><font class="head2">Cubic Capacity:</td>
<td><input type="text" name="txtCcapacity" class="ovalstyle" ></td>
<td></td>
</tr>
<tr>
<td><font class="head2">Fuel Capacity:</td>
<td><input type="text" name="txtFcapacity" class="ovalstyle" ></td>
<td></td>
</tr>
<tr>
<td><font class="head2">Colour:</td>
<td><select name="cmbcolour" class="ovalstyle">
<option value="null">-select-</option>
<option value="red">red</option>
<option value="black">black</option>
<option value="trance blue metalic">trance blue metalic</option>
<option value="yellow">yellow</option>
<option value="pink">green</option>
<option value="silver">silver</option>
</select></td><br>

</tr>
<tr>
<td><font class="head2">Purchase Price:</td>
<td><input type="text" name="txtPprice" class="ovalstyle"></td>

</tr>
<tr>
<td><font class="head2">Sales Price:</td>
<td><input type="tel" name="txtSprice" class="ovalstyle"></td>

</tr>
<tr>
<td><font class="head2">Tax Slab:</td>
<td><select name="cmbTslab"class="ovalstyle">
<option value="null">-select-</option>
<option value="8">8</option>
<option value="12">12</option>
<option value="18">18</option>
<option value="28">28</option>
</select>
</td>
</tr>
<tr>
<td><font class="head2">Opening Stock:</td>
<td><input type="text" name="txtOstock" class="ovalstyle"></td>

</tr>
<tr>
<td><font class="head2">Marginal Stock:</td>
<td><input type="text" name="txtMstock" class="ovalstyle"></td>

</tr>
<tr>
<td><font class="head2">Image:</font></td>
<td><input type="file" name="fileImage"  onchange="showimage()" class="ovalstyle" ></td>
</tr>
</table>

<td>
<img src="test1.jpeg" width="230" height="230"  name="imgvcl" align="right" valign="middle">
</td>
</tr>
</table>
</center>
<br>
<center>
<input type="submit" name="btnSub" value="Submit" class="ovalstyle" >
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