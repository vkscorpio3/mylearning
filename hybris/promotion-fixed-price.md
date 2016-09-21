# Product Fixed Price Promotion

> 自定义一个促销类型，计算价格搞不明了，反编译一个系统自带的研究一下。

## itemt

<itemtype code="ProductFixedPricePromotion"
	extends="ProductPromotion"
	jaloclass="de.hybris.platform.promotions.jalo.ProductFixedPricePromotion"
	autocreate="true"
	generate="true">

	<attributes>

		<attribute
			qualifier="productFixedUnitPrice"
			autocreate="true"
			type="PromotionPriceRowCollectionType">
			<description>Fixed price to sell the product at in specific currencies.</description>
			<persistence type="property" />
			<modifiers read="true" write="true" search="false" initial="false" optional="true" partof="true"/>
		</attribute>

		<attribute qualifier="messageFired" type="localized:java.lang.String">
			<description>The message to show when the promotion has fired.</description>
			<modifiers read="true" write="true" optional="true" />
			<persistence type="property">
				<columntype>
					<value>HYBRIS.LONG_STRING</value>
				</columntype>
			</persistence>
		</attribute>

	</attributes>
</itemtype>
```

## 优惠逻辑

```
public List evaluate(SessionContext ctx, PromotionEvaluationContext promoContext)
{
	List results = new ArrayList();
	PromotionsManager.RestrictionSetResult rsr = findEligibleProductsInBasket(ctx, promoContext);
	Collection promotionPriceRows = getProductFixedUnitPrice(ctx);
	AbstractOrder order = promoContext.getOrder();
	boolean hasValidPromotionPriceRow = hasPromotionPriceRowForCurrency(order, promotionPriceRows);
	if(hasValidPromotionPriceRow && rsr.isAllowedToContinue() && !rsr.getAllowedProducts().isEmpty())
	{
		for(PromotionOrderView view = promoContext.createView(ctx, this, rsr.getAllowedProducts()); view.getTotalQuantity(ctx) > 0L;)
		{
			promoContext.startLoggingConsumed(this);
			PromotionOrderEntry entry = view.peek(ctx);
			long quantityToDiscount = entry.getQuantity(ctx);
			long quantityOfOrderEntry = entry.getBaseOrderEntry().getQuantity(ctx).longValue();
			Double fixedUnitPrice = getPriceForOrder(ctx, promotionPriceRows, order, "productFixedUnitPrice");
			if(fixedUnitPrice != null)
			{
				PromotionOrderEntryConsumed poec;
				for(Iterator iterator = view.consume(ctx, quantityToDiscount).iterator(); iterator.hasNext(); poec.setAdjustedUnitPrice(ctx, fixedUnitPrice))
					poec = (PromotionOrderEntryConsumed)iterator.next();

				double adjustment = (double)quantityToDiscount * (fixedUnitPrice.doubleValue() - entry.getBasePrice(ctx).doubleValue());
				PromotionResult result = PromotionsManager.getInstance().createPromotionResult(ctx, this, promoContext.getOrder(), 1.0F);
				result.setConsumedEntries(ctx, promoContext.finishLoggingAndGetConsumed(this, true));
				PromotionOrderEntryAdjustAction poeac = PromotionsManager.getInstance().createPromotionOrderEntryAdjustAction(ctx, entry.getBaseOrderEntry(), quantityOfOrderEntry, adjustment);
				result.addAction(ctx, poeac);
				results.add(result);
			} else
			{
				promoContext.abandonLogging(this);
			}
		}

		return results;
	} else
	{
		return results;
	}
}
```