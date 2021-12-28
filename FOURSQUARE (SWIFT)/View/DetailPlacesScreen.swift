//
//  DetailPlacesScreen.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/20/21.
//

import SwiftUI

struct DetailPlacesScreen: View {
    
   var placeDetail: results!
   @State private var screenTag = 0
    @StateObject var apiManager = APIManager()
    @State var imgUrl:String!
    
    let gradient = LinearGradient(
            gradient: Gradient(stops: [
                .init(color: .white, location: 0),
                .init(color: .clear, location: 0.8)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
    var body: some View {
        
        //main geometry reader
        GeometryReader{ header in
            //Main VStack
            VStack{
                ZStack(alignment:.bottomLeading){
                    //background Image
                //let defaultImage = UIImage(named: "background3")
                    if imgUrl == nil
                    {
                        Image("background3" )
                            .resizable()
                            .blur(radius: 5)
                            .ignoresSafeArea()
                            .scaledToFill()
                            .frame(width: .infinity, height: header.size.height/3.5)
                            .clipped()
                            .mask(gradient)
                    }
                    else
                    {
                        Image(uiImage: imgUrl.load())
                            .resizable()
                            .ignoresSafeArea()
                            .scaledToFill()
                            .frame(width: .infinity, height: header.size.height/3.5)
                            .clipped()
                            .mask(gradient)
                    
                    }
                    VStack{
                        Text(placeDetail.name)
                            .bold()
                            .frame( maxWidth: .infinity,  alignment: .leading)
                            .padding(.leading,10)
                        Text(placeDetail.categories.first!.name)
                            .frame( maxWidth: .infinity,  alignment: .leading)
                            .padding(.leading,10)
                    Picker("", selection: $screenTag) {
                        Text("Images").tag(0)
                        Text("Tips").tag(1)
                        Text("Nearby Places").tag(2)
                    }
                    .pickerStyle(.segmented)
                    }
                
                }
               
                //implementing Picked ar segmented control
                            
                              
                              //Switch statement for segmented controls
                             switch screenTag
                              {
                             case 0:
                                 PlaceImagesScreen(placeDetail:placeDetail)
                
                           case 1:
                                 PlaceTipsScreen(placeDetail:placeDetail)
                             case 2:
                                 NearbyPlacesScreen(placeDetail:placeDetail)
                             default:
                                 Text("Nothing to show")
                             }

        
                   
             
            
            }.onAppear(perform: {
                     
                apiManager.callImagesApi(fsq_id: placeDetail.fsq_id) { (data) in
                    if data.isEmpty
                    {
                        print("No image")
                    }
                    else
                    {
                        let prefix = data[1].prefix
                        let suffix = data[1].suffix
                        let size = "original"
                        imgUrl = prefix + size + suffix
                
                    }
                    
                }
            })
            .navigationBarTitle(placeDetail.categories.first!.name,displayMode: .inline).font(.title3) //modifying navigation bar title
                
        }//main geometry reader
    
    }
        
   
}


struct DetailPlacesScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailPlacesScreen()
    }
}



extension String{
    func load() -> UIImage{
        do{
            guard let url = URL(string: self) else{
               return UIImage()
            }
            
            let data:Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        }
        catch{
            
        }
        
        return UIImage()
    }
}
