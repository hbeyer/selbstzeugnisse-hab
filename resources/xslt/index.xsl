<?xml version="1.0" encoding="utf-8"?>
<xsl:transform version="1.0"
               exclude-result-prefixes="tei"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:tei="http://www.tei-c.org/ns/1.0">

  <xsl:import href="default.xsl"/>

  <xsl:template match="tei:text/tei:body">
    <div class="navigation">
      <xsl:call-template name="navigation"/>
    </div>
    <div class="mainpage">
      <xsl:apply-templates/>
    </div>

      <div class="teaser">
        <ul>
          <li class="bg-blue">
            <img src="/assets/selbstzeugnisse/images/teaser/img001.jpg"/>
          </li>
          <li class="bg-lgrey">
            <img src="/assets/selbstzeugnisse/images/teaser/img002.jpg"/>
          </li>
          <li class="bg-mgrey">
             <img src="/assets/selbstzeugnisse/images/teaser/img003.jpg"/>
          </li>
        </ul>
        <img src="/assets/selbstzeugnisse/images/banner_logo_nwk.png" />
      </div>

  </xsl:template>

</xsl:transform>
