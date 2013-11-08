# export variables for ec2 command line tools on os x
if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

if [ -d "/usr/local/Library/LinkedKegs/ec2-api-tools/jars" ]; then
  export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
fi
