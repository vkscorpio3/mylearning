# 嵌入页面

> 有些情况要展现的数据并非是来自于指定的Type，有可能是统计报表，也有可能是外部系统。

## hmc.xml

```
<explorertree mode="append">
	<group name="group.xxx" mode="append">
		<group name="group.xxx.xxx" mode="append">
			<staticcontent name="xxx" uri="xxx.jsp"/> 
		</group>
	</group>
</explorertree>
```

## jsp

jsp 位置在 project/hmc/jsp/xxx.jsp

> 这个jsp是直接加装的，很多情况都是希望通过servlet或一些MVC框架来加装jsp，并且绑定一些数据，有个小技巧如下。

```
<iframe src="/exthmc/XxxController" width="100%" height="100%" style="min-width:800px;"></iframe>
```