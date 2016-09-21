#创建一个PageTemplate-Sample

##基本步骤
- Define PageTemplate
- Define ContentSlots
- Create PageTemplate JSP
- Create Velocity Template


##补充
> 此时模版里没有内容，如果需要看到效果，需要往ContentSlots中插入Component


-----------------
-----------------

##ImpEX
```

########## 定义 ##########
$contentCatalog=electronicsContentCatalog
$contentCV=catalogVersion(CatalogVersion.catalog(Catalog.id[default=$contentCatalog]),CatalogVersion.version[default=Staged])[default=$contentCatalog:Staged]

$picture=media(code, $contentCV);

UPDATE GenericItem[processor=de.hybris.platform.commerceservices.impex.impl.ConfigPropertyImportProcessor];pk[unique=true]
$jarResourceCms=$config-jarResourceCmsValue
$siteResource=jar:de.hybris.platform.electronicsstore.constants.ElectronicsstoreConstants&/electronicsstore/import/sampledata/contentCatalogs/$contentCatalog

$productCatalog=electronicsProductCatalog
$productCatalogName=Electronics Product Catalog
$productCV=catalogVersion(catalog(id[default=$productCatalog]),version[default='Staged'])[unique=true,default=$productCatalog:Staged]


########## 定义模板 (cv, uid, name, jspName, pageType, active, velocityTemplate) ##########
#/Users/Wen/Work/hybris-5.4-my/bin/custom/myb2c/myb2cstorefront/web/webroot/WEB-INF/views/desktop/pages/layout/myLayoutPage.jsp

#/Users/Wen/Work/hybris-5.4-my/bin/custom/myb2c/myb2ccore/resources/myb2ccore/import/cockpits/cmscockpit/structure-view/structure_MyPageTemplate.vm

INSERT_UPDATE PageTemplate;$contentCV[unique=true];uid[unique=true];name;frontendTemplateName;restrictedPageTypes(code);active[default=true];velocityTemplate[translator=de.hybris.platform.commerceservices.impex.impl.FileLoaderValueTranslator]
;;MyTemplate;My Page Template;layout/myLayoutPage;CategoryPage;;$jarResourceCms/structure-view/structure_MyPageTemplate.vm


########## 定义模板的插槽 (name, template, validComponentTypes, compTypeGroup) ##########
INSERT_UPDATE ContentSlotName;name[unique=true];template(uid,$contentCV)[unique=true][default='MyTemplate'];validComponentTypes(code);compTypeGroup(code)

;SiteLogo;;;logo
;HeaderLinks;;;headerlinks
;SearchBox;;;searchbox
;MiniCart;;;minicart
;NavigationBar;;;navigation
;Footer;;;footer
;TopHeaderSlot;;;wide
;BottomHeaderSlot;;;wide
;PlaceholderContentSlot;;;

;MyAdSlot1;;;wide
;MyAdSlot2;;;wide

;MyProductSlot1;;;wide
;MyProductSlot2;;;wide
;MyProductSlot3;;;wide
;MyProductSlot4;;;wide
;MyProductSlot5;;;wide
;MyProductSlot6;;;wide
;MyProductSlot7;;;wide
;MyProductSlot8;;;wide
;MyProductSlot9;;;wide

########## 定义新的插槽 (cv, uid, name, active) ##########
INSERT_UPDATE ContentSlot;$contentCV[unique=true];uid[unique=true];name;active[default=true]
;;MyAdSlot1;My Ad Slot1
;;MyAdSlot2;My Ad Slot2

;;MyProductSlot1;My Product Slot1
;;MyProductSlot2;My Product Slot2
;;MyProductSlot3;My Product Slot3
;;MyProductSlot4;My Product Slot4
;;MyProductSlot5;My Product Slot5
;;MyProductSlot6;My Product Slot6
;;MyProductSlot7;My Product Slot7
;;MyProductSlot8;My Product Slot8
;;MyProductSlot9;My Product Slot9


########## 绑定 模板和插槽实例  (cv, uid, position, pageTemplate, contentSlot, allowOverwrite) ##########
INSERT_UPDATE ContentSlotForTemplate;$contentCV[unique=true];uid[unique=true];position[unique=true];pageTemplate(uid,$contentCV)[unique=true][default='MyTemplate'];contentSlot(uid,$contentCV)[unique=true];allowOverwrite[default=true]
;;WcmsTask2-SiteLogo;SiteLogo;;SiteLogoSlot;true
;;WcmsTask2-HeaderLinks;HeaderLinks;;HeaderLinksSlot;true
;;WcmsTask2-SearchBox;SearchBox;;SearchBoxSlot;true
;;WcmsTask2-MiniCart;MiniCart;;MiniCartSlot;true
;;WcmsTask2-NavigationBar;NavigationBar;;NavigationBarSlot;true
;;WcmsTask2-Footer;Footer;;FooterSlot;true
;;WcmsTask2-TopHeaderSlot;TopHeaderSlot;;TopHeaderSlot;true
;;WcmsTask2-BottomHeaderSlot;BottomHeaderSlot;;BottomHeaderSlot;true
;;WcmsTask2-PlaceholderContentSlot;PlaceholderContentSlot;;PlaceholderContentSlot;true

;;WcmsTask2-MyAdSlot1;MyAdSlot1;;MyAdSlot1
;;WcmsTask2-MyAdSlot2;MyAdSlot2;;MyAdSlot2

;;WcmsTask2-MyProductSlot1;MyProductSlot1;;MyProductSlot1
;;WcmsTask2-MyProductSlot2;MyProductSlot2;;MyProductSlot2
;;WcmsTask2-MyProductSlot3;MyProductSlot3;;MyProductSlot3
;;WcmsTask2-MyProductSlot4;MyProductSlot4;;MyProductSlot4
;;WcmsTask2-MyProductSlot5;MyProductSlot5;;MyProductSlot5
;;WcmsTask2-MyProductSlot6;MyProductSlot6;;MyProductSlot6
;;WcmsTask2-MyProductSlot7;MyProductSlot7;;MyProductSlot7
;;WcmsTask2-MyProductSlot8;MyProductSlot8;;MyProductSlot8
;;WcmsTask2-MyProductSlot9;MyProductSlot9;;MyProductSlot9

########## MyProductComponent (cv, uid, name, &componentRef, product) ##########
###自定义Component
INSERT_UPDATE MyProductComponent;$contentCV[unique=true];uid[unique=true];name;&componentRef;product(code, $productCV)
;;MyProductComponent1;My Product Component1;p1;2934303
;;MyProductComponent2;My Product Component2;p2;1992695
;;MyProductComponent3;My Product Component3;p3;1978440

;;MyProductComponent4;My Product Component4;p4;1322041
;;MyProductComponent5;My Product Component5;p5;479956
;;MyProductComponent6;My Product Component6;p6;443175

;;MyProductComponent7;My Product Component7;p7;832386
;;MyProductComponent8;My Product Component8;p8;23355
;;MyProductComponent9;My Product Component9;p9;266685


########## Update ContentSlot (cv, uid, cmsComponents) ##########
INSERT_UPDATE ContentSlot;$contentCV[unique=true];uid[unique=true];cmsComponents(&componentRef)
#;;MyAdSlot1;MyAd1Component
#;;MyAdSlot2;MyAd2Component

;;MyProductSlot1;p1
;;MyProductSlot2;p2
;;MyProductSlot3;p3
;;MyProductSlot4;p4
;;MyProductSlot5;p5
;;MyProductSlot6;p6
;;MyProductSlot7;p7
;;MyProductSlot8;p8
;;MyProductSlot9;p9



########## Page (cv, uid, name, masterTemplate, defaultPage, approvalStatus) ##########
INSERT_UPDATE CategoryPage;$contentCV[unique=true];uid[unique=true];name;masterTemplate(uid,$contentCV);defaultPage;approvalStatus(code)[default='approved']
;;MyPage;My Page;MyTemplate;true;


```

## JSP

```
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common"%>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/desktop/storepickup"%>

<template:page pageTitle="${pageTitle}">
	<div id="globalMessages">
		<common:globalMessages />
	</div>

	<div class="span-24">
		<cms:pageSlot position="MyAdSlot1" var="feature"> <cms:component component="${feature}" /> </cms:pageSlot>
	</div>
	
	<div class="span-24">
		<div class="span-8 first">
			<cms:pageSlot position="MyProductSlot1" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8">
			<cms:pageSlot position="MyProductSlot2" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8 last">
			<cms:pageSlot position="MyProductSlot3" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
	</div>

	<div class="span-24">
		<div class="span-8 first">
			<cms:pageSlot position="MyProductSlot4" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8">
			<cms:pageSlot position="MyProductSlot5" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8 last">
			<cms:pageSlot position="MyProductSlot6" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
	</div>
	
	<div class="span-24">
		<div class="span-8 first">
			<cms:pageSlot position="MyProductSlot7" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8">
			<cms:pageSlot position="MyProductSlot8" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
		<div class="span-8 last">
			<cms:pageSlot position="MyProductSlot9" var="feature">
				<cms:component component="${feature}" />
			</cms:pageSlot>
		</div>
	</div>
	
	<div class="span-24">
		<cms:pageSlot position="MyAdSlot2" var="feature"> <cms:component component="${feature}" /> </cms:pageSlot>
	</div>

	<storepickup:pickupStorePopup />
	
</template:page>
```

## Velocity

```
<div>
	<table width="100%" cellspacing="0" style="margin:0;padding:0;table-layout:auto;border:1px solid #1E4EBF;">
		<tbody>
			<tr>
				<td colspan="9" class="structureViewSection">
					<cockpit code="TopHeaderSlot"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" height="125px" width="35%" rowspan="2" class="structureViewSection">
					<cockpit code="SiteLogo" />
				</td>
				<td colspan="5" class="structureViewSection">
					<cockpit code="HeaderLinks" />
					<cockpit code="SearchBox" />
				</td>
				<td width="20%" rowspan="2" class="structureViewSection">
					<cockpit code="MiniCart" />
				</td>
			</tr>
			<tr>
				<td colspan="9" class="structureViewSection">
					<cockpit code="NavigationBar" />
				</td>
			</tr>
			<tr>
				<td colspan="9" class="structureViewSection">
					<cockpit code="BottomHeaderSlot"/>
				</td>
			</tr>
			
			
			
			
			
			
			<tr> <td colspan="9" class="structureViewSection"> <cockpit code="MyAdSlot1" /> </td> </tr>
			
			<tr>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot1" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot2" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot3" /> </td>
			</tr>
			
			<tr>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot4" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot5" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot6" /> </td>
			</tr>
			
			<tr>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot7" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot8" /> </td>
				<td colspan="3" class="structureViewSection"> <cockpit code="MyProductSlot9" /> </td>
			</tr>
			
			<tr> <td colspan="9" class="structureViewSection"> <cockpit code="MyAdSlot2" /> </td> </tr>
			
			
			
			
			
			<tr>
				<td colspan="9" class="structureViewSection">
					<cockpit code="Footer" />
				</td>
			</tr>
		</tbody>
	</table>
	<div style="width:100%; border-top: 2px solid #bbb" class="cmsContentEditor">
		<cockpit code="editor" />
	</div>
</div>
```

## 预览当前模版的页面
> 登录cmscockpit中可以预览，Page名字在ImpEx中。