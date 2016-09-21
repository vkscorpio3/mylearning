# Spring ApplicationContext

> 总有一些类不在Spring容器的控制范围内，又想用其中的bean。
> 上一次遇到场景是在CPS项目中定义Hibernate拦截器。
> 这次是在 HttpSessionListener 中保存数据到DB。

### 在Web中获取ServletContext 中 ApplicationContext
```
ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(ServletContext sc);
```

```
ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(ServletContext sc);
```

### CPS中实现方式
实现ApplicationContextAware 接口

说明：实现该接口的setApplicationContext(ApplicationContext context)方法，并保存ApplicationContext 对象。Spring初始化时，会通过该方法将ApplicationContext对象注入。

代码：

```
private static ApplicationContext context;

@Override
public void setApplicationContext(ApplicationContext applicationcontext) throws BeansException {
	context = applicationcontext;
}
```
