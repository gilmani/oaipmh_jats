<?xml version="1.0" encoding="UTF-8"?>
<!-- ======================================================== -->
<!--        
        Adapted from a stylesheet created by Janice Chan 01 July 2013 (Edith Cowan University) and 
        from a stylesheet created by user JMarie in the OxygenXML forum (http://www.oxygenxml.com/forum/topic8070.html).
-->
<!-- ======================================================== -->
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    version="2.0"
    xpath-default-namespace="">

<xsl:output method="xml" 
        indent="yes" 
        encoding="UTF-8"/> 
        
    <xsl:template match="/">
        <xsl:for-each select="OAI-PMH/ListRecords/record/metadata/document-export/documents/document">    
                    <xsl:result-document doctype-public="-//NLM//DTD JATS (Z39.96) Journal Publishing DTD v1.1d2 20140930//EN"
                        doctype-system="http://jats.nlm.nih.gov/publishing/1.1d2/JATS-journalpublishing1.dtd" 
                        indent="yes" href="jlsc{articleid}.xml">
                        <article xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xlink="http://www.w3.org/1999/xlink" dtd-version="1.1d2" xml:lang="en">                            
                             <front>
                                <journal-meta>
                                    <journal-id journal-id-type="publisher-id">jlsc</journal-id>
                                    <issn pub-type="epub">2162-3309</issn>
                                    <publisher>
                                        <publisher-name>Pacific University Libraries</publisher-name>
                                    </publisher>
                                </journal-meta>
                                <article-meta>
                                    <article-id pub-id-type="doi">
                                        <xsl:value-of select="substring(fields/field[@name='doi'], 20, 23)"/>
                                    </article-id>
                                    <article-categories>
                                        <subj-group subj-group-type="article-section">
                                            <subject><xsl:value-of select="document-type"/></subject>
                                        </subj-group>                   
                                    </article-categories>
                                    <title-group>
                                        <article-title>
                                            <xsl:value-of select="title"/>
                                        </article-title>
                                    </title-group>
                                    <contrib-group>
                                        <xsl:for-each select="authors/author">
                                            <contrib contrib-type="author">                               
                                                <name>
                                                    <surname>
                                                        <xsl:value-of select="lname"/>
                                                    </surname>
                                                    <given-names>
                                                        <xsl:variable name="given_names">
                                                            <xsl:choose>
                                                                <xsl:when test="(mname)">
                                                                    <xsl:value-of select="concat(fname, ' ', mname)"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:value-of select="fname"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:variable>
                                                        <xsl:value-of select="$given_names"/>                                             
                                                    </given-names>
                                                </name>
                                            </contrib>
                                        </xsl:for-each>
                                    </contrib-group>
                                    
                                    <pub-date date-type="pub" publication-format="online" iso-8601-date="{substring(publication-date,1,10)}">                      
                                        <xsl:variable name="datestr">
                                            <xsl:value-of select="publication-date"/>
                                        </xsl:variable>                        
                                        <day>
                                            <xsl:value-of select="substring($datestr, 9, 2)"/>
                                        </day>
                                        <month>
                                            <xsl:value-of select="substring($datestr, 6, 2)"/>
                                        </month>
                                        <year>
                                            <xsl:value-of select="substring($datestr, 1, 4)"/>
                                        </year>
                                    </pub-date>
                                    <volume><xsl:value-of select="fields/field[@name='volnum']"/></volume>                 
                                    <issue><xsl:value-of select="fields/field[@name='issnum']"/></issue>               
                                    <elocation-id>
                                        <xsl:value-of select="articleid"/>
                                    </elocation-id>
                                    <permissions>                       
                                        <copyright-statement>                                 
                                            <xsl:text>Copyright </xsl:text><xsl:value-of select="substring(fields/field[@name='rights'],4)"/>
                                        </copyright-statement>
                                        <copyright-year>
                                            <xsl:value-of select="substring(publication-date, 1, 4)"/>
                                        </copyright-year>
                                        <license license-type="open-access" xlink:href="{fields/field[@name='distribution_license']/value}">
                                            <license-p>                          
                                                <xsl:value-of select="fields/field[@name='license_statement']"/>
                                            </license-p>
                                        </license> 
                                    </permissions>
                                    <self-uri xlink:title="local_file" xlink:href="{fields/field[@name='filename']/value}.pdf">
                                        <xsl:value-of select="fields/field[@name='filename']"/>
                                    </self-uri>
                                    <abstract><xsl:value-of select="abstract" disable-output-escaping="yes"/></abstract>
                                </article-meta> 
                            </front>
                        </article>                  
                    </xsl:result-document>                                                                           
            </xsl:for-each>
        </xsl:template>   
    </xsl:stylesheet>
