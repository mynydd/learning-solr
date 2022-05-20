<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
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
        <doc>
            <xsl:apply-templates/>
        </doc>
    </add>
</xsl:template>

<xsl:template match="tei:idno[@type='shelfmark']">
    <field name="id"><xsl:value-of select="."/></field>
    <field name="shelfmark"><xsl:value-of select="."/></field>
</xsl:template>

<xsl:template match="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[not(@type)]">
    <field name="title"><xsl:value-of select="."/></field>
</xsl:template>

<xsl:template match="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title[@type='collection']">
    <field name="title_of_collection"><xsl:value-of select="."/></field>
</xsl:template>

</xsl:stylesheet>
