//
//  Charts.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import SwiftUI
import Charts


struct Recommendation: Identifiable {
    var nutrient: String
    var count: Double
    var id = UUID ()
}

var data: [Recommendation] = [
    .init(nutrient: "Calcium", count: 1000),
    .init(nutrient: "Vitamin B12", count: 2.4),
    .init(nutrient: "Vitamin C", count: 75),
    .init(nutrient: "Iron", count: 18),
    .init(nutrient: "Magnesium", count: 310),
    .init(nutrient: "Niacon", count: 14),
    .init(nutrient: "Potassium", count: 260),
    .init(nutrient: "Sodium", count: 1500)
    ]

struct Charts: View {
    //    let comparisonValues = [
    //        Recommendation(amount: 1000, nutrientType: .calcium(.female)),
    //        Recommendation(amount: 2.4, nutrientType: .vitaminb12(.female)),
    //        Recommendation(amount: 75, nutrientType: .vitaminc(.female)),
    //        Recommendation(amount: 18, nutrientType: .ion(.female)),
    //        Recommendation(amount: 310, nutrientType: .magnesium(.female)),
    //        Recommendation(amount: 14, nutrientType: .niacin(.female)),
    //        Recommendation(amount: 260, nutrientType: .potassium(.female)),
    //        Recommendation(amount: 1500, nutrientType: .sodium(.female))
    //    ]
    var body: some View {
        Chart {
            ForEach(data) { shape in
                BarMark(x: .value("Nutrient", shape.nutrient),
                        y: .value("Value", shape.count)
                )
            }
        }
    }
}


struct Charts_Previews: PreviewProvider {
    static var previews: some View {
        Charts()
    }
}
