<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>Countries</h2>
    <table border="1">
      <tr bgcolor="steelblue">
        <th>active</th>
        <th>integrationValue</th>
        <th>isoCode</th>
        <th>label</th>
        <th>orgDefault</th>
        <th>standard</th>
        <th>visible</th>
        <th>states</th>
      </tr>
      <xsl:for-each select="AddressSettings/countriesAndStates/countries">
      <xsl:variable name="country" select="label" />
      <xsl:variable name="countryIsoCode" select="isoCode" />

        <tr>
          <td><xsl:value-of select="active"/></td>
          <td><xsl:value-of select="integrationValue"/></td>
          <td><xsl:value-of select="isoCode"/></td>
          <td><xsl:value-of select="label"/></td>
          <td><xsl:value-of select="orgDefault"/></td>

          <td><xsl:value-of select="standard"/></td>
          <td><xsl:value-of select="visible"/></td>
          <td>
            <xsl:for-each select="states">
            <table border="1">
            <tr>
            <td><xsl:value-of select="$countryIsoCode"/></td>
            <td><xsl:value-of select="$country"/></td>

            <td><xsl:value-of select="integrationValue"/></td>
            <td><xsl:value-of select="isoCode"/></td> 
            <td><xsl:value-of select="label"/></td>
            </tr>
            </table>

            </xsl:for-each>
         </td>
      

        </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
