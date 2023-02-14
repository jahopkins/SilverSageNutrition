//
//  ContentView.swift
//  Silver Sage Nutrition
//
//  Created by Jacqueline Hopkins on 2/13/23.
//


import SwiftUI
// tells swift we want to use all functionailty from SwiftUI framework
import Firebase
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            //Success
            DispatchQueue.main.async {
                self?.signedIn = true
//                ViewModel().getData()
            }
        }
            
    }
        func signUp(email: String, password: String) {
            auth.createUser(withEmail: email, password: password) { [weak self] result, error in
                guard result != nil, error == nil else {
                    return
                }
                //Success
                DispatchQueue.main.async {
                    self?.signedIn = true
                }
                
            }
            
        }
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    }

    
    
    // creates a new struct called ContentView and confirms to view protocol
    // view comes from swiftui
    // view is the basic protocol that must be adopted by anything drawn on screen
    
    
struct ContentView: View {
    //        @State var email = ""
    //        @State var password = ""
    @State var newFoodAdded = ""
    @State var api = apiCall()
    //    @State var model = ViewModel()
    @ObservedObject var model = ViewModel()

    @EnvironmentObject var appViewModell: AppViewModel
    @State private var showingFoods = false
    var body: some View {
        //
        
            NavigationView {
               
               
                
                //whenever pusblished var changes, ui view changes because its binding
                if appViewModell.signedIn {
                    TabView {
                        practice()
                            .tabItem {
                                Label("Nutrients", systemImage: "face.smiling.inverse")
                            }
                        foodNameListView()
                            .tabItem{
                                Label("Food", systemImage: "fork.knife")
                            }
                        accountView()
                            .tabItem{
                                Label("Account", systemImage: "person")
                            }
                            
                        
                        
                        
                        
                        
                        //                  ListOfFoodsView()
                        //                Text("You are signed in")
                        //                model.getData()
                        //                List (model.list) { item in
                        //                    Text(item.name)
                        // commenting out
                        //                VStack(spacing: 5) {
                        ////                    ListOfFoodsView()
                        //                    Button(action: {
                        //                        model.getData()
                        //                        NavigationLink(destination: ListOfFoodsView())
                        //                    }, label: {
                        //                        Text("View Nutrients")
                        //                    })
                        
                        //                    Button(action: {
                        //                        model.getData()
                        //                    }, label: {
                        //                        Text("View Nutrients")
                        //                    }
                        //                    )
                        //
                        //                    List (model.list) { item in
                        //                        Text(item.name)
                        //                    }
                        //                    TextField("Add food", text: $newFoodAdded)
                        //                    Button {
                        //                        // add meal
                        //                        api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
                        //                            for foood in [FoodArray] {
                        //                                print(foood.foods[0].food_name)
                        //                                model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
                        //
                        //                                newFoodAdded = ""
                        //
                        //                            }
                        //                        }
                        //                    } label: {
                        //                        Text("Save meal")
                        //                    }
                        // commented out
                        //                    Button(action: {
                        //                        appViewModell.signOut()
                        //                    }, label: {
                        //                        Text("Sign Out")
                        //                            .foregroundColor(Color.blue)
                        //                    })
                        //
                        //                }
                        // commented out
                        
                    }
                    .tint(Color("SecondaryColor2"))
                }
                else {
                    WelcomeView()
//                    SignInView()
                }
            
            
        }
        .onAppear{
            appViewModell.signedIn = appViewModell.isSignedIn
            
        }
    
    }
//    init () {
//        model.getData()
//    }
}

        //         defines a new computed proprety called body
        //         'some view' type means it will return something that confomrs to the view protocol, which is the layout
        //         view protocol has one requirement: 'body' property that returns some view
        //         contnetview_previews struct conforms to the previewprovider protocol
        //         it isnt part of code, it only previews the ui
struct WelcomeView: View {
//    let logo = Image("Logo")
    var body: some View {
        ZStack {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                NavigationLink(
                    destination: SignInView(),
                    label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color("SecondaryColor"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .padding(.vertical)
                    }
                        )
                HStack {
                    Text("Don't have an account?")
//                        .fontWeight(.bold)
                        .foregroundColor(Color("SecondaryColor"))
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(Color("SecondaryColor2"))
                        })
                }
                //
            }
                    .padding()
            
            
        }
    }
}
        
struct SignInView: View {
           
    @State var email = ""
    @State var password = ""
//            @State var newFoodAdded = ""
//            @State var api = apiCall()
//            //    @State var model = ViewModel()
//            @ObservedObject var model = ViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
//                List (model.list) { item in
//                    Text(item.name)
//                }
        //        Button {
        //            // add meal
        //            api.fetchData(userMeal: newFoodAdded) { (FoodArray)in
        //                for foood in [FoodArray] {
        //                    print(foood.foods[0].food_name)
        //                    model.addFood(foodName: foood.foods[0].food_name, sodium: foood.foods[0].nf_sodium)
        //
        //                    newFoodAdded = ""
        //
        //                }
        //            }
        //        } label: {
        //            Text("Save meal")
        //        }
//                Divider()
        ZStack {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                //                Spacer()
                // Image("logo")
                VStack {
                    TextField("Enail Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
//                        .cornerRadius(50.0)
//                        .padding(.vertical)
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
//                        .cornerRadius(50.0)
//                        .padding(.vertical)
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        appViewModel.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color("SecondaryColor2"))
                            .cornerRadius(50)
                    })
                    
                    //                    NavigationLink("Create Account", destination: SignUpView())
                    //                        .padding()
                    
                    
                }
                .padding()
                
                Spacer()
                
                
                
            }
            .navigationTitle("Sign In")
            .padding()
        }
            
            
        }
    }

struct SignUpView: View {
           
    @State var email = ""
    @State var password = ""
//            @State var newFoodAdded = ""
//            @State var api = apiCall()
//            //    @State var model = ViewModel()
//            @ObservedObject var model = ViewModel()
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
//        Divider()
        ZStack {
            Color("PrimaryColor").edgesIgnoringSafeArea(.all)
            VStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                //
                //                Divider()
                
                // Image("logo")
                VStack {
                    TextField("Enail Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        
                        appViewModel.signUp(email: email, password: password)
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .background(Color("SecondaryColor2"))
                            .cornerRadius(50)
                    })
                    
                    
                }
                .padding()
                
                Spacer()
                
                
            }
            .navigationTitle("Create Account")
        }
            
            
        }
    }

struct HomeView: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        
        
        
        NavigationView {
            
            ZStack {
                Color("PrimaryColor").edgesIgnoringSafeArea(.all)
                
                //                List (model.list) { item in
                //                    Text(item.name)
                //                    Text("\(item.sodium)")
                //                    Spacer()
                //                }
                
//                Color.white
                VStack(spacing: 20) {
                    
                    //                    Text("Add Foods")
//                                        NavigationLink(destination: ListOfFoodsView()) {
//                                            Image(systemName: "plus")
//                                                .foregroundStyle(.white)
//                                                .font(.title)
//                                        }
                    
                    NavigationLink(destination: practice()
                                   //                        .onAppear {
                                   //                        model.getData()
                                   //                    }
                    )
                    {
//                        Image(systemName: "Plus")
                        Text("View Daily Nutrients")
                            .foregroundStyle(.black)
                            .font(.title2)
                        
                    }
                    NavigationLink(destination: foodNameListView()
                        .navigationTitle("\(model.formattedDate)")
//                        .bold()
//                        .foregroundColor(.white)
//                        .shadow(radius: 5)
                        .navigationBarTitleDisplayMode(.large)
                        .foregroundColor(.black)
                        .font(.body)
                                   
                                   
                      
                                   //                        .onAppear {
                                   //                        model.getData()
                                   //                    }
                    )
                    {
//                        Image(systemName: "Plus")
                        Text("View All foods ")
                            .foregroundStyle(.black)
                            .font(.title2)
                        
                    }
                    NavigationLink(destination: GetNutrientsView()
                        .navigationTitle("AddFood")
                                   //                        .onAppear {
                                   //                        model.getData()
                                   //                    }
                    )
                    {
//                        Image(systemName: "Plus")
                        Text("Add New food ")
                            .foregroundStyle(.black)
                            .font(.title2)
                           
                        
                    }
                    NavigationLink(destination: Charts()
                        .navigationTitle("look at char")
                                   //                        .onAppear {
                                   //                        model.getData()
                                   //                    }
                    )
                    {
//                        Image(systemName: "Plus")
                        Text("Look at charts ")
                            .foregroundStyle(.black)
                            .font(.title2)
                           
                        
                    }
                   
                    
                    
                    
                    //                    Button("View Foods") {
                    //                        model.getData()
                    //                    }
                    //                    .buttonStyle(.borderedProminent)
                    
                }
            }
            .navigationTitle("Home")
        }
        .onAppear(perform: { model.getFomattedDate()})
        
    }

    
}


struct accountView: View {
    @EnvironmentObject var appViewModell: AppViewModel
    var body: some View {

        NavigationView {
            
            
            VStack(spacing: 20){
                Text("")
                
                
                
                    .navigationTitle("Account")
                Button(action: {
                    appViewModell.signOut()
                }, label: {
                    Text("Sign Out")
                        .foregroundColor(Color.green)
                })

            }
//                    .toolbar {
//                        ToolbarItem(placement:
//                                        ToolbarItemPlacement
//                            .bottomBar) {
//                                Button(action: {
//                                }, label: {
//                                    Text("Sign Out")
//                                })
//                            }
//                    }
            }
        }
    }



    

struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }


        
