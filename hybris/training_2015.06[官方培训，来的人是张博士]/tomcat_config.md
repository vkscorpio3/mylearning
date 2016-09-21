# Config

config/tomcat/conf/server.xml

```
<Engine name="Catalina" defaultHost="localhost" startStopThreads="0">

			<Valve 	className="org.apache.catalina.valves.AccessLogValve"
             		directory="${HYBRIS_LOG_DIR}/tomcat"
	      		 	prefix="access."
        	   		suffix=".log"
	      		 	pattern="combined"
          />

      <Host 	name="localhost"
      			appBase="webapps"
		       	unpackWARs="false"
		       	autoDeploy="false"
            startStopThreads="0">


			${tomcat.webapps}


      </Host>

    </Engine>
```
注意需要修改2处
```
startStopThreads="0"
```

ant all
