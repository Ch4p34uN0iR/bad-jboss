# bad-jboss
This is a Dockerfile to build an intentionally vulnerable JBossAS server for Pen Testing

To build the image run the following docker command:

docker build -t ctf/jboss-as:6.1 .

To start a container run:

docker run --name jboss --hostname jboss -p 8080:8080 ctf/jboss-as:6.1 

Note: The run command for the container requires the hostname to be set.  Otherwise the JBoss server will listen only on 127.0.0.1 and be unreachable.

You should now have a JBoss AS server that is vulnerable to java deserialization attacks as documented here: https://foxglovesecurity.com/2015/11/06/what-do-weblogic-websphere-jboss-jenkins-opennms-and-your-application-have-in-common-this-vulnerability/#websphere

You can clone the joaomatosf/jexboss git repository (https://github.com/joaomatosf/jexboss) and use the provided jexboss.py script to verify the exploit:

./jexboss.py -u http://localhost:8080

This should generate a TUI that scans the endpoint, and offers to build a reverse shell to the server.

