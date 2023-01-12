<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
 
    <xsl:template match="/">
        countryISO||label|integrationValue<br/>
        <xsl:for-each select="AddressSettings/countriesAndStates/countries">
            <xsl:variable name="cno" select="position()" />
            <xsl:variable name="country" select="label" />
            <xsl:variable name="countryIsoCode" select="isoCode" />
            <xsl:for-each select="states">
                <xsl:value-of select="$countryIsoCode" />|||<xsl:value-of select="isoCode" />|<xsl:value-of select="integrationValue" /> 
                 <br/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>