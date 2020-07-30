# 99Stack Cloud 
## Installer
Automated deployment and configuration of pupular open source applications in [99Stack Cloud](https://www.99stack.com) (or any GNU+Linux machine), using bash scripts. Any script in this project can run standalone or be passed as `script_url` during deployment.

### Example:
```json
POST: https://api.99stack.com/v1/server/create
{
  "hostname": "my-server",
  "label": "ServerName",
  "region": 301,
  "image": 3108,
  "plan": 3101,
  "auto_backups": false,
  "ipv6_networking": true,
  "ddos_protection": false,
  "private_networking": true,
  "ssh_key": "5cb46fd8-1b2d-11e9-ab14-d663bd873d93",
  "script_url": "SCRIPT_URL_HERE"
}
```

## Structure
The directory structure of this project is divided by distro, version, package, version. (i.e `/debian/10/lemp-stack/16.4`)The main.bash or project.bash file is the installation script, other files such as configuration files and other assets may exit inside each project as well. Everything in this repo can be redistributed and used in your own projects.

## Contributions
Let users of your open source app easily deploy your app in the cloud, by pushing your own installation scripts to this project. Include your accounts unique affiliate link to your project description (README.md file in the root of your project), to earn comission every time someone deploy your app in 99Stack Cloud.
