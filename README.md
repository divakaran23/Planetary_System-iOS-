Planetary_System-iOS-
=====================
An iOS app where UItableview concepts are explored and implemented.
The app has several screens where UITableview is implemented programatically and also using story board.
The first screen has a UITableview with custom background displaying all the set of predefined planets.
Each cell in the tableview correspond to another tableview when the accessory button in the table cell is tapped. This new tableview describes the details of that particular planet.
A new screen to add new planets in a new section of the main table is implemented.
All the screens are connected through their respectives segues.
Used NSUserDefaults to persist the new planets that are being added to the table by the user.
NSUserDefaults is a light weight layer for persisting data. This is used when the data to be stored is less and when the user does not require database.
NSUserDefaults is fast compared to databse access.
