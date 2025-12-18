https://github.com/user-attachments/assets/994ab734-648a-4612-99dc-4ce861c8e6b1

## Usage

`CTWindowManager` can be added to your project, just like any other package.

After it’s added and imported, create a `CTWindowRootView` inside your `WindowGroup`, then provide it with a view. The provided view will be presented in every `CTWindowPane`, so if you need to be able to switch between different editors or views, you should manage that in the view you provided to `CTWindowRootView`.

```swift

import SwiftUI
import CTWindowManager

@main
struct CTWindowApp: App {
    var body: some Scene {
        WindowGroup {
            CTWindowRootView() {
                ContentView()
            }
        }
    }
}

```
