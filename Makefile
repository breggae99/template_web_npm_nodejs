#install all and update all necessary software
all:
	npm cache clean -f
	sudo npm install -g npm
	sudo apt install curl
	sudo curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
	sudo apt install -y nodejs
	node -v
	npm -v

#install all in dependencies listed modules
install_modules:
	npm install

#create package.json
init:
	npm init

#install basic modules and add them to package dependencies
install_basic_modules:
	npm i node@lts --save
	npm i bootstrap --save
	npm i express --save
	npm i express-session --save
	npm i pug --save
	npm i path --save
	npm i body-parser --save
	npm i moment --save
	npm i react --save
	npm i prop-types --save
	npm i jquery --save
	#npm i vue --save
	#npm i angular --save

#remove all listed node_modules
remove_modules:
	sudo rm -R node_modules
	@echo "INFO: 'node_modules' folder has been successfully deleted"

#Nodemon
install_nodemon:
	sudo npm install -g nodemon

# start nodemon
start:
	nodemon

#Node JS debugging
inspect:
	@echo "INFO for DEBUGGING: Type into address bar in Chrome, 'about:inspect' and click on 'Open...for Node'. Good Luck!"
	nodemon --inspect-brk

#Sass
sass_compressed:
	sass private/sass/main.sass server/public/css/main.min.css --style compressed

sass:
	sass private/sass/main.sass server/public/css/main.css

#install npm itself
install_npm:
	sudo apt install npm

#PM2
pm2_install:
	npm install pm2 -g

pm2_list:
	pm2 list

pm2_start:
	pm2 start index.js

#<app_name|namespace|id|'all'|json_conf>
pm2_stop:
	pm2 stop index 

#<app_name|namespace|id|'all'|json_conf>
pm2_restart:
	pm2 restart index

#<app_name|namespace|id|'all'|json_conf>  
pm2_delete:
	pm2 delete index

#Hot Reload allows to update an application without any downtime:
pm2_reload:
	pm2 reload all