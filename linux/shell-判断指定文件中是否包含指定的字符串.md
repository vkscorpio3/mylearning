# shell-判断指定文件中是否包含指定的字符串

> ...

## 来自百度
```
grep "prod" /home/admin/gitrep/otp/otp-webapp-api/src/main/webapp/WEB-INF/web.xml > /dev/null
if [ $? -eq 0 ]; then
    echo "Found!"
else
    echo "Not found!"
fi
```

## 自己写的

```
if [ `grep -c "prod" /home/admin/gitrep/otp/otp-webapp-api/src/main/webapp/WEB-INF/web.xml` -eq '0' ]; then

    echo "Found!"
else
    echo "web.xml Spring Profiles Default config error!"
fi

echo "..................."

if [ `grep -c "dev" /home/admin/gitrep/otp/otp-webapp-api/src/main/webapp/WEB-INF/web.xml` -eq '0' ]; then

    echo "Found!"
else
    echo "web.xml Spring Profiles Default config error!"
fi
```