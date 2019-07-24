# NYMostPopularArticle
Sample iOS app display the most viewed articles of NY Times

There are two project 
# MostPopularArticles
Design pattern followed
* MVC

# NYMostPopularArticle

Feature
* This App uses the NY Times most viewed articles API.
* Lists all the news based on period.
* Auto downloading of images and cache them.

Requirement
* Xcode: 10.3
* Programming language: Swift 4.0
* Device supported: All
* Orientation: All
* Minimum iOS deployment target: 10.0 and above

Design pattern followed
* VIPER

How to use it
I have tested with a sample api key which I have generated at https://developer.nytimes.com/signup

Programming Approach
* I have followed the protocol orieneted programming(POP) approach and object orieneted programming(OOP) approaches as well. e.g in article interactor created a protocol first in which defined set of rules further implementation class has followed those rules

Code understanding
* InteractorFactory: This is a singleton class and has screen and service interactores. Whenever the wireframe needed any interactor/service dependency, It is fulfilled by it. 
* ArticleViewController: This is a controller class having UI logic to display the most viewed articles. 
* ArticleWireframe: This is a router class which handles routing among the screen but as of now it just helps in preparing the most popular article screen. 
* ArticlePresenter: Responsible for fulfilling the requirement for ArticleViewController 
* NYTimesArticle: It is an entity, it just holds the NY times most viewed article information. It is being passed to view to display the article information on UI. 
* ArticleInteractor: Responsible for querying the api and providing the most viewed articles. As of now showing 7 days most viewed article. You can change to any reasonable(1|7|30) for info about the NY Times most viewed article api https://developer.nytimes.com/most_popular_api_v2.json 
* DownloadImageInteractor: This class is responsible for downloading the image for articles. This class has several method which are being used to cache the image and if required return the cached image. As of now disk caching is applied. You can use other option like inMemory. 
* NYTimesArticleService: Network class which take care the basic network request and process the received article response. 
* DownloadImageService: This is also a network class which download the article thumbnail image. 

Unit test cases
* I have also written the unit test and unit cases are written around the mock and spec
* I have mocked the Interactor and Services as well. These mock classes are providing the dummy data and performing unit test cases over it.
* Spec the article interactor and download image interactor
