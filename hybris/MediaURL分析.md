# Media URL 分析

```
http://img.mall.mn.com.cn/medias/-800.jpg?context=bWFzdGVyfGltYWdlc3wyODMwNzZ8aW1hZ2UvanBlZ3w4ODAzNzk0NDE5NzQyL-S5sOi0teWwsemZqi04MDAuanBnfGViYjc5YzhiMzIzN2RmNWUxNTc4NGQzOWI3ZGFiYWM5YmU0NTM1ZDM1YWQwY2Y1OGUxZTYyNmZiZmNjNzRhNzg
```

> hybris中的图片访问路径，context参数有数字和大小写字母组合，里面可以混入转码后的攻击脚本，存在安全漏洞，图片的访问路径在Model定义中是一个动态属性（DB中没有列定义和数据），通过查询图片路径验证图片是否合法不可行。调查中，在wiki发现一个接口MediaURLStrategy。

反编译接口

```
public interface MediaURLStrategy {
    public abstract String getUrlForMedia(de.hybris.platform.media.storage.MediaStorageConfigService.MediaFolderConfig mediafolderconfig, MediaSource mediasource);
}
```

实现类 LocalMediaWebURLStrategy

Base64加密

```
private String assembleMediaLocationContext(String folderQualifier, MediaSource mediaSource) {
	StringBuilder builder = new StringBuilder(getTenantId());
	builder.append("|").append(folderQualifier.replace("|", ""));
	builder.append("|").append(mediaSource.getSize());
	builder.append("|").append(getCtxPartOrNullMarker(mediaSource.getMime()));
	builder.append("|").append(getCtxPartOrNullMarker(mediaSource.getLocation()));
	builder.append("|").append(getCtxPartOrNullMarker(mediaSource.getLocationHash()));
	return (new Base64(-1, null, true)).encodeAsString(builder.toString().getBytes());
}
```

http://img.mall.mn.com.cn/medias/-800.jpg?context=bWFzdGVyfGltYWdlc3wyODMwNzZ8aW1hZ2UvanBlZ3w4ODAzNzk0NDE5NzQyL-S5sOi0teWwsemZqi04MDAuanBnfGViYjc5YzhiMzIzN2RmNWUxNTc4NGQzOWI3ZGFiYWM5YmU0NTM1ZDM1YWQwY2Y1OGUxZTYyNmZiZmNjNzRhNzg


LocalMediaWebURLStrategyTest

```
private String decodeBase64(final String value) {
	String decodedValue = "";
	if (StringUtils.isNotBlank(value)) {
		try {
			decodedValue = new String(new Base64(-1, null, true).decode(value));
		} catch (final Exception e) {
			throw new RuntimeException("Cannot decode base32 coded string: " + value);
		}
	}
	return decodedValue;
}
```

master|images|274574|image/jpeg|8801557479454/买贵就陪-800.jpg|1b19988966e618d0c796a90f99d732ccb28a307c0f8fa0ff825eef2674b7d28e

* master|
* images|
* 274574|
* image/jpeg|
* 8801557479454/买贵就陪-800.jpg|
* 1b19988966e618d0c796a90f99d732ccb28a307c0f8fa0ff825eef2674b7d28e

### 方案

> 方法中解密图片的context参数，解密后验证数据是否合法，如果参数非法，banner 重置为 “”，如果合法继续判断，取文明中的图片名到DB中查询，如果不存在说明参数也是非法的，banner 重置为 “”，如果DB中存在，则证明参数合法。