<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Author mohan chinnappan -->

<html> 
<body>
  <h2>Salesforce XLIFF to HTML</h2>
  <table border="1">
    <tr bgcolor="#99ccff">
      <th style="text-align:left">Id</th>
      <th style="text-align:left">Size</th>
      <th style="text-align:left">Source</th>
      <th style="text-align:left">Target</th>
    </tr>

  <xsl:template match="/">
    <xsl:for-each select="xliff/file/body/trans-unit">
      <tr>
       <td><xsl:value-of select="@id"/></td>
       <td><xsl:value-of select="@maxwidth"/> <xsl:value-of select="@size-unit"/>s</td>
       <td><xsl:value-of select="source"/></td>
       <td><xsl:value-of select="target"/></td>
     </tr>
     </xsl:for-each>
  </table>
</body>
</html>

  </xsl:template>
</xsl:stylesheet>
