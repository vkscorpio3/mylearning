#创建一个Component

##编辑*core-items.xml

/Users/Wen/Work/hybris-5.4-my/bin/custom/myb2c/myb2ccore/resources/myb2ccore-items.xml
```
<!-- Add your item definitions here -->
<typegroup name="MyComponet">
	<itemtype code="MyProductComponent" autocreate="true" generate="true" extends="SimpleCMSComponent"
		jaloclass="de.hybris.platform.cms2lib.components.MyProductComponent">
		<attributes>
			<attribute autocreate="true" qualifier="product" type="Product" generate="true">
				<persistence type="property" qualifier="product" />
				<modifiers read="true" write="true" search="true" optional="false" />
			</attribute>
		</attributes>
	</itemtype>
</typegroup>
```
ant all  
sh hybrisserver.sh

登录hac update

##创建 JSP 文件

> jsp 名字和位置要注意，不要乱写，以及Controller的名字

/Users/Wen/Work/hybris-5.4-my/bin/custom/myb2c/myb2cstorefront/web/webroot/WEB-INF/views/desktop/cms/myproductcomponent.jsp

```
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product"%>
<%@ taglib prefix="nav" tagdir="/WEB-INF/tags/desktop/nav"%>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/desktop/storepickup"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
 
	<product:productMyComponent product="${productData}" />
 
<storepickup:pickupStorePopup />
```
/Users/Wen/Work/hybris-5.4-my/bin/custom/myb2c/myb2cstorefront/web/webroot/WEB-INF/tags/desktop/product/productMyComponent.tag
```
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="product" required="true" type="de.hybris.platform.commercefacades.product.data.ProductData" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="product" tagdir="/WEB-INF/tags/desktop/product" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/desktop/cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="storepickup" tagdir="/WEB-INF/tags/desktop/storepickup" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="action" tagdir="/WEB-INF/tags/desktop/action" %>
 
<spring:theme code="text.addToCart" var="addToCartText"/>
<c:url value="${product.url}" var="productUrl"/>
 
<c:set value="${not empty product.potentialPromotions}" var="hasPromotion"/>
 
<ycommerce:testId code="product_wholeProduct">
	<div class="productGridItem ${hasPromotion ? 'productGridItemPromotion' : ''}">
	    <a href="${productUrl}" title="${product.name}" class="productMainLink">
	        <div class="thumb">
	              <product:productPrimaryImage product="${product}" format="product"/>
	              <c:if test="${not empty product.potentialPromotions and not empty product.potentialPromotions[0].productBanner}">
	                     <img class="promo" src="${product.potentialPromotions[0].productBanner.url}" alt="${product.potentialPromotions[0].description}" title="${product.potentialPromotions[0].description}"/>
	              </c:if>
	        </div>
	
	        <div class="priceContainer">
	              <c:set var="buttonType">submit</c:set>
	              <ycommerce:testId code="product_productPrice">
	                     <span class="price"><format:price priceData="${product.price}"/></span>
	              </ycommerce:testId>
	        </div>
	
	
	        <div class="details">
	              <ycommerce:testId code="product_productName">${product.name}</ycommerce:testId>
	        </div>
	    </a>
	</div>
</ycommerce:testId>
```
> 如果价格不能显示，并且是5.4版本，参考上级目录中的Common

##创建 ComponentController
> 不创建Controller也可以，应该是默认调用SimpleCMSComponent了。

```
package com.dev118.hybris.myb2c.storefront.controllers.cms;

import de.hybris.platform.cms2lib.model.components.MyProductComponentModel;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.dto.converter.Converter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev118.hybris.myb2c.storefront.controllers.ControllerConstants;


/**
 * @author Wen
 *
 */
@Controller("MyProductComponentController")
@Scope("tenant")
@RequestMapping(value = ControllerConstants.Actions.Cms.MyProductComponent)
public class MyProductComponentController extends AbstractCMSComponentController<MyProductComponentModel>
{

	//	@Resource(name = "productFacade")
	//	private ProductFacade productFacade;

	@Resource(name = "productConverter")
	private Converter<ProductModel, ProductData> productConverter;

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.accenture.hybris.taskwcms.storefront.controllers.cms.AbstractCMSComponentController#fillModel(javax.servlet
	 * .http.HttpServletRequest, org.springframework.ui.Model,
	 * de.hybris.platform.cms2.model.contents.components.AbstractCMSComponentModel)
	 */
	@Override
	protected void fillModel(final HttpServletRequest request, final Model model, final MyProductComponentModel component)
	{
		final ProductData data = new ProductData();
		productConverter.convert(component.getProduct(), data);

		model.addAttribute("productData", data);
	}

}
```


##Modifying Access Rights


## Cockpit Configuration

## Initial Data

## Summary