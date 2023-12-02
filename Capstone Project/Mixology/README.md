# Mixology App

Mixology is a colourful database of cocktails, over 500. Cocktails each have images, a list of ingredients and measurements, the type of glass to be used and directions.

The app uses data provided by the theCockTail.db API. 


## Features
- Content is loaded Asynchronously.
- User can favourite a drink and it will be saved to local storage for offline viewing. 
- Homescreen presents 10 recently viewed drinks that are also persisted. Every time a drink is selected it becomes the most recently viewed. 
- Supports light and dark mode. Landscape and Portrait (mostly)
- Users can either browse all available drinks or search by name, the list dynamically updates. 
- When the app detects there is no network connection, only the favourites screen becomes visible, allowing them to select a drink and view its details while offline. The UI adapts to this change and indicates to the user they are offline with a symbol and notification if they tap it.  



## Rubric Requirements and Where to Find Them

- The app has at least one screen with a list using a view of your choice (List, Grid, ScrollView etc). This list should appear in a tab view with at least two tabs.

(HomeScreenView.swift) (FavouritesScreenView.swift) (etc...)

- Each item in the list should contain (at minimum) a name, a subtitle or description, and an image of the item, and any text should be styled appropriately. 
Tapping an item in this list should navigate (NavigationStack)  to a detail view: This should show the same data in the list item with some further details such as a longer description, bigger picture, price, or a Buy/Order button. 
Include enough items to ensure that the user has to scroll the list to see all the items in it. 

(HomeScreenView.swift) (BrowseView.swift) (DrinkDetailView.swift)

- The app has one or more network calls using URLSession to download/upload data related to the core tasks of the app. The app’s repo does not contain API keys or other authentication information.

(DrinkStore.swift) 

- The app handles all typical errors related to network calls — including server error response codes and no network connection — and keeps the user informed.

(DrinkStore.swift) 

- The app uses at least one way to save data: user defaults, plist, file, or keychain. Specify your method in the README.

(DrinkStore saves two JSONs) (ImageFetcher) performs local caching of images. 

- The app uses Swift Modern Concurrency, async/await, and MainActor appropriately to keep slow-running tasks off the main thread and to update the UI on the main thread. No dispatch queues or completion handlers

(DrinkStore.swift) (ContentView.swift)

- The app communicates to the user whenever data is missing or empty, the reason for that condition — for example, data cannot be loaded, or the user hasn’t created any — and the action the user should perform to move forward. The app should have no blank screens, and the user should never feel “lost”. 

(NetworkMonitor.swift) checks for connectivity. (DrinkDetailView.swift, ContentView.swift, FavouritesScreen.swift) all react to no internet. (FavouritesScreen.swift and DrinkDetailView.swift) have indicator top right corner that lets users know they are offline. Tapping the indicator brings up a prompt informing them.

 
- The app includes: A custom app icon. An onboarding screen. A custom display name. At least one SwiftUI animation. Styled text properties. SwiftUI modifiers are sufficient.

(Icon and Onboarding and setup, animation can be found in onboarding symbols as well as no internet connecting indicators in DrinkDetailView.swift and FavouritesScreen.swift)


