//
//  DashboardScreen.swift
//  FOURSQUARE (SWIFT)
//
//  Created by Yasir  on 12/24/21.
//

import SwiftUI

struct DashboardScreen: View {
    @State var searchText:String = ""
    var body: some View {
        NavigationView{
            GeometryReader{ header in
                VStack{
                    ZStack{
                        Image("background5")
                            .resizable()
                            .scaledToFill()
                            .frame(width: .infinity, height: header.size.height/3.3, alignment: .center)
                            .clipped()
                        Image("foursquare_logo")
                            .resizable()
                            .frame(minWidth: 50, idealWidth: 150, maxWidth: 250, minHeight: 40, idealHeight: 50, maxHeight: 70, alignment: .center)
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color.white)
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search ..", text: $searchText)
                            NavigationLink(destination: PlacesListScreen(userQuery: searchText.replacingOccurrences(of: " ", with: "%20"))) {
                                Text("Search")
                            }
                            }
                            .foregroundColor(Color.gray)
                            .padding(.leading, 13)
                            .padding(.trailing,10)
                          }
                            .frame(height: 35)
                            .cornerRadius(13)
                            .padding(10)
                    
                    GeometryReader{bodypart in
                        VStack{
                            HStack{
                                //breakfast
                                NavigationLink(destination: PlacesListScreen(userQuery: breakFastQuery)) {
                                    VStack{
                                      Image("breakfast_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("BreakFast")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                                Divider()
                                
                                //lunch
                                
                                NavigationLink(destination: PlacesListScreen(userQuery: lunchQuery)) {
                                    VStack{
                                      Image("lunch_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("Lunch")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                                Divider()
                                //dinner button
                                NavigationLink(destination: PlacesListScreen(userQuery: dinnerQuery)) {
                                    VStack{
                                      Image("dinner_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("Dinner")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                            }.frame(width: bodypart.size.width, height: bodypart.size.height/2, alignment: .center)
                            
                            Divider()
                            
                            HStack{
                                NavigationLink(destination: PlacesListScreen(userQuery: coffeeAndTeaQuery)) {
                                    VStack{
                                      Image("coffee_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("Coffee & Tea")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                                Divider()
                                
                                NavigationLink(destination: PlacesListScreen(userQuery: nightLifeQuery)) {
                                    VStack{
                                      Image("nightlife_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("NightLife")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                                Divider()
                                
                                NavigationLink(destination: PlacesListScreen(userQuery: things)) {
                                    VStack{
                                      Image("thingstodo_icon")
                                            .resizable()
                                            .frame(minWidth: 40, idealWidth: 50, maxWidth: 60, minHeight: 40, idealHeight: 50, maxHeight: 60, alignment: .center)
                                        Text("Things To Do")
                                            .foregroundColor(Color.gray)
                                    }.frame(minWidth: 0,maxWidth: .infinity ,maxHeight: .infinity)
                                }
                                
                            }.frame(width: bodypart.size.width, height: bodypart.size.height/2, alignment: .center)
                        }.frame(width: bodypart.size.width, height: bodypart.size.height, alignment: .center)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.914))
                            .clipped()
                    }
                    
                    
                }.background(Color.gray.opacity(0.2))
                
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
.previewInterfaceOrientation(.portrait)
    }
}
