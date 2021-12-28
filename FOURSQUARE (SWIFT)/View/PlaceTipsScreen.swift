//
//  PlaceTipsScreen.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/20/21.
//

import SwiftUI

struct PlaceTipsScreen: View {
    
    @StateObject var apiManager = APIManager()
    @State var tipsData = [Tips]()
    var placeDetail: results!
    @State var isLoading:Bool = false
    var body: some View {
        List{
            
            if isLoading{
                ProgressView()
            }
            else
            {
                if tipsData.isEmpty
                {
                    Text("No Data to Show")
                }
                else{
                    //iterating the data
                    ForEach(tipsData,id: \.self){ tips in
                        //assigning data to variables
                        let date = tips.created_at
                        let text = tips.text
                        //placing data in list item
                        VStack{
                            Text(text)
                                .font(.system(size: 14))
                        }.padding()
                }
                }
            }
        
        } //tips list
        .onAppear {
            isLoading = true
            apiManager.callTipsApi(fsq_id: placeDetail.fsq_id) { (tips) in
                self.tipsData = tips
                isLoading = false
            } //api calling function
           
        } //on-appear body
    
    } //main view

} //main struct

struct PlaceTipsScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlaceTipsScreen()
    }
}
