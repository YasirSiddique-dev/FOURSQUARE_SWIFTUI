//
//  NearbyPlacesScreen.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/20/21.
//

import SwiftUI

struct NearbyPlacesScreen: View {
    
    @StateObject var apiManager = APIManager()
    @State var nearbyPlaces = [results]()
    var placeDetail: results!
    @State var isLoading:Bool = false
    var body: some View {
        //main list
        List{
            
            if isLoading{
                ProgressView()
            }
            else
            {
                if  nearbyPlaces.isEmpty
                {
                    Text("No Data to Show")
                }
                else
                {
                    //iterating data
                    ForEach(nearbyPlaces, id: \.self){ data in
                        //embed in HStack
                        HStack{
                            //assigning data to variables
                            let name = data.name
                            let category = data.categories.first?.name
                            let prefix = data.categories.first?.icon.prefix
                            let suffix = data.categories.first?.icon.suffix
                            let size = "bg_88"
                            let imgUrl = prefix!+size+suffix!
                            
                            //adding navigation link to list items
                            NavigationLink(destination: DetailPlacesScreen(placeDetail:data))
                            {
                                // MARK: setup data in list item
                                 
                                //load and set image
                                AsyncImage(url: URL(string: imgUrl))
                                    .frame(width: 88, height: 88)
                                //embed in vstack
                                VStack{
                                    Text("\(name)")
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 14))
                                        .padding(.bottom,3)
                                    Text(category!)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.system(size: 16))
                                }.padding()
                            } //navigation link body
                            
                        } //main HStack body
                    
                    } //loop body
                }
            }
     
            
        } //lis body
        .onAppear {
            isLoading = true
            apiManager.callNearbyPlacesApi(lat: placeDetail.geocodes.main.latitude, long: placeDetail.geocodes.main.longitude) { (data) in
                switch data{
                case .success(let listOf):
                    self.nearbyPlaces = listOf.results
                case .failure(let error):
                    print("Error Processing JSON Data \(error)")
                } //switch body
            isLoading = false
            } //API Function Body
        
        } //on appear function
    
    } //main body

} //main struct

struct NearbyPlacesScreen_Previews: PreviewProvider {
    static var previews: some View {
        NearbyPlacesScreen()
    }
}
