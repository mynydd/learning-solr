<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="tei">
<!-- catch-all template
     see https://stackoverflow.com/questions/3360017/why-does-xslt-output-all-text-by-default
-->
<xsl:template match="*">
    <xsl:message terminate="no">
     WARNING: Unmatched element: <xsl:value-of select="name()"/>
    </xsl:message>
  
    <xsl:apply-templates/>
</xsl:template>

<xsl:template match="text()"/>

<xsl:template match="/">
    <add>
        <xsl:apply-templates select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc"/>
    </add>
</xsl:template>

<xsl:template match="tei:msDesc">
    <doc>
        <field name="id"><xsl:value-of select="@xml:id"/></field>
        <field name="shelfmark"><xsl:value-of select="./tei:msIdentifier/tei:idno[@type='shelfmark']"/></field>
        <xsl:if test="tei:msPart">
             <field name="is_composite">true</field>
        </xsl:if>
        <xsl:for-each select="tei:msPart">
            <doc>
                <field name="id"><xsl:value-of select="@xml:id"/></field>
                <field name="shelfmark"><xsl:value-of select="./tei:msIdentifier//tei:idno[@type='part']"/></field>
                <field name="is_part">true</field>
                <xsl:for-each select=".//tei:author">
                    <field name="author_s"><xsl:value-of select="."/></field>
                </xsl:for-each>
            </doc>
        </xsl:for-each>
    </doc>
</xsl:template>

</xsl:stylesheet>
