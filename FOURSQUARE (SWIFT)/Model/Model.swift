//
//  Model.swift
//  FourSquare (SwiftUI)
//
//  Created by Yasir  on 12/19/21.
//

import Foundation

struct Initial:Hashable,Codable
{
    let results: [results]
    //let context: context
}

struct results:Hashable,Codable
{
    let fsq_id:String
    let categories: [categories]
    let chains: [chains]
    let distance: Float
    let name:String
    //let timezone:String
    let geocodes: geocodes
   // let location: location
   
}
struct categories:Hashable,Codable
{
    let id: Int
    let name:String
    let icon: icon
}
struct icon:Hashable,Codable
{
    let prefix:String
    let suffix:String
}
struct geocodes:Hashable,Codable
{
    let main: main
}
//struct location: Codable
//{
//    let country:String
//    let address:String
//    let dma:String
//    let locality:String
//    let postcode:String
//    let region:String
//
//
//}

struct main: Hashable,Codable
{
    let latitude: Double
    let longitude: Double
}
struct chains:Hashable,Codable
{
    
}


struct context : Hashable,Codable
{
    let geo_bounds: geo_bounds
}
struct geo_bounds:Hashable,Codable
{
    let circle: circle
}
struct circle:Hashable,Codable
{
    let center: center
    let radius:Int
}
struct center:Hashable,Codable
{
    let latitude:Float
    let longitude:Float
}
