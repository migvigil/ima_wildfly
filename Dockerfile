FROM jboss/wildfly

RUN /opt/jboss/wildfly/bin/add-user.sh admin wildfly --silent

COPY example/target/example.war /opt/jboss/wildfly/standalone/deployments/

COPY cluster-test/target/cluster-test.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 8080 9990 8181

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
