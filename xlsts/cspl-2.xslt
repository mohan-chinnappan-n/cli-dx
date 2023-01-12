<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body>
    <h2>Countries</h2>
    <table border="1">
      <tr bgcolor="steelblue">
        <th>#</th>
        <th>countryISO</th>
        <th>country</th>
         <th>integrationValue</th>
        <th>isoCode</th>
        <th>label</th>
        
      </tr>
      <xsl:for-each select="AddressSettings/countriesAndStates/countries">

      <xsl:variable name="country" select="label" />
      <xsl:variable name="countryIsoCode" select="isoCode" />

        
        
            <xsl:for-each select="states">
                <xsl:variable name="slno" select="position()" />

            <tr>

           <td><xsl:value-of select="$slno"/></td>
 
            <td><xsl:value-of select="$countryIsoCode"/></td>
            <td><xsl:value-of select="$country"/></td>

            <td><xsl:value-of select="integrationValue"/></td>
            <td><xsl:value-of select="isoCode"/></td> 
            <td><xsl:value-of select="label"/></td>
            </tr>
           

            </xsl:for-each>
       
      

        
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>
