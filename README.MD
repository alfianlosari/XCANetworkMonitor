# XCA Network Monitor For SwiftUI

![Alt text](https://i.ibb.co.com/1MBqF3V/Screenshot-2024-08-12-at-22-55-24.png "image")

Simple and extensible NetworkMonitor with UI Solution for Apple Platforms.

## Supported Platforms

- iOS 17
- macOS 14
- visionOS 1.x

## Installation

### Swift Package Manager
- File > Swift Packages > Add Package Dependency
- Copy and paste this URL

```swift
https://github.com/alfianlosari/XCANetworkMonitor
```

### Import
Import to your project source file.

```swift
import XCANetworkMonitor
```

### NetworkMonitor Banner

Simply add `networkStatusBanner()` modifier to your SwiftUI View.

```swift
var body: some View {
    VStack(spacing: 20) {
        Text("XCA Network Monitor Demo")
            .font(.title)
    }
    .networkStatusBanner()
```


### NetworkMonitor Observable

Simply initialize passing the `NetworkMonitor` as `@State` in SwiftUI View.

```swift

struct ContentView: View {
    
    @State var networkMonitor = NetworkMonitor()
        
    var body: some View {
        HStack {
            Circle()
                .foregroundStyle(networkMonitor.isReachable ? .green : .red)
                .frame(width: 20, height: 20)
            Text(networkMonitor.statusText)
        }
    }
}
```
