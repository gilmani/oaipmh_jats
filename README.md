# oaipmh_jats

Acknowledgements:

This stylesheet is adapted from a stylesheet (for bepress XML to CrossRef XML) created by Janice Chan (Edith Cowan University) 01 July 2013, and from a stylesheet created by user JMarie in the OxygenXML forum (http://www.oxygenxml.com/forum/topic8070.html).

--------

This XSL stylesheet transforms OAI-PMH XML from the bepress Digital Commons platform to JATS DTD 1.1d2 XML. Input is issue-level data; output is as article-level files. Limited metadata fields are used, as this was originally created for the purpose of creating brief article records for deposit with Portico.
 
The stylesheet is currently configured for use with fields associated with the "document-export" version of bepress' XML; however, it could easily be configured to work with the Dublin Core XML available through the "oai_dc" prefix (or the simple/qualified prefixes - "simple-dubline-core" and "qualified-dublin-core" as well).
 
To obtain bepress OAI XML data for a particular issue, append the base URL with volume and issue number, e.g.
http://commons.pacificu.edu/do/oai/?metadataPrefix=document-export&verb=ListRecords&set=publication:eip/vol16/iss1/
 
## Notes:

**You must remove the xsi schema declaration from the <OAI-PMH> element in the exported bepress XML in order for this stylesheet to work.
 
**Journal-meta elements have fixed values and should be edited prior to transformations.

**The filename in xsl:result-document is also partially fixed, and must be edited for each journal prior to transformation.

## Known issues:

**If abstract and contributor-group elements have corresponding null values in the bepress XML, the closing tag (e.g. /abstract) still writes to the output files.


