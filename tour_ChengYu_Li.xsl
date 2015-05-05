<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output method="html" version="4.0"/>
        <!-- CST3519 D730 - project - Cheng Yu Li -->
        
        <!-- start of root template -->
        <xsl:template match="/">
            <html>
                <head>
                    <title>Project: World Travel,Inc.</title>
                    <LINK rel="stylesheet" type="text/css" href="tour_ChengYu_Li.css"/> 
                </head>
                <body> 
                    <div id="wrapper">
                        <a name="top"></a> <!-- top of the page -->
                        
                        <div id="title">
                            <img align="left" src="logo.png"/> <br/> <h1 id="company">&#160;&#160;World Tour, Inc.</h1><br/>
                        </div>                     
                        
                        <!-- tour list -->
                        <hr/>
                        <table>
                            <tr>
                                <td id="pick">Pick your tour:</td>
                                <xsl:for-each select="tours/tour">
                                    <td id="pick">
                                        <a href="#{generate-id(tourName)}">|<xsl:value-of select="tourName"/>|</a>
                                    </td>                           
                                </xsl:for-each>
                            </tr>      
                        </table>
                        <hr/>  
                       
                        <xsl:for-each select="tours/tour">
                            <div id="topd">
                                <h1 id="tournames">
                                    <a name="{generate-id(tourName)}">&#160;&#160;&#160;&#160;<xsl:value-of select="tourName"/></a>
                                </h1>
                                <p>******************************************************************************************************************************</p>
                            </div>
                            
                            <div id="leftd">
                                <!-- picture -->   
                                <div class="pic">
                                    <img id="photo" hspace="20" src="{tourPhoto}"/>
                                </div>                                        
                                   
                                <!-- tour description -->
                                <div class="desc">
                                    <xsl:value-of select="description"/>
                                </div>
                                <br/><br/><br/>
                                <!-- info -->
                                <table class='info'>
                                    <tr></tr>
                                    <tr>
                                        <td>Guide: &#160;<xsl:value-of select="tourGuide"/></td>
                                    </tr>
                                    <tr>
                                        <td>Email: &#160;<a class="email" href="{tdEmail}"><xsl:value-of select="tdEmail"/></a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Tour starts: <xsl:value-of select="tourStart"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Tour ends: &#160;<xsl:value-of select="tourEnd"/></td>
                                    </tr>                                
                                </table>    
                            </div>
                            
                            <div id="rightd">
                                <br/>
                                <!-- schedule table -->
                                
                                    <table id="t" border="1">
                                        <tr>
                                            <th colspan="2"><xsl:value-of select="tourName"/></th>
                                        </tr>

                                        <tr>
                                            <th width="50">Day</th>
                                            <th width="345">Plan</th>
                                        </tr>
                                        <xsl:apply-templates select="./itinerary/day"/>
                                    </table>
                                
                            </div>
                            
                            <p align="center"><a href='#top'>Back to Top</a></p>                        
                            <p>******************************************************************************************************************************</p>
                        </xsl:for-each>                      
                        <hr/>
                        <footer>&#160;Copyright &#169; 2014 Cheng Yu Li. All Rights Reserved.</footer>
                    </div>
                </body>
            </html>
        </xsl:template>
        <!-- end of root template -->
        
        <!-- start of day template -->
        <xsl:template match="day">
            <tr>
                <td align="center"><xsl:value-of select="dayNumber"/></td>
                <td><xsl:value-of select="plan"/></td>
            </tr>
        </xsl:template>
        <!-- end of day template -->
    </xsl:stylesheet>