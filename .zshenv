export LC_ALL="ja_JP.UTF-8"

# General Path Setting
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share:/bin:/sbin:$PATH

# Java Home
export JAVA_HOME="$(/usr/libexec/java_home)"

# pyenv 
if which pyenv > /dev/null; then
  export PATH=$HOME/.pyenv/shims:$PATH
  eval "$(pyenv init -)";
fi

# nodebenv
if which nodebrew > /dev/null; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

# virtualenv
export WORKON_HOME=$HOME/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# EC2 Setting
#export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
#export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
#export EC2_HOME=/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars
#export AWS_CREDENTIAL_FILE=$HOME/.ec2/cred.txt



