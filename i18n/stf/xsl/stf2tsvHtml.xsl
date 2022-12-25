<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Author mohan chinnappan -->
    <xsl:output method="text" />

    <html>
    <body>
    <h2>Salesforce XLIFF to TSV</h2>


    <xsl:variable name="separator" select="'&#9;'" />
    <xsl:variable name="newline" select="'&#10;'" />
    <textarea rows="100" cols="120">
        <xsl:template match="/">
        <xsl:text>Id</xsl:text>
        <xsl:value-of select="$separator" />
        <xsl:text>MaxWidth</xsl:text>
        <xsl:value-of select="$separator" />
        <xsl:text>Source</xsl:text>
        <xsl:value-of select="$separator" />
        <xsl:text>Target</xsl:text>
        <xsl:value-of select="$separator" />
        <xsl:value-of select="$newline" />
        <xsl:for-each select="xliff/file/body/trans-unit">
            <xsl:value-of select="@id" />   <xsl:value-of select="$separator" />
            <xsl:value-of
                select="@maxwidth" /><xsl:value-of select="@size-unit" />s<xsl:value-of
                select="$separator" />
            <xsl:value-of select="source" /><xsl:value-of
                select="$separator" />
            <xsl:value-of select="target" />
            <xsl:value-of
                select="$newline" />
        </xsl:for-each>
    </textarea>
</body>
</html>
    </xsl:template>
</xsl:stylesheet>