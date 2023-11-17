import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var searchResults: [String] = []
    @State private var selectGradeOption: SelectGradeOption = .Regular
    
    
    enum SelectGradeOption: String, CaseIterable {
        case Regular, Plus, Premium
    }

    var body: some View {
        NavigationView {

                ZStack {
                    Color("ButtonColor")
                        .ignoresSafeArea()

                    VStack {
                        HStack {
                            NavigationLink(
                                destination: Settings(),
                                label: {
                                    Image(systemName: "gear")
                                        .font(.largeTitle)
                                        .padding()
                                        .padding(.bottom, 40)
                                        .foregroundColor(Color("TextColor"))
                                }
                            )
                            Spacer()
                            Button(action: {
                                print("Account")
                            }) {
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                                    .padding()
                                    .padding(.bottom, 40)
                                    .foregroundColor(Color("TextColor"))
                            }
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

                // Car Tab/search
                ZStack {
                    Color("ButtonColor")
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            NavigationLink(
                                destination: Settings(),
                                label: {
                                    Image(systemName: "gear")
                                        .font(.largeTitle)
                                        .padding()
                                        .padding(.bottom, 40)
                                        .foregroundColor(Color("TextColor"))
                                }
                            )
                            Spacer()
                            Button(action: {
                                print("Account")
                            }) {
                                Image(systemName: "person.circle")
                                    .font(.largeTitle)
                                    .padding()
                                    .padding(.bottom, 40)
                                    .foregroundColor(Color("TextColor"))
                            }
                        }.padding(.top, 280)
                        
                        // Search Bar
                        VStack{
                            Text("Search")
                                .font(.custom("AbhayaLibre-ExtraBold", size: 48))
                                .fontWeight(.bold)
                                .foregroundColor(Color("TextColor"))
                                .multilineTextAlignment(.center)
                                .padding(.top, -280)
                            ZStack(alignment: .trailing) {
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(Color("Color"))
                                    .frame(height: 55)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 35)
                                            .stroke(Color("TextColor"), lineWidth: 2)
                                    )
                                HStack {
                                   
                                    TextField("Enter Your Location ", text: $searchText)
                                        .padding(10)
                                        .background(Color.clear)
                                        .cornerRadius(25)
                                        .padding(.horizontal, 25)
                                        .font(.custom("AbhayaLibre-SemiBold", size: 24))
                                    
                                    Button(action: {
                                        performSearch()
                                    }) {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundColor(Color("TextColor"))
                                    }
                                    .padding(.trailing, 20)
                                }
                            }
                            .padding(.top, -200)
                            .padding(.horizontal, 18)
                            
                            HStack {
                                // Select Grade Picker
                                VStack {
                                    Picker("Select grade", selection: $selectGradeOption) {
                                        ForEach(SelectGradeOption.allCases, id: \.self) { option in
                                            Text(option.rawValue)
                                                .foregroundColor(Color("TextColor"))
                                        }
                                    }
                                    .pickerStyle(MenuPickerStyle())
                                    .frame(maxWidth: .infinity)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .border(Color("TextColor"), width: 2)
                                    .overlay(RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color("TextColor"), lineWidth: 3))
                                    .cornerRadius(50)
                                    .clipped()
                                }.padding(.horizontal, 20)
                                
                            }
                            .padding(.top, -100)
                            .padding(.bottom, 80)
                            
                            Button(action: performSearch) {
                                        Text("Submit")
                                    .foregroundColor(Color("Color"))
                                    .font(.custom("AbhayaLibre-SemiBold", size: 24))
                                    .padding(.horizontal, 45.0)
                                    .padding(.vertical, 12.0)
                                    .background(Color("TextColor"))
                                    .cornerRadius(25)
                            }
                        }
                        .frame(width: 387.0)
                        .frame(height: 900.0)
                        .background(RoundedRectangle(cornerRadius: 72)
                            .foregroundColor(Color("Color"))
                            .overlay(RoundedRectangle(cornerRadius: 72)
                                .stroke(Color("TextColor"), lineWidth: 5))
                        )
                    }.padding(.top, 5)
                }


                ZStack {
                    Text("Notifications") // Placeholder for bell content
                }
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
            }
    }

    func performSearch() {
        // Simulate search results with some placeholders
        searchResults = ["Gas Station 1", "Gas Station 2", "Gas Station 3"]
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

#Preview {
    SearchView()
}

