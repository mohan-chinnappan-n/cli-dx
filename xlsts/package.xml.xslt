<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></link>
</head>
<body>
  <h2>Package</h2>
  <table class="table table-dark table-bordered table-striped table-hover">
    <tr>
      <th>name</th>
      <th>members</th>
    </tr>
    <xsl:for-each select="Package/types">
    <tr>
      <td><xsl:value-of select="name"/></td>
      <td>
        <ul class="list-group">
        <xsl:for-each select="members"> 
          <li class="list-group"><xsl:value-of select="."/></li>
        </xsl:for-each>
        </ul>
        </td>

      </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
