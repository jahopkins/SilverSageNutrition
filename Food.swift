//
//  Food.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import Foundation
import FirebaseFirestore
import FirebaseCore




//represents food structure
struct Food: Identifiable, Codable {
    var id: String
    var name : String
    var sodium: Double
    var iron: Double
    var potassium: Double
    var magnesium: Double
    var lysine: Double
    var niacin: Double
    var vitaminB12: Double
    var  vitaminC: Double
    var folicAcid: Double
    var cholesterol: Double
    var calcium: Double
    var servings: Int
    var units: String
}

struct NutrientItem: Identifiable, Codable {
    var id: String
    var amount: Double
}

struct AllNutrients: Identifiable {
    var id: String
    var sodium: Double
    var iron: Double
    var potassium: Double
    var magnesium: Double
    var lysine: Double
    var niacin: Double
    var vitaminB12: Double
    var  vitaminC: Double
    var folicAcid: Double
    var cholesterol: Double
    var calcium: Double
    
}


struct FoodArray: Codable, Hashable {
    var foods: [Response]
}

struct Response: Codable, Hashable {
    let food_name: String
    let nf_sodium: Double
    let nf_potassium: Double
    let nf_cholesterol: Double
    let serving_qty: Int
    let serving_unit: String
    let id = UUID()
    let full_nutrients: [Micronutrients]
}

struct Micronutrients: Codable, Hashable {
    let attr_id: Int
    let value: Double
}

//struct Total: Codable, Hashable {
//    let numbers: Double
//}



