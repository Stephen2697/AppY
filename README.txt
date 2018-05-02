Project Title: projectCaesium 
Developer: Stephen Alger C16377163
Project Video: https://youtu.be/bMvSIGi_jno

Langauge: Swift
IDE: Xcode 9 
IOS Target: 11

This is an app which implements a food logging system through the use of OOP principles. This multi-view app allows the user to enter their food nutrition details and calculates their consumed calories based on the meal portion size. The app maintains this data with persistence through NSCoding (to encode & decode) which stores the user's food object array in memory and accesses it on demand. The user's consumed foods are kept in a custom view: FoodTItemTableViewController (subclass of UITableViewController). Indeed the app implements several Custom View Controllers. The user can Add, Edit & Delete foods whenever they wish. The Today View acts as a dashboard to display insightful information breaking down the user's macros for the current day in a piechart which implements the Charts library, feeding it our data values and providing simple visual representations of this data in a piechart. The app also has insightful information for the user about realistic weight ambitions etc. All of this is coupled with various steps to make the app look and feel professional and act in accordance with core IOS11 principles such as 3D Touch and overall system themes. This app was inspired by personal interests in the area and I feel it is practical and near publishment stage, but requires further testing on other device proportions.