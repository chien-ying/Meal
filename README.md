# MealApp - iOS


## Introduction
The Meal App is a mobile application for iOS devices designed to help users browse and explore a variety of meals in the Dessert category. It retrieves information about meals from [TheMealDB API](https://www.themealdb.com/api.php), offering an intuitive interface that displays names of meals, cooking directions, and the necessary ingredients.

![alt text](/Images/AppScreenShot.png)

## Features
- Retrieves a collection of dessert meals using TheMealDB API.
- Presents the gathered list of dessert options.
- Organizes the dessert items in an A-Z order.
- Enables users to select a dessert to see more information about it.
- Acquires and shows the selected dessert's name, instructions, and list of  ingredients/measurements.
- Handles null or empty values returned from the API by filtering them out before displaying the data.
- Developed the Views in SwiftUI.
- Utilized URLSession for networking with APIs.

## Prerequisites

- Xcode 15.0.1+
- iOS device or simulator 15.0+
- Stable internet connection

## Installation

- Clone or download the repository.
- Open the Meal.xcodeproj file in Xcode.
- Build and run the app on the iOS Simulator or a connected device.
- Ensure the internet connectio is stable to fetch data from the API.

## Usage

- Launch the Meal App on your iOS device or simulator.
- The app will fetch the list of meals from the Dessert category.
- The meals will be displayed in a table view, sorted alphabetically.
- Tap on a meal to view its details.
- The app will fetch the meal's name, instructions, and ingredients/measurements from the API.
- The meal details will be displayed in a separate detail view.
- Navigate back to the list of meals to explore other options.


## Contact
For any inquiries or questions, please contact cy@bu.edu
