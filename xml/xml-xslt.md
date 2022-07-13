# Using XSL Transformations (XSLT) in DX

## Usage
```
sfdx mohanc:xml:transform -h
Transform given xml using XSLT

USAGE
  $ sfdx mohanc:xml:transform [-i <string>] [-t <string>] [--json] [--loglevel 
  trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL]

OPTIONS
  -i, --inputfilename=inputfilename                                                 Data file in XML format you want to do the
                                                                                    transformation

  -t, --xsltfilename=xsltfilename                                                   XSLT file to do the transformation

  --json                                                                            format output as json

  --loglevel=(trace|debug|info|warn|error|fatal|TRACE|DEBUG|INFO|WARN|ERROR|FATAL)  [default: warn] logging level for this command
                                                                                    invocation

EXAMPLE

      ** Transform given xml using XSLT **

    
      sfdx mohanc:xml:transform -i /tmp/cd.xml -t /tmp/cd.xsl



```

## Demo

- Input XML
```
cat ~/.xml/article.xml

```

```xml

<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="example.xsl"?>
<Article>
  <Title>My Article</Title>
  <Authors>
    <Author>Mr. Foo</Author>
    <Author>Mr. Bar</Author>
  </Authors>
  <Body>This is my article text.</Body>
</Article>
```

- XSL


```
cat ~/.xml/article.xsl

```

```xml

<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text"/>

  <xsl:template match="/">
    Article - <xsl:value-of select="/Article/Title"/>
    Authors: <xsl:apply-templates select="/Article/Authors/Author"/>
  </xsl:template>

  <xsl:template match="Author">
    - <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet>

```

- Run

```
sfdx mohanc:xml:transform -i ~/.xml/article.xml -t ~/.xml/article.xsl 
=== Writing the output into file : ~/.xml/article.xml.out.xml.html ===

```

- Output

```
cat ~/.xml/article.xmlarticle.xml.out.xml.html
```

```
    Article - My Article
    Authors: 
    - Mr. Foo
    - Mr. Bar
```

## XML2CSV tool
- [xml2csv](https://mohan-chinnappan-n2.github.io/data/util/xml2csv.html)

## References

- [XSLT Basic Example](https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/Basic_Example)
