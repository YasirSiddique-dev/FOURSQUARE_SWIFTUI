//
//  PlaceListScreen.swift
//  FOURSQUARE (SWIFT)
//
//  Created by Yasir  on 12/25/21.
//

import SwiftUI

struct PlacesListScreen: View {
    var userQuery:String!
    @StateObject var apiManager = APIManager()
    @State var fetchedyPlaces = [results]()
    @State var search = ""
    var body: some View {
        VStack{
            List{
                ForEach(searchResults,id:\.self){ data in
                    let name = data.name
                    let category = data.categories.first?.name
                    let prefix = data.categories.first?.icon.prefix
                    let suffix = data.categories.first?.icon.suffix
                    let size = "bg_100"
                    let imgUrl = prefix!+size+suffix!
                    
                    NavigationLink(destination: DetailPlacesScreen(placeDetail:data)) {
                        HStack{
                            AsyncImage(url: URL(string: imgUrl))
                                .frame(width: 100, height: 100)
                            
                            VStack
                            {
                                Text("\(name)")
                                    .bold()
                                    .frame( maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom,3)
                                Text(category!)
                                    .frame( maxWidth: .infinity, alignment: .leading)
                            }
                        }.padding()
                    }
                }
                
            }.searchable(text: $search,placement: .navigationBarDrawer(displayMode: .always))
                .navigationBarTitle("Nearby Places").font(.subheadline)
            .onAppear {
                apiManager.fetchPlaces(query: userQuery) { (data) in
                    switch data
                    {
                    case .success(let listOf):
                        self.fetchedyPlaces = listOf.results
                    case .failure(let error):
                        print("Error Processing JSON Data \(error)")
                    }
                }
            }
        }
    }
    var searchResults : [results]
    {
        if search.isEmpty
        {
            return fetchedyPlaces
        }
        else
        {
            return fetchedyPlaces.filter{$0.name.lowercased().contains(search.lowercased())}
        }
    }
    
   
}

struct PlaceListScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListScreen()
    }
}
