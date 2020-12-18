# Pomar Dialog

Overlay dialogs used on Roger - Habit Tracker for iOS.

![Alt text](/Sources/PomarDialog/Screenshots/PomarDialogScreenshot1.png?raw=true "Dialog overview")

## 🔷 Installation

`PomarDialog` is available via [Swift Package Manager](https://swift.org/package-manager).

Using Xcode 11, go to `File -> Swift Packages -> Add Package Dependency` and enter [https://github.com/codewithrenato/PomarDialog](https://github.com/codewithrenato/PomarDialog)

## 🔷 Usage

```Swift
import SwiftUI
import PomarDialog

enum ScreenSelected
{
    case first
    case second
}

extension ScreenSelected: Identifiable {
    var id: ScreenSelected { self }
}

struct ContentView: View {
    
    @State private var isPresented: ScreenSelected? = nil
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation{
                    self.isPresented = .first
                }
            }){
                Text("Show dialog 1")
                    .padding()
            }
            
            Button(action: {
                withAnimation{
                    self.isPresented = .second
                }
            }){
                Text("Show dialog 2")
                    .padding()
            }
            
            Spacer()
        }
        .pDialog(item: $isPresented, showCloseButton: true, hideOnTapOutside: true){ item in
            switch item {
            case .first:
                Text("Welcome back")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom)
                Text("It's great to see you here")
                    .foregroundColor(.white)
                Spacer()
                Button(action: {withAnimation{isPresented = nil}}){
                    VStack{
                        Text("Okay")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color(UIColor.systemBlue).cornerRadius(8))
                }
            case .second:
                Text("Are you sure?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding(.bottom)
                Text("This action can't be undone")
                    .foregroundColor(.white)
                Spacer()
                Button(action: {withAnimation{isPresented = nil}}){
                    VStack{
                        Text("I'm sure")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color(UIColor.systemRed).cornerRadius(8))
                }
            }
        }
    }
}
```
## 🔷 Step to step

### Import the package

```Swift
import PomarDialog
```

### Create an Identifiable enum

```Swift
enum ScreenSelected
{
    case first
}

extension ScreenSelected: Identifiable {
    var id: ScreenSelected { self }
}
```
### Set a variable to control the dialog's state

```Swift
@State private var isPresented: ScreenSelected? = nil
```

### Add the dialog to your main view

```Swift
VStack {
    Button(action: {
        withAnimation{
            self.isPresented = .first
        }
    }){
        Text("Show dialog 1")
            .padding()
    }
}
.pDialog(item: $isPresented, showCloseButton: true, hideOnTapOutside: true){ item in
    switch item {
    case .first:
        EmptyView() // Replace with the dialog's content
    }
}
```
## 🔷 License

📄 Pomar Dialog is available under the MIT license. See the LICENSE file for more info.
