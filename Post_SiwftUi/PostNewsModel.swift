//
//  PostNewsModel.swift
//  Post_SiwftUi
//
//  Created by Koushik Reddy Kambham on 10/14/25.
//

import UIKit

class PostNewsModel: ObservableObject {
    
    @Published var posts : [Person] = []
    
    let networkObj : Network
    
    init(networkObj : Network) {
        self.networkObj = networkObj
    }
    
    func loadPost() async throws{
        do{
            let personList: PersonList = try await networkObj.fetchData(from: Server.endPoint.rawValue)
            posts = personList.posts
        }
        catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
