/usr/share/tomcat/bin/shutdown.sh
rm /user/share/tomcat/webapps/ROOT.war
rm -rf /user/share/tomcat/webapps/ROOT
cp /var/lib/jenkins/jobs/moz-build/lastSuccessful/archive/open-lmis/modules/openlmis-web/build/libs/openlmis-web.war /usr/share/tomcat/webapps/ROOT.war
/usr/share/tomcat/bin/startup.sh