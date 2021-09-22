<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<html> 

<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></link>

</head>

<body style='padding:10px;'>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

</body>
</html>



   <xsl:template match="Flow">
    <h2>PB Process :  <xsl:value-of select="interviewLabel"/> </h2>
    <p>description :  <xsl:value-of select="description"/> </p>
    <p>API Version :  <xsl:value-of select="apiVersion"/> </p>
    <p>status :  <xsl:value-of select="status"/> </p>

    <p>processType :  <xsl:value-of select="processType"/> </p>
    <p>startElementReference :  <xsl:value-of select="startElementReference"/> </p>


    <xsl:apply-templates select="assignments"/>
    <xsl:apply-templates select="processMetadataValues"/>
    <xsl:apply-templates select="variables"/>

    <xsl:apply-templates select="decisions"/>

   </xsl:template>


  <xsl:template match="assignments">
    <h3>Assignments</h3>
      <p>Name :  <xsl:value-of select="name"/> </p>
      <p>Label :  <xsl:value-of select="label"/> </p>
      <xsl:apply-templates select="assignmentItems"/>
  </xsl:template>


  <xsl:template match="assignmentItems">

      <h3>Assignment Items</h3>
        <p>operator :  <xsl:value-of select="operator"/> </p>
        <p>value :  stringValue:  <xsl:value-of select="value/stringValue"/> </p>

  </xsl:template>


  <xsl:template match="processMetadataValues">
  <h3>processMetadataValues</h3>
          <p>name :  <xsl:value-of select="name"/> </p>
          <p>value :  <xsl:value-of select="value/*"/> </p>

  </xsl:template>


  <xsl:template match="variables">
  <h3>variables</h3>
          <p>name :  <xsl:value-of select="name"/> </p>
          <p>dataType :  <xsl:value-of select="dataType"/> </p>

          <p>isCollection :  <xsl:value-of select="isCollection"/> </p>
          <p>isInput :  <xsl:value-of select="isInput"/> </p>
          <p>isOutput :  <xsl:value-of select="isOutput"/> </p>
          <p>objectType :  <xsl:value-of select="objectType"/> </p>




  </xsl:template>


  <xsl:template match="decisions">
  <h3>decisions</h3>
  <p>name :  <xsl:value-of select="name"/> </p>
  <p>label :  <xsl:value-of select="label"/> </p>
  <p>defaultConnectorLabel :  <xsl:value-of select="defaultConnectorLabel"/> </p>

 
  <xsl:apply-templates select="processMetadataValues"/>

  <xsl:apply-templates select="rules"/>


  </xsl:template>


<xsl:template match="rules">

  <h3>rules</h3>
  <p>name :  <xsl:value-of select="name"/> </p>    
  <p>label :  <xsl:value-of select="label"/> </p>


  <p>conditionLogic :  <xsl:value-of select="conditionLogic"/> </p>

  <xsl:apply-templates select="processMetadataValues"/>


  <xsl:apply-templates select="conditions"/>


</xsl:template>


<xsl:template match="conditions">
  <h3>conditions</h3>
   <p>operator :  <xsl:value-of select="operator"/> </p>    
    <p>leftValueReference :  <xsl:value-of select="leftValueReference"/> </p>  
    <p>rightValue :  <xsl:value-of select="rightValue/*"/> </p>    
   <xsl:apply-templates select="processMetadataValues"/>
</xsl:template>

































     

   
</xsl:stylesheet>

