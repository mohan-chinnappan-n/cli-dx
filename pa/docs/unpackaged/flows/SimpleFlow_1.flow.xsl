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


    <xsl:apply-templates select="start"/>
    <xsl:apply-templates select="processMetadataValues"/>
    
    <xsl:apply-templates select="actionCalls"/>

    <xsl:apply-templates select="decisions"/>

   </xsl:template>


  <xsl:template match="start">
    <h3>start</h3>
      <p>filterLogic :  <xsl:value-of select="filterLogic"/> </p>
      <p>object :  <xsl:value-of select="object"/> </p>
      <p>recordTriggerType :  <xsl:value-of select="recordTriggerType"/> </p>
      <p>triggerType :  <xsl:value-of select="triggerType"/> </p>

      <xsl:apply-templates select="filters"/>
  </xsl:template>


  <xsl:template match="filters">

      <h3>filters</h3>
        <p>field :  <xsl:value-of select="field"/> </p>
        <p>operator :  <xsl:value-of select="operator"/> </p>
        <p>value  <xsl:value-of select="value/*"/> </p>

  </xsl:template>


  <xsl:template match="processMetadataValues">
  <h3>processMetadataValues</h3>
          <p>name :  <xsl:value-of select="name"/> </p>
          <p>value :  <xsl:value-of select="value/*"/> </p>

  </xsl:template>


  <xsl:template match="actionCalls">
  <h3>actionCalls</h3>
          <p>description :  <xsl:value-of select="description"/> </p>
          <p>label :  <xsl:value-of select="label"/> </p>
          <p>actionName :  <xsl:value-of select="actionName"/> </p>

          <p>actionType :  <xsl:value-of select="actionType"/> </p>
          <p>flowTransactionModel :  <xsl:value-of select="flowTransactionModel"/> </p>
           <xsl:apply-templates select="inputParameters"/>

  </xsl:template>


  <xsl:template match="inputParameters">
  <h3>inputParameters</h3>
  <p>name :  <xsl:value-of select="name"/> </p>
  <p>value :  <xsl:value-of select="value/*"/> </p>
  </xsl:template>



































     

   
</xsl:stylesheet>


