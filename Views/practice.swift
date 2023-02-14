//
//  practice.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import SwiftUI

struct practice: View {
    @ObservedObject var model = ViewModel()
    
    
    var body: some View {
        NavigationView {
//            Text("Tracked Nutrients")
//                .navigationBarTitleDisplayMode(.inline)
            ZStack {
                Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            
        
                VStack{
                    Section {
                        NavigationLink(destination: Charts()
//                            .navigationTitle("Recommended Daily Values")
                                       //                        .onAppear {
                                       //                        model.getData()
                                       //                    }
                        )
                        {
                            //                        Image(systemName: "Plus")
                            Text("Compare to Daily Recommended Values")
                                .foregroundColor(Color("SecondaryColor2"))
                                .font(.footnote)
                            
                            
                            
                            
                        }
                        
                        List (model.nutList) { item in
                            VStack(alignment: .leading) {
                                Text(item.id).font(.title)
                                    .foregroundColor(Color("SecondaryColor"))
                                let formattedAmount =  String(format:"%.2f", item.amount)
                                HStack {
                                    Text("\(formattedAmount)").font(.headline)
                                        .foregroundColor(Color("SecondaryColor"))
                                    if item.id == "Lysine" {
                                        Text("g").font(.subheadline)
                                    }
                                    else if (item.id == "Folic Acid" || item.id == "Vitamin B12") {
                                        Text("Âµg").font(.subheadline)
                                    }
                                    else if (item.id == "Vitamin D") {
                                        Text("IU").font(.subheadline)
                                    }
                                    else {
                                        Text("mg").font(.subheadline)
                                    }
                                }
                                
                               
                                
                                
                                
                            }
                            
                            
                            
                            
                            
                        }
                        .background(Color("PrimaryColor"))
                        .scrollContentBackground(.hidden)
                    }
                header: {
                    Text("\(model.formattedDate)")
                    
                }
                }
            
                
            

                .navigationTitle("Tracked Nutrients")
                .navigationBarTitleDisplayMode(.inline)
                }
          
        }
            .onAppear(perform: { model.getAllNutrients() })
            .onAppear {
                model.getFomattedDate()
        
    }
    }
}


struct practice_Previews: PreviewProvider {
    static var previews: some View {
        practice()
    }
}
