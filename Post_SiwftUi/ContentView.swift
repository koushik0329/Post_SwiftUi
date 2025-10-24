//
//  ContentView.swift
//  Post_SiwftUi
//
//  Created by Koushik Reddy Kambham on 10/14/25.
//

import SwiftUI

struct ContentView: View {
    
    var postViewModel : PostNewsModel
    @State var path = NavigationPath()
    
    init(postViewModel : PostNewsModel){
        self.postViewModel = postViewModel
    }
    
    var body: some View {
        NavigationStack(path : $path){
            VStack {
                Text("Person")
                    .font(.title)
                
                List(postViewModel.posts, id: \.id) { post in
                    Button {
                        path.append(post)
                    } label: {
                        RowView(id: post.id, title: post.title, description: post.description
                        )
                    }
                }
                .navigationDestination(for: Person.self) { post in
                    DetailsView(description: post.description)
                }
            }
            .task {
                do {
                    try await postViewModel.loadPost()
                } catch {
                    print("Failed to load news: \(error)")
                }
            }
        }
    }
}

struct RowView: View {
    
    var id: Int?
    var title: String?
    var description: String?
    
    init(id: Int?, title: String?, description: String?){
        self.id = id
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 20){
                Text("\(id ?? 0)")
                    .font(.title2)
                    .foregroundColor(.gray)
                
                Text(title ?? "")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            
            Text(description ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct DetailsView : View {
    var description: String?
    
    var body: some View {
        VStack {
            Text("Description")
                .font(.title)
            
            Text(description ?? "")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
        }
    }
}

#Preview {
    let viewModel = PostNewsModel(networkObj: NetworkManager.shared)
    
    ContentView(postViewModel: viewModel)
}
