//
//  NYTimesArticleService.swift
//  NYMostPopularArticle

//  Created by Rakesh Kumar Sharma on 24/07/19.
//  Copyright © 2019 Rakesh Kumar Sharma. All rights reserved.
//

import Foundation
//"https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=taB7ZYx9Nz74MEGCPxxL23qLY4wp81Nj"
//NY_Times_Api_Key"

private var kApiKey = "taB7ZYx9Nz74MEGCPxxL23qLY4wp81Nj"
// To create new api key go through this url https://developer.nytimes.com/signup
typealias QueryResult = ([NYTimesArticle]?, String?) -> Void

protocol NYTimesArticleService {
    func cancelPreviousSearch()
    func searchMostViewedArticle(duration: String, completion: @escaping QueryResult)
}

// Runs query data task, and stores results in array of photos
class NYTimesArticleServiceImpl: NYTimesArticleService {

    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    private var errorMessage: String?
    
    
    func cancelPreviousSearch() {
        dataTask?.cancel()
    }
    
    

    
    func searchMostViewedArticle(duration: String, completion: @escaping QueryResult) {
        if var urlComponents = URLComponents(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?") {
            urlComponents.query = "api-key=\(kApiKey)"
            print(urlComponents.url!)
            
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let error = error {
                    self.errorMessage = "DataTask error: " + error.localizedDescription + "\n"
                    completion(nil, self.errorMessage)
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 ||  response.statusCode == 202 {
                    self.updateSearchResults(data, completion: completion)
                    
                }
            }
            dataTask?.resume()
        }
    }
    
    private func updateSearchResults(_ data: Data, completion: @escaping QueryResult) {
        typealias JSONDictionary = [String: Any]
        var response: JSONDictionary?
        var articles: [NYTimesArticle] = []

        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage = "JSONSerialization error: \(parseError.localizedDescription)\n"
            completion(nil, errorMessage)
            return
        }
        
        guard let notNilDic = response,
            let popularArticles = notNilDic["results"] as? [Any] else {
            errorMessage = "Dictionary does not contain results key\n"
            completion(nil, errorMessage)
            return
        }
        
        for articleInfo in popularArticles {
            if let articleParam = articleInfo as? JSONDictionary,
                let id = articleParam["id"] as? Int,
                let title = articleParam["title"] as? String,
                let author = articleParam["byline"] as? String,
                let publishedDate = articleParam["published_date"] as? String,
                let source = articleParam["source"] as? String {
                var imagrURL: URL?

                if let metadata = articleParam["media"] as? [JSONDictionary],
                    let mediaMetadata = metadata.first as JSONDictionary?,
                    let imageMetadataInfo = mediaMetadata["media-metadata"] as? [JSONDictionary],
                    let imageMetadata = imageMetadataInfo.first as JSONDictionary?,
                    let url = imageMetadata["url"] as? String {
                    imagrURL = URL(string: url)
                }
                let article = NYTimesArticle(id: id,
                                      title: title,
                                      author: (!author.isEmpty) ? author : source,
                                      publishedDate: publishedDate,
                                      aritcleImageURL: imagrURL)
                articles.append(article)
            }
        }
        completion(articles, errorMessage)
    }
    
}
