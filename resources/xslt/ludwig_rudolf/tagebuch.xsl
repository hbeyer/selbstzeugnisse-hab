<xsl:transform version="1.0"
               exclude-result-prefixes="tei"
               xmlns:tei="http://www.tei-c.org/ns/1.0"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="../default.xsl"/>
  <xsl:import href="tagebuch-import.xsl"/>

  <xsl:output method="html" encoding="utf-8" indent="yes"/>

  <xsl:template match="tei:text/tei:group">
    <div class="navigation">
      <xsl:call-template name="navigation"/>
    </div>
    <div class="mainpage">
      <h1>Diarium Ludwig Rudolf</h1>
      <p>
        Herzog Ludwig Rudolf von Braunschweig-Wolfenbüttel (1671-1735): Tagebuch, Signatur: Cod. Guelf. 28 Blank
      </p>
      <table>
        <tbody>
          <tr>
            <td style="vertical-align: middle;">
              <h2>
                <a href="front">Titelseite</a>
              </h2>
            </td>
            <td> </td>
          </tr>
          <xsl:for-each select="tei:text">
            <tr>
              <td style="vertical-align: middle;">
                <h2>
                  <a href="{substring(tei:body//tei:date[1]/@when, 1, 4)}">
                    <xsl:value-of select="substring(tei:body//tei:date[1]/@when, 1, 4)"/>
                  </a>
                </h2>
              </td>
              <td style="vertical-align: middle;">
                <ul>
                  <li>
                    <xsl:text/>
                    <xsl:call-template name="datum">
                      <xsl:with-param name="datum" select="(tei:body//tei:date)[1]/@when"/>
                    </xsl:call-template>
                    <xsl:text>–</xsl:text>
                    <xsl:call-template name="datum">
                      <xsl:with-param name="datum" select="(tei:body//tei:date)[last()]/@when"/>
                    </xsl:call-template>
                  </li>
                  <li>
                    <xsl:value-of select="count(tei:body//tei:date)"/>
                    <xsl:text> Einträge</xsl:text>
                  </li>
                </ul>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </div>
    <div class="infopanel facet">
      <ul class="controls">
        <li>
          <a class="fa fa-print" href="javascript:print()"> Drucken</a>
        </li>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="*[following-sibling::tei:note[@type = 'annotation'][1][generate-id(preceding-sibling::tei:*[not(self::tei:note)][1]) = generate-id(current())]]" priority="10">
    <xsl:variable name="local-name">div</xsl:variable>
    <xsl:element name="{$local-name}">
      <xsl:attribute name="class">annotation</xsl:attribute>
      <a href="#{generate-id(following-sibling::tei:note[@type = 'annotation'][1])}" class="fa fa-hand-o-right annotation-reference"></a>
      <xsl:apply-templates select="following-sibling::tei:note[@type = 'annotation'][1]" mode="annotation"/>
      <xsl:apply-imports/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[following-sibling::tei:note[@type = 'translation'][1][generate-id(preceding-sibling::tei:*[not(self::tei:note)][1]) = generate-id(current())]]">
    <span title="{following-sibling::tei:note[@type = 'translation'][1]}">
      <xsl:apply-imports/>
    </span>
  </xsl:template>

  <xsl:template match="tei:note[@type = 'annotation']" mode="annotation">
    <span id="{generate-id()}" class="annotation-target margin-right">
      <span class="fa fa-sticky-note-o pull-right"></span>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="text()" mode="annotation"/>

</xsl:transform>
