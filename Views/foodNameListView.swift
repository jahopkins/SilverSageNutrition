//
//  foodNameListView.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import SwiftUI

struct foodNameListView: View {
    let customColor = Gradient(colors: [Color("ColorSS"), Color("Colorss1")])
    @ObservedObject var model = ViewModel()
    @ObservedObject var api = apiCall()
    @State var foodInfo = ""
    
    
    var body: some View {
        
        
        NavigationView {
           
            
            ZStack {
                Color("PrimaryColor").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20){
                    
                    Section {
                        NavigationLink(destination: GetNutrientsView()
                            .navigationTitle("AddFood")
                            .background(Color(.white))
                                       
                        )
                        {
                            
                            Text("Add New Food")
                            
                            
                            
                        }
                        List (model.list) { item in
                            VStack(alignment: .leading) {
                                Text("\(item.name)").font(.title)
                                    .foregroundColor(Color("SecondaryColor"))
                                
                                Text("Servings: \(item.servings) \(item.units)").font(.headline)
                                    .foregroundColor(Color("SecondaryColor"))
//                                NavigationLink(destination: SingleFoodNutrientView()
//                                    .navigationTitle("Nutrients for \(item.name)")
//                                )
//                                {
//                                    
//                                    Text("View nutrient values for \(item.name)")
//                                        .foregroundColor(Color("SecondaryColor2"))
//                                        .font(.footnote)
//                                }
                                
                                .listRowInsets(.init(top:0, leading: 40, bottom: 0, trailing: 40))
                            }
                            Button("Delete", action: {
                                
                                foodInfo = String(item.servings) + " " + item.name
                                
                                print(foodInfo)
                                api.fetchData(userMeal: foodInfo) { (FoodArray)in
                                    for foood in [FoodArray] {
                        
                                        model.decreaseSupplements(nutrient: "Sodium", amount: foood.foods[0].nf_sodium)
                                        model.decreaseSupplements(nutrient: "Iron", amount: foood.foods[0].full_nutrients[0].value)
                                        model.decreaseSupplements(nutrient: "Potassium", amount: foood.foods[0].nf_potassium)
                                        model.decreaseSupplements(nutrient: "Magnesium", amount: foood.foods[0].full_nutrients[21].value)
                                        model.decreaseSupplements(nutrient: "Lysine", amount: foood.foods[0].full_nutrients[63].value)
                                        model.decreaseSupplements(nutrient: "Niacin", amount: foood.foods[0].full_nutrients[47].value)
                                        model.decreaseSupplements(nutrient: "Vitamin B12", amount: foood.foods[0].full_nutrients[51].value)
                                        model.decreaseSupplements(nutrient: "Vitamin C", amount: foood.foods[0].full_nutrients[45].value)
                                        model.decreaseSupplements(nutrient: "Folic Acid", amount: foood.foods[0].full_nutrients[55].value)
                                        model.decreaseSupplements(nutrient: "Cholesterol", amount: foood.foods[0].nf_cholesterol)
                                        model.decreaseSupplements(nutrient: "Calcium", amount: foood.foods[0].full_nutrients[19].value)
                                  }
                                }
                                model.deleteFood(foodID: item.id, foodName: item.name)
                            })
                            .foregroundColor(.red)
                            .font(.footnote)
                            
                            
                            
                        }
                        .background(Color("PrimaryColor"))
                        .scrollContentBackground(.hidden)
                    }
                header: {
                    Text("\(model.formattedDate)")
                }
                    
                  
                }
                //            .onAppear(perform: { model.getData() })
                //            .onAppear(perform: { model.getFomattedDate()})
                .navigationTitle("Tracked Foods")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            .onAppear(perform: { model.getData() })
            .onAppear(perform: { model.getFomattedDate()})
        }
        
                        
       }
        }

struct foodNameListView_Previews: PreviewProvider {
    static var previews: some View {
        foodNameListView()
    }
}
