<%--
 *  Product: Posterita Web-Based POS and Adempiere Plugin
 *  Copyright (C) 2007  Posterita Ltd
 *  This file is part of POSterita
 *  
 *  POSterita is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * @author Alok
--%>

<!-- contactUs.jsp -->
<%@ page import="org.posterita.user.WebUserInfo" %>
<%@ page import="org.posterita.lib.UdiConstants" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>	
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>	
<%@ taglib uri="/WEB-INF/pos.tld" prefix="pos"%>

<logic:notPresent name="<%=WebUserInfo.NAME%>" scope="session">
	<jsp:forward page="/LoginHome.do"/>
</logic:notPresent>

<bean:define id="title"><pos:message textOnly="true" key="smenu.contactus"/></bean:define>
<%@ include file="/jsp/include/posHeader.jsp" %>
<%@ include file="/jsp/include/errors.jsp" %>
 
<html:form action="/ContactUs">
<html:hidden property="action" value="sendEmail"/>
<table align="left" width="500" border="0" cellpadding="5" cellspacing="0" cols="3">
	<tr>			
		<td><pos:message key="email" /></td>
		<td>:</td>
		<td><html:text property="fromAddress" styleClass="text" size="40" styleId="fromAddress"/>
		<html:hidden property="toAddresses" styleClass="text" value="support@posterita.org"/>
		</td>
	</tr>
	<tr>
			
		<td><pos:message key="email.subject" /></td>
		<td>:</td>
		<td><html:text property="subject" styleClass="text" size="40" />
		</td>

	</tr>
	<tr>			
		<td><pos:message key="email.message" /></td>
		<td></td>
		<td></td>
	</tr>
	<tr>			
		<td colspan="3"><html:textarea property="textMessage" styleClass="text" cols="60" rows="10" />
		</td>
	</tr>
	<tr>
	<td align="right" colspan="3">
			<html:button property="button" styleClass="Submit smallbutton" onclick="newsubmit(this)" tabindex="10" accesskey="s">
			&nbsp;
	        </html:button>
		</td>
	</tr>
</table>
</html:form>
<script>

function newsubmit(button)
{	
	form=document.forms[0];
	button.disabled=true;
	form.submit();
}

	
</script>							
<%@ include file="/jsp/include/posFooter.jsp" %>
