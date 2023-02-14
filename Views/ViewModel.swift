//
//  ViewModel.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseAuth

class ViewModel: ObservableObject {
    @Published var list = [Food] ()
    @Published var nutList = [NutrientItem] ()
//    @Published var nutList = ""
    @Published var nutrientList = [FoodArray] ()
    @Published var formattedDate = ""
//    let userID: String = Auth.auth().currentUser!.uid
    var userID = ""
    let date = Date()
    let df = DateFormatter()
    var dateUserId: String = ""
    @Published var creationStatus = ""
//    @Published var showError = false
//    @State var formatedID = ""
    func getFomattedDate() {
        df.dateStyle = DateFormatter.Style.medium
        df.timeStyle = DateFormatter.Style.none
        let newDate = df.string(from: date)
        self.formattedDate = newDate
    }
    
    
    func getUserId() {
        self.userID = Auth.auth().currentUser!.uid
        df.dateStyle = DateFormatter.Style.short
        df.timeStyle = DateFormatter.Style.none
        let newDate = df.string(from: date)
        self.dateUserId = newDate.replacingOccurrences(of: "/", with: "-") + self.userID
//        DispatchQueue.main.async {
//             self.dateUserId = newDate + self.userID
////            self.formatedID = self.dateUserId.replacingOccurrences(of: "/", with: "-")
//        }
//        print(dateUserId)
        print(newDate.replacingOccurrences(of: "/", with: "-") + self.userID)
        print(dateUserId)
//        print(dateUserId)
        
    }
    
    
    func getData() {
        // accessing user id
        // Get a reference to the database
        self.getUserId()
        print(dateUserId)
        if userID != nil {
            
            let db = Firestore.firestore()
            
            //        db.collection("foods").getDocuments { snapshot, error in
            db.collection("Users").document(dateUserId).collection("foods").getDocuments { snapshot, error in
                // check for errors
                if error == nil {
                    //no errors
                    
                    if let snapshot = snapshot {
                        print("made regular it")
                        //update list property in main thread
                        DispatchQueue.main.async {

                            self.list = snapshot.documents.map { d in
//                                d.data ( as : Food.self)
                                // crEATE food item for each document returned
                                
                                return Food(id: d.documentID,
                                            name: d["name"] as? String ?? "",
                                            sodium: d["sodium"] as? Double ?? 0.00000,
                                            iron: d["iron"] as? Double ?? 0.00000,
                                            potassium: d["potassium"] as? Double ?? 0.00000,
                                            magnesium: d["magnesium"] as? Double ?? 0.00000,
                                            lysine: d["lysine"] as? Double ?? 0.00000,
                                            niacin: d["niacin"] as? Double ?? 0.00000,
                                            vitaminB12: d["vitaminB12"] as? Double ?? 0.00000,
                                            vitaminC: d["vitaminC"] as? Double ?? 0.00000,
                                            folicAcid: d["folicAcid"] as? Double ?? 0.00000,
                                            cholesterol: d["cholesterol"] as? Double ?? 0.00000,
                                            calcium: d["calcium"] as? Double ?? 0.00000,
                                            servings: d["servings"] as? Int ?? 0,
                                            units: d["units"] as? String ?? "")
                                
                                
                            }
                            //                            print(self.list)
                        }
                        // get all documents and create foods
                        
                    }
                    else {
                        // handle error
                        
                    }
                }
            }
        }
//        else {
//            print("Add an Item to View a list")
//        }
    }
    
    //    func findTotals(list) {
    // create an empty interger
    //add each number to that interger
    //    }
    
    
    
    func addFood(foodName: String,
                 sodium: Double,
                 iron: Double,
                 potassium:Double,
                 magnesium: Double,
                 lysine: Double,
                 niacin: Double,
                 vitaminB12: Double,
                 vitaminC: Double,
                 folicAcid: Double,
                 cholesterol: Double,
                 calcium: Double,
                 servings: Int,
                 units: String
    ) {
        self.getUserId()
        let db = Firestore.firestore()
        // ask ansel how would i solve this problem without using the exclamation point
        // i used it without but i got an error
        // i was sstuck for a while because all thr
        // the if statement was pointless because the id wil never be nill, i
        // have to find a way to check if it is in the database or use merge
        //        if userID == nil {
        db.collection("Users").document(dateUserId).setData([:]) { err in
            if let err = err {
                print("Error writing document: \(err)")
                self.creationStatus = "Unable to find nutrient data for this \(foodName)"
            } else {
                print("Document successfully written!")
                self.creationStatus = "Succesfully added \(foodName)"
                print(self.creationStatus)
            }
        }
        //        }
        
        db.collection("Users").document(dateUserId).collection("foods").addDocument(data: ["name": foodName,
                                                                                        "sodium": sodium,
                                                                                        "iron": iron,
                                                                                        "potassium" : potassium,
                                                                                        "magnesium": magnesium,
                                                                                        "lysine": lysine,
                                                                                        "niacin": niacin,
                                                                                        "vitaminB12": vitaminB12,
                                                                                        "vitaminC": vitaminC,
                                                                                        "folicAcid": folicAcid,
                                                                                        "cholesterol": cholesterol,
                                                                                        "calcium": calcium,
                                                                                           "servings": servings,
                                                                                           "units": units,
                                                                                        
                                                                                       ]){ error in
            //        ref.setData(["name": foodName, "sodium": sodium]) { error in
            if error == nil {
                
                // no errors
                self.getData()
                print("retrieving Data")
            }
            else {
                
//                self.creationStatus = "Unable to find nutrient data for this \(foodName)"
            }
        }
    }
    
    // update firebase when we add a new item
    
        
    // trying this function to create seperate documents for each nutrient
    
    func addSupplement(nutrient: String, amount: Double) {
        self.getUserId()
        let db = Firestore.firestore()
        // ask ansel how would i solve this problem without using the exclamation point
        // i used it without but i got an error
        // i was sstuck for a while because all thr
        // the if statement was pointless because the id wil never be nill, i
        // have to find a way to check if it is in the database or use merge
        //        if userID == nil {
        db.collection("Users").document(dateUserId).setData([:]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        //        }
        
        db.collection("Users").document(dateUserId).collection("nutrients").document(nutrient).setData(["nutrient" : FieldValue.increment(Int64(amount))], merge: true) { error in
            //        ref.setData(["name": foodName, "sodium": sodium]) { error in
            if error == nil {
                // no errors
                self.getData()
                print("new function")
            }
            else {
                // handle error
            }
        }
        
        
        
    }
    
    func decreaseSupplements(nutrient: String, amount: Double) {
        
        // make an api call using the food name and serving
        // using the information from the api call to update decrease supplements
        self.getUserId()
        let db = Firestore.firestore()
        // ask ansel how would i solve this problem without using the exclamation point
        // i used it without but i got an error
        // i was sstuck for a while because all thr
        // the if statement was pointless because the id wil never be nill, i
        // have to find a way to check if it is in the database or use merge
        //        if userID == nil {
        db.collection("Users").document(dateUserId).setData([:]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        //        }
        
        db.collection("Users").document(dateUserId).collection("nutrients").document(nutrient).setData(["nutrient" : FieldValue.increment(Int64(-amount))], merge: true) { error in
            //        ref.setData(["name": foodName, "sodium": sodium]) { error in
            if error == nil {
                // no errors
                self.getData()
                print("new function")
            }
            else {
                // handle error
            }
        }
    }
    
    
    func deleteFood(foodID: String, foodName: String) {
        let db = Firestore.firestore()
        db.collection("Users").document(dateUserId).collection("foods").document(foodID).delete() { err in
            if let err = err {
                print("Error removing Food: \(err)")
            } else {
                print("Document succesfully removed")
            }
        }
        getData()
        
        
    }
    
    // function to gett all supplements that I changed
        
        
//        func addSupplements(sodium: Double, iron: Double, potassium: Double, magnesium: Double,
//                            lysine: Double,
//                            niacin: Double,
//                            vitaminB12: Double,
//                            vitaminC: Double,
//                            folicAcid: Double,
//                            cholesterol: Double,
//                            calcium: Double) {
//            self.getUserId()
//            // dateUserId
//
//            // replaced with dateUserId
//            //  db.collection("Users").document(userID).collection("nutrients").document("GVPjoRry0l8cmSHLgi3s").updateData([
//
//            let db = Firestore.firestore()
//            db.collection("Users").document(dateUserId).collection("nutrients").document(dateUserId).setData([
//                "Iron": FieldValue.increment(Int64(iron)),
//                "Potassium": FieldValue.increment(Int64(potassium)),
//                "Sodium": FieldValue.increment(Int64(sodium)),
//                "Magnesium": FieldValue.increment(Int64(magnesium)),
//                "Lysine": FieldValue.increment(Int64(lysine)),
//                "VitaminB12": FieldValue.increment(Int64(vitaminB12)),
//                "VitaminC": FieldValue.increment(Int64(vitaminC)),
//                "Folic Acid": FieldValue.increment(Int64(sodium)),
//                "Cholesterol": FieldValue.increment(Int64(sodium)),
//                "Calcium": FieldValue.increment(Int64(sodium)),
//                "Niacin": FieldValue.increment(Int64(niacin)),
//            ], merge: true)
//            { error in
//                //        ref.setData(["name": foodName, "sodium": sodium]) { error in
//                if error == nil {
//                    // no errors
//                    self.getNutrientTotals()
//                    print("retrieving Data")
//                }
//                else {
//                    // handle error
//                }
//            }
//
//
//        }
        
//        func findSodium() {
//
//            for item in self.list {
//                self.SodiumTot += item.sodium
//            }
//            print(self.SodiumTot)
//            print(self.list)
//
//
//        }
//        func findIron() {
//
//            for item in self.list {
//                self.IronTot += item.iron
//            }
//            print(self.IronTot)
//            print(self.list)
//
//
//        }
//        func findPot() {
//
//            for item in self.list {
//                self.PotTot += item.potassium
//            }
//            print(self.PotTot)
//            print(self.list)
//
//
//        }
    
    func getAllNutrients() {
        // accessing user id
        // Get a reference to the database
        self.getUserId()
        if userID != nil {
            
            let db = Firestore.firestore()
            
            //        db.collection("foods").getDocuments { snapshot, error in
            db.collection("Users").document(dateUserId).collection("nutrients").getDocuments { snapshot, error in
                // check for errors
                if error == nil {
                    //no errors
                    
                    if let snapshot = snapshot {
                        print("getting nutrients")
                        //update list property in main thread
                        DispatchQueue.main.async {

                            self.nutList = snapshot.documents.map { d in
//                                d.data ( as : Food.self)
                                // crEATE food item for each document returned
                                
                                return NutrientItem(id: d.documentID,
                                                    amount: d["nutrient"] as? Double ?? 0.000 )
                                
                            }
                            
                            //                            print(self.list)
                        }
                        // get all documents and create foods
                        
                    }
                    else {
                        // handle error
                        
                    }
                }
            }
        }
//        else {
//            print("Add an Item to View a list")
//        }
    }
        
    }
    
