<xsl:transform version="1.0"
               xmlns:tei="http://www.tei-c.org/ns/1.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="xml" encoding="utf-8" media-type="application/xml"/>

  <xsl:template match="node() | @*">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="tei:TEI">
    <xsl:copy>
      <xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance">
        <xsl:text>http://www.tei-c.org/ns/1.0 http://www.tei-c.org/Vault/P5/3.2.0/xml/tei/custom/schema/xsd/tei_all.xsd</xsl:text>
      </xsl:attribute>
      <xsl:apply-templates select="node() | @*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="@type[parent::tei:TEI]"/>

  <xsl:template match="@xml:base"/>

  <xsl:template match="@ref[starts-with(., 'register.xml')]">
    <xsl:choose>
      <xsl:when test="document(.)/tei:idno[@type = 'URI']">
        <xsl:attribute name="ref">
          <xsl:value-of select="document(.)/tei:idno[@type = 'URI']"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="ref">
          <xsl:value-of select="concat('tag:selbstzeugnisse.hab.de,2017:edition/', substring-after(., '#'))"/>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="@facs[starts-with(., 'http://selbstzeugnisse.hab.de/edition/images/')]">
    <xsl:attribute name="facs">
      <xsl:variable name="imageNr" select="substring-before(substring-after(., 'http://selbstzeugnisse.hab.de/edition/images/'), '.jpg')"/>
      <xsl:value-of select="concat('http://diglib.hab.de/mss/42-19-aug-2f/start.htm?image=', $imageNr)"/>
    </xsl:attribute>
  </xsl:template>

</xsl:transform>
