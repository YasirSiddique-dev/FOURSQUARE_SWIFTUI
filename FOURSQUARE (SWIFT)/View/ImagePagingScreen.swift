//
//  ImagePagingScreen.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/22/21.
//

import SwiftUI

struct ImagePagingScreen: View {
    var imgArray = [images]()
    var count:Int!
    @State var indexOfImage:Int!
    @State var backgroundOffset:CGFloat = 0

    var body: some View {
        GeometryReader{g in
            
                HStack(spacing:0)
                {
                    ForEach(imgArray,id:\.self){ abc in
                        ZStack{
                        
                            let prefix = imgArray[indexOfImage].prefix
                            let size = "420x420"
                            let suffix = imgArray[indexOfImage].suffix
                            let imgUrl = prefix+size+suffix
                            //load and display images in grid items
                            AsyncImage(url: URL(string: imgUrl))
                                .frame(width: g.size.width, height: g.size.height)

                        } .frame(width: g.size.width, height: g.size.height)

                    }
                 
                }
                .animation(.default)
            
            

            
        }.gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width > 100
                    {
                        if indexOfImage > 0
                        {
                            self.indexOfImage = indexOfImage - 1
                        }
                    
                    }
                    else if value.translation.width < -100
                    {
                        if indexOfImage < count - 1
                        {
                            self.indexOfImage = indexOfImage + 1
                        }
                    }
                })
        )
    }
}

struct ImagePagingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ImagePagingScreen()
    }
}
