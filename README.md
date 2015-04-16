# SpringMVC3Demo
Hibernate+Spring+Spring MVC+Bootstrap project management system

InfrastructureProjects: is extracted on the basis of projects, mainly encapsulates some common operations.

SpringMVC3Demo: where is the project management system.

WeiXinAPI: encapsulates some of the operations are done before the test micro-channel management platform, if the project does not need to be removed.

Note: The front-end UI framework of the project with a foreign-based development Bootstrap framework of Demo, such as do not need to replace the familiar UI framework can be.
PS:


In the Hibernate configuration files such as Role.hbm.xml in, authorities here with many I was lazy = "false", because when the user logs checking permissions sure to get all the authorities under the corresponding Role, so no need to open lazy loading, but if you want to add other features that make lazy to decide whether to open on demand, such as Accounts -> Order this would need to open lazy. There are many online information about Hibernate for reference, here recommend Liu Dong NHibernate brother wrote a series of articles: http://www.cnblogs.com/GoodHelper/category/214139.html can learn Hibernate as a reference.

 

Because there will be a performance loss OpenSessionInView, so the project is not open OpenSessionInView, and Hibernate transaction is configured to Service, so please be prepared to return data when the Service Layer good all the required data, or in the Controller or View, want to call lazy loading data will throw an exception transaction has closed.

 

Run the project is best to use a new chrome or firefox browser, Bootstrap3 IE8 does not support the following browsers, but in order to fully use IE, then the effect is shown Bootstrap3 least IE10.

 

Because of the recent things that are more international projects have not had time to add, you can also add their own practice hand counted according to the series (8) was talking about (^. ^) ~

 

jar package referenced project is added to the User Library, there may be inside when the project expanded into a local path is not the same, and I quote machine, if the package is not the path correctly according to the package on their own machines The path changes.


A total of more than 70 MB, but when you get excited, not so much the main project is to find the required package, download the zip file unzip the package will be a bunch of files, many of which are useless to, I did not delete the following folders are placed Dependence , just in the project need to add a reference to the package.


PPS: Because this system has two projects, one is the common infrastructure projects, one is the site was so easy to manage package User Library with a way to add items required packages, some time before feeling more and more slow computer , put the computer in the virtual machine uninstalled, leaving only the source of the project, and then a friend told me after the project import User Library content inside is empty, and then I put my project into eclipse win system also User Library found no content (also encountered a pit, or wrong way I used to?). So, I do not know what the package User Library references friends can refer to Section 11 of the project source code, which is a direct reference to the package added to the project which, of course, a reference to the first 11 package is less than this project, but few references Follow the prompts to add Dependence package folder can be found after the other: Infrastructure Projects referenced SpringMVC3 Demo User Library and reference is different and requires attention.
