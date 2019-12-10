<xsl:transform version="1.0"
               exclude-result-prefixes="tei"
               xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:tei="http://www.tei-c.org/ns/1.0">

  <tei:index>
    <tei:term key="&#x263D;">Montag</tei:term>
    <tei:term key="&#x2642;">Dienstag</tei:term>
    <tei:term key="&#x263F;">Mittwoch</tei:term>
    <tei:term key="&#x2643;">Donnerstag</tei:term>
    <tei:term key="&#x2640;">Freitag</tei:term>
    <tei:term key="&#x2644;">Samstag</tei:term>
    <tei:term key="&#x2609;">Sonntag</tei:term>
  </tei:index>

  <xsl:template match="tei:text/tei:body">
    <div class="navigation navigation-collapse">
      <span class="fa fa-lg fa-navicon"></span>
      <xsl:call-template name="navigation"/>
    </div>

    <div class="mainpage diarium">

      <div class="pagination" style="margin-bottom: 2em;">
        <xsl:call-template name="paginator"/>
        <div style="padding: .5em 0;">
          Herzog Ludwig Rudolf von Braunschweig-Wolfenbüttel (1671-1735): Tagebuch, Signatur: Cod. Guelf. 28 Blank
        </div>
      </div>

      <div style="clear: both; border-right: thin solid; padding-right: 2.5em; ">
        <xsl:apply-templates/>
      </div>

      <div class="pagination" style="margin-bottom: 2em;">
        <xsl:call-template name="paginator"/>
      </div>

    </div>
    <div class="infopanel diarium">
      <ul class="controls">
        <li><a class="fa fa-print" href="javascript:print()"> Drucken</a></li>
      </ul>
      <div class="facsimile" style="display: none;">
        <a class="fa fa-close pull-right" title="Ansicht schließen"></a>
        <a id="facsimile" href="#" target="_facsimile">
          <img/>
        </a>
      </div>
      <script type="text/javascript">
        $(document).ready(function () {
          adjust('span.margin-left');
          adjust('span.margin-right');
          $('.facsimile img').load(function () { $('#facsimile').zoom(); });
        });
      </script>
    </div>
  </xsl:template>

  <xsl:template match="tei:title">
    <h1><xsl:apply-templates/></h1>
  </xsl:template>

  <xsl:template match="tei:*[ancestor::tei:body]" priority="-50">
    <span class="error">
      <xsl:value-of select="concat('&lt;', name(), '&gt;')"/>
      <xsl:apply-templates/>
      <xsl:value-of select="concat('&lt;/', name(), '&gt;')"/>
    </span>
  </xsl:template>

  <xsl:template match="tei:note" priority="-10"/>

  <xsl:template match="tei:head[not(tei:date)]">
    <xsl:call-template name="pagebreak"/>
    <h1>
      <xsl:if test="@place">
        <xsl:attribute name="class">margin-left</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </h1>
  </xsl:template>

  <xsl:template match="tei:head[tei:date] | tei:label[tei:date]">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="tei:date">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:ex">
    <i><xsl:apply-templates/></i>
  </xsl:template>

  <xsl:template match="tei:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:div">
    <div>
      <xsl:if test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="tei:foreign">
    <span lang="{@xml:lang}"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:seg">
    <span><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:rs[@type = 'person'][@ref != '']">
    <a class="ref-{@type}" title="{document(@ref)/tei:persName}" href="../personen#{substring-after(@ref, '#')}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="tei:rs[@type = 'place'][@ref != '']">
    <a class="ref-{@type}" title="{document(@ref)/tei:placeName}" href="../orte#{substring-after(@ref, '#')}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="tei:rs">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:l">
    <xsl:apply-templates/>
    <br/>
  </xsl:template>

  <xsl:template match="tei:lg">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="tei:unclear">
    <span class="unclear"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:w">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:del">
    <del><xsl:apply-templates/></del>
  </xsl:template>

  <xsl:template match="tei:add">
    <span><sup>+</sup><xsl:apply-templates/><sup>+</sup></span>
  </xsl:template>

  <xsl:template match="tei:c | tei:subst">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tei:c[. = document('')//tei:term/@key]">
    <span title="{document('')//tei:term[@key = current()]}" class="symbol">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend = 'underline']">
    <u><xsl:apply-templates/></u>
  </xsl:template>

  <xsl:template match="tei:hi[@rend = 'superscript']">
    <sup><xsl:apply-templates/></sup>
  </xsl:template>

  <xsl:template match="tei:note[@place]" priority="10">
    <span class="margin-left"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:seg[@rend = 'august']">
    <span class="cipher"><xsl:apply-templates/></span>
  </xsl:template>

  <xsl:template match="tei:ref[@target]">
    <a href="{@target}" target="_blank">
      <xsl:choose>
        <xsl:when test="normalize-space(translate(., 'WIKIPEDIA', 'wikipedia')) = 'wikipedia'">
          <span class="fa fa-wikipedia-w"></span>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </a>
  </xsl:template>

  <xsl:template match="tei:pb">
    <xsl:call-template name="pagebreak"/>
  </xsl:template>

  <xsl:template match="tei:list|tei:listPerson">
    <ul><xsl:apply-templates/></ul>
  </xsl:template>

  <xsl:template match="tei:item[parent::tei:list or parent::tei:listPerson]">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template name="pagebreak">
    <xsl:if test="@facs">
      <a class="pagebreak screen-only" target="_facsimile" href="{@facs}" style="position: absolute; left: 15em;">
        <span class="fa fa-file-o"> <xsl:value-of select="@n"/> </span>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template name="paginator">
    <div style="float: right; margin-left: 2em;">
      <xsl:if test="/tei:TEI/@prev">
        <a href="{substring-before(/tei:TEI/@prev, '.xml')}" class="prev screen-only">
          <xsl:choose>
            <xsl:when test="/tei:TEI/@prev = 'front.xml'">Titelseite</xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="substring-before(/tei:TEI/@prev, '.xml')"/>
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </xsl:if>
      <h1><xsl:value-of select="/tei:TEI/@n"/></h1>
      <xsl:if test="/tei:TEI/@next">
        <a href="{substring-before(/tei:TEI/@next, '.xml')}" class="next screen-only">
          <xsl:value-of select="substring-before(/tei:TEI/@next, '.xml')"/>
        </a>
      </xsl:if>
    </div>
  </xsl:template>

</xsl:transform>
