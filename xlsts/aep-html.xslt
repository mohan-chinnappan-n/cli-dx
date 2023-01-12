<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <h2>AEP</h2>
                <table border="1">

                    <tr>
                        <th>Id</th>
                        <th>Source</th>
                        <th>Translation</th>
                      </tr>
                    <xsl:for-each select="Media/String" >
 
                    <tr>
                        <td>
                            <xsl:value-of select="@id"/>
                             
                        </td>

                        <td>
                            <xsl:value-of select="@source"/>
                             
                        </td>
                        <td>
                            <xsl:value-of select="."/>
                             
                        </td>


                    </tr>
                </xsl:for-each>

                </table>
            </body>
        </html>

    </xsl:template>
</xsl:stylesheet>