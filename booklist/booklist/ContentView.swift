import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                LibraryView()
                    .tabItem {
                        Label("読みたい本", systemImage: "book.fill")
                    }
                
                SearchView()
                    .tabItem {
                        Label("さがす", systemImage: "magnifyingglass")
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
