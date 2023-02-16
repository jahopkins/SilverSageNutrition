# SilverSageNutrition

 Silver Sage Nutrition is an IOS application developed in Swift 5. It allows users to input foods eaten daily and retrieve nutritional infromation for those foods.
 
 ## Getting Started
 
 ### Obtain Nutritionix API Key
 1. Obtain a free API Key from Nutritionix at https://developer.nutritionix.com/signup

### Connecting to Firebase
1. Create a new project in Firebase at https://firebase.google.com/
2. Create a new application in Xcode and obtain your project's bundle identifier
3. In firebase, select your project and then click the "ios+" icon in order to connect your application to firebase
4. <img width="753" alt="Screenshot 2023-02-16 at 12 57 56 PM" src="https://user-images.githubusercontent.com/113637371/219485293-89ce110c-fe35-4135-aea8-cfafc9a29779.png">
5. When registering your application, enter your project's bundle identifer from your Xcode project
6. Download configuration file. Note: file must be named "GoogleService-Info.plist"
7. <img width="783" alt="Screenshot 2023-02-16 at 1 00 41 PM" src="https://user-images.githubusercontent.com/113637371/219486660-34af87ba-3f27-4ed9-88e4-efeceeb40631.png">
8. Add FireBase SDK. When choosing Firebase libraries, make sure to add FirebaseAuth, FirebaseCore and FirebaseFirestore. You must also aff FirebareAnalystics if you selected to track analytics with Google when created your project
9. Add Initizlation code to App
10. Add "GoogleService-Info.plist" to .gitignore file

### Set up User Authentication
1. In the firebase console, select your project name
2. <img width="789" alt="Screenshot 2023-02-16 at 1 21 31 PM" src="https://user-images.githubusercontent.com/113637371/219489597-2dff0161-4d96-4009-ac07-7f22a69fbbd5.png">
3. Select "Authentication" then "Get Started"
4. Select the sign-in method you would like to use. For this project, email/password was selected. 
5. Select "enable" for whichever method selected, then save
6. <img width="685" alt="Screenshot 2023-02-16 at 1 24 31 PM" src="https://user-images.githubusercontent.com/113637371/219490196-f3cf1ce2-b6a5-4c29-b0a9-2a8b7392c9b4.png">

## Usage 
1. Users can create an account by selected "Sign Up" and entering an email and password 
2. Users can sign in by selecting "Sign In' and entering the email and password they registed for an account with
3. Once signed in, users are presented with a view of tracked nutrients. This screen will be intentionally blank until the user adds a food item in the foods tab. 
4. <img width="353" alt="Screenshot 2023-02-16 at 1 39 44 PM" src="https://user-images.githubusercontent.com/113637371/219493158-ea5c88e6-cc17-4509-8689-634e92f0d784.png">

5. In the food tab, user can select "Add new food" to begin tracking their nutrients. 
6. <img width="362" alt="Screenshot 2023-02-16 at 1 38 54 PM" src="https://user-images.githubusercontent.com/113637371/219493219-b8b21437-6336-4d85-af3b-c78724614c5e.png">

7. <img width="360" alt="Screenshot 2023-02-16 at 1 40 55 PM" src="https://user-images.githubusercontent.com/113637371/219493492-0b0ee614-e1ff-45e7-bda7-0ad2e3ea9b11.png">

8. <img width="356" alt="Screenshot 2023-02-16 at 1 41 03 PM" src="https://user-images.githubusercontent.com/113637371/219493530-b4599239-93d8-462b-bb89-c10597e54993.png">

9. <img width="357" alt="Screenshot 2023-02-16 at 1 41 11 PM" src="https://user-images.githubusercontent.com/113637371/219493565-8ddfd87c-2a41-4091-a06c-bdcf2ce0e3ec.png">

10. After adding a food, users can navigate back to the "tracked foods" tab and now see their added food item along with the serving size. 
11. <img width="348" alt="Screenshot 2023-02-16 at 1 41 28 PM" src="https://user-images.githubusercontent.com/113637371/219493597-482c3b29-3e44-4f41-b995-cdb5472fadd4.png">

12. The nutrients for added food items can now be seen in the nutrients tab
13. <img width="355" alt="Screenshot 2023-02-16 at 1 41 34 PM" src="https://user-images.githubusercontent.com/113637371/219493626-40d4cf07-71f0-49f7-9a5e-93832fb657c8.png">

14. If a user wishes to delete a food item, they can nagivate to the foods tab and select "delete" for the sepecified food. 
15. This will delete the food from the user's tracked foods and along with the nutrtional data associated with that food item.
16. <img width="346" alt="Screenshot 2023-02-16 at 1 41 41 PM" src="https://user-images.githubusercontent.com/113637371/219493682-43600e38-e073-4fce-b28f-2f5164dc5dc5.png">











