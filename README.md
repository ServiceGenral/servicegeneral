# How to setup Service General Project on Local
# Install the below prerequisite sofware packages
1. [JDK 11](https://www.oracle.com/java/technologies/downloads/)
2. [ECLIPSE IDE](https://www.eclipse.org/downloads/packages/)
3. [MYSQL Server](https://dev.mysql.com/downloads/mysql/)
4. [MYSQL WORKBENCH](https://dev.mysql.com/downloads/workbench/)
5. UI Text Editor ([Sublime](https://www.sublimetext.com/))
6. [Xamp PHP Apache Server](https://www.apachefriends.org/index.html) / MAC ApacheCTL
7. Any browser ([Chrome](https://www.google.com/chrome/))


# Database Setup : MySQL Workbench
1. Open MySQL Workbench
2. Create a new Database Schema name _**servicegeneraldb**_
3. Execute this initialization [DB-Script](https://github.com/servicegeneral/servicegeneral/blob/main/servicegeneral-dbscripts/SG_10072021.sql)

# Backend Application Setup : Eclipse IDE
1. Open Eclipse IDE and create a new workspace
2. Import the [servicegeneral-api](https://github.com/servicegeneral/servicegeneral/tree/main/servicegeneral-api) project
3. Right click on the project properties and configure Java Compiler as JDK 11
4. Right click on the project and go to build -> configure build path and set the java 11 path in the classpath of the project
5. Right click on the project and create a Java Application Run configurations using **Run** config menu
6. Select the Main class as ServiceGeneralApplication from the search menu and click on run

# UI Application Setup : Apache Server
1. Create a folder servicegeneral in Apache server's root directory
2. Copy the [servicegeneral-ui](https://github.com/servicegeneral/servicegeneral/tree/main/servicegeneral-ui) project in the Apache server's root/servicegeneral/ directory
3. Start Apache server

# Access Application
1. Go to [http://127.0.0.1/servicegeneral/servicegeneral-ui/](http://127.0.0.1/servicegeneral/servicegeneral-ui/) to access the project
