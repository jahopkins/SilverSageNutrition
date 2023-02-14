//
//  GetNutrients.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import SwiftUI

struct GetNutrientsView: View {
//    @ObservedObject var model = ViewModel()
    @State var newFoodAdded = ""
    @State var quantity = ""
    @State var itemConsumed = ""
    @State var api = apiCall()
    @ObservedObject var model = ViewModel()
    @State private var showFoodConfirmation = false
//    @State private var newFoodAdded = ""
   
    
    var body: some View {
        
        VStack ()
        {
            Spacer()
            Text("Enter an item to track daily nutrients").font(.subheadline)
            
            TextField("Food name:", text: $newFoodAdded)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.blue)
//                .textFieldStyle(.roundedBorder)
                .font(.headline)
            TextField("Serving size:", text: $quantity)
                .padding()
                .background(Color.gray.opacity(0.3).cornerRadius(10))
                .foregroundColor(.blue)
                .frame(width: 150)
           

            Button {
                itemConsumed = quantity + " " + newFoodAdded
                print(itemConsumed)
                // add meal
               
                api.fetchData(userMeal: itemConsumed) { (FoodArray)in
                    for foood in [FoodArray] {
//                        print(foood.foods[0].food_name)
                        model.addFood(foodName: foood.foods[0].food_name,
                                      sodium: foood.foods[0].nf_sodium,
                                      iron: foood.foods[0].full_nutrients[20].value,
                                      potassium: foood.foods[0].nf_potassium,
                                      magnesium: foood.foods[0].full_nutrients[21].value,
                                      lysine: foood.foods[0].full_nutrients[63].value,
                                      niacin: foood.foods[0].full_nutrients[47].value,
                                      vitaminB12: foood.foods[0].full_nutrients[51].value,
                                      vitaminC: foood.foods[0].full_nutrients[45].value,
                                      folicAcid: foood.foods[0].full_nutrients[55].value,
                                      cholesterol: foood.foods[0].nf_cholesterol,
                                      calcium: foood.foods[0].full_nutrients[19].value,
                                      servings: foood.foods[0].serving_qty,
                                      units: foood.foods[0].serving_unit
                        )
                        model.addSupplement(nutrient: "Sodium", amount: foood.foods[0].nf_sodium)
                        model.addSupplement(nutrient: "Iron", amount: foood.foods[0].full_nutrients[0].value)
                        model.addSupplement(nutrient: "Potassium", amount: foood.foods[0].nf_potassium)
                        model.addSupplement(nutrient: "Magnesium", amount: foood.foods[0].full_nutrients[21].value)
                        model.addSupplement(nutrient: "Lysine", amount: foood.foods[0].full_nutrients[63].value)
                        model.addSupplement(nutrient: "Niacin", amount: foood.foods[0].full_nutrients[47].value)
                        model.addSupplement(nutrient: "Vitamin B12", amount: foood.foods[0].full_nutrients[51].value)
                        model.addSupplement(nutrient: "Vitamin C", amount: foood.foods[0].full_nutrients[45].value)
                        model.addSupplement(nutrient: "Folic Acid", amount: foood.foods[0].full_nutrients[55].value)
                        model.addSupplement(nutrient: "Cholesterol", amount: foood.foods[0].nf_cholesterol)
                        model.addSupplement(nutrient: "Calcium", amount: foood.foods[0].full_nutrients[19].value)
                        
                        
                        // commenting out to try new functions
                        
//                        model.addSupplements(sodium: foood.foods[0].nf_sodium,
//                                             iron: foood.foods[0].full_nutrients[0].value,
//                                             potassium: foood.foods[0].nf_potassium,
//                                             magnesium: foood.foods[0].full_nutrients[21].value,
//                                             lysine: foood.foods[0].full_nutrients[63].value,
//                                             niacin: foood.foods[0].full_nutrients[47].value,
//                                             vitaminB12: foood.foods[0].full_nutrients[51].value,
//                                             vitaminC: foood.foods[0].full_nutrients[45].value,
//                                             folicAcid: foood.foods[0].full_nutrients[55].value,
//                                             cholesterol: foood.foods[0].nf_cholesterol,
//                                             calcium: foood.foods[0].full_nutrients[19].value
//                        )
                        
                       
                        showFoodConfirmation.toggle()
                        newFoodAdded = ""
                        
                        
                        
                    }
                    
                }
                
            }
            
        label: {
                Text("Add Food".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.cornerRadius(10))
                    .foregroundColor(.white)
                    .font(.headline)
            }
//            if model.showError == true {
        .alert(api.apiStatus, isPresented: $showFoodConfirmation) {
                    // add buttons here
                }
                
//            }
//            else {
//                .alert("Successfully Added", isPresented: $showFoodConfirmation ) {
//                    // add buttons here
//                }
//
//            }
        
//        message: {
//            Text("\(newFoodAdded) was successfully added")
//        }
            
            
            
            Spacer()
            }
        
        .padding()
//        Button {
//            model.getData()
//        }
//    label: {
//        Text("Add to data")
//    }

//            ApiResultView()
//                .environmentObject(model)
        }
    
    }

struct GetNutrients_Previews: PreviewProvider {
    static var previews: some View {
        GetNutrientsView()
    }
}
