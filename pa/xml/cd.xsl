<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></link>

<xsl:variable name="maxPrice" select="10" />

<body style='padding:10px;'>
  <h2>CD Collection</h2>
  <h4> Price greater than <xsl:value-of select="$maxPrice"/> are in bold </h4>
  <table class='table table-bordered table-striped table-dark2 table-hover '>
    <tr style='background:#99ccff;'>
      <th style="text-align:center">Title</th>
      <th style="text-align:center">Artist</th>
      <th style="text-align:center">Price</th>

    </tr>
    <xsl:for-each select="catalog/cd">

    <tr>
      <td><xsl:value-of select="title"/></td>
      <td><xsl:value-of select="artist"/></td>

	<xsl:choose>
	  <xsl:when test="price > $maxPrice">
      <td> <b><xsl:value-of select="price"/></b></td>
    </xsl:when>
	  <xsl:otherwise>
  		<td> <xsl:value-of select="price"/> </td>
	  </xsl:otherwise>
	</xsl:choose>


     
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>


