//
//  PlaceImagesScreen.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/20/21.
//

import SwiftUI

struct PlaceImagesScreen: View {
    
    @StateObject var apiManager = APIManager()
    @State var imagesData = [images]()
    var placeDetail: results!
    @State var isLoading:Bool = false
    //defining the coloumn of grid
    let columns = [
        GridItem(.adaptive(minimum: 190),spacing: 2)
    ]
    
    var body: some View {
        //embedding view to scroll view
        ScrollView{
            //implementing LazyVgrid
            LazyVGrid(columns: columns) {
                //iterating the data
                
                if isLoading{
                    ProgressView()
                }
                else{
                    if imagesData.isEmpty
                    {
                        Text("No Data To Show")
                    }
                    else{
                        ForEach(Array(imagesData.enumerated()),id: \.offset){  index,data in
                        
                            NavigationLink(destination: ImagePagingScreen(imgArray: imagesData, count: imagesData.count, indexOfImage: index)) {
                                //assiging the data to varibales
                            
                                let prefix = data.prefix
                                let size = "190x190"
                                let suffix = data.suffix
                                let imgUrl = prefix+size+suffix
                            
                                //load and display images in grid items
                                AsyncImage(url: URL(string: imgUrl))
                                    .frame(width: 190, height: 190)
                            
                            }
                          
                    }//loop body
                    }
                }
                
             
            }//grid body

        }.onAppear {
            isLoading = true
            apiManager.callImagesApi(fsq_id: placeDetail.fsq_id) { (images) in
                self.imagesData = images
                isLoading = false
        } //api function body
        
    } //on appear body

    } //body
}
struct PlaceImagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlaceImagesScreen()
    }
}

