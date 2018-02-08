//
//  Movie.swift
//  Flix
//
//  Created by Hussain Almajed on 2/7/18.
//  Copyright © 2018 Hussain Almajed. All rights reserved.
//

import Foundation
class Movie {
    var title: String
    var posterUrl: URL?
    var overview: String
    var date: String
   
    var backDropURL: URL?
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
         overview = dictionary["overview"] as! String ?? "No overview"
        date = dictionary["release_date"] as? String ?? "no date"
       let backDroppathString = (dictionary["backdrop_path"] as? String)!
        
        
        
        
        let PosterPathString = dictionary["poster_path"] as? String
        let baseURL = "https://image.tmdb.org/t/p/w500"
        
        if PosterPathString != nil{
            
             posterUrl = URL(string: baseURL + PosterPathString!)!
            
        }
        if backDroppathString != nil{
            
            backDropURL = URL(string: baseURL+backDroppathString)
        }
        
        // Set the rest of the properties
    }
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}
