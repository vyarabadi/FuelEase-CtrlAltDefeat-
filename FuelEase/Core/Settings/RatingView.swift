import SwiftUI
import FirebaseFirestore

struct Rating: View {
    @State private var submit = false
    @State private var rating: Int = 0
    @State private var reviewText: String = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    private func submitRating(){
        let db = Firestore.firestore()
        
        let data: [String: Any] = [
            "rating": rating,
            "reviewText": reviewText
        ]
        db.collection("appRating").addDocument(data: data){ error in
            if let error = error {
                print("Error adding report: \(error.localizedDescription)")
            } else {
                submit = true
                rating = 0
                reviewText = ""

            }
        }
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Spacer()
                .navigationBarBackButtonHidden(true)
                .toolbar(content: {
                    ToolbarItem (placement: .navigationBarLeading)  {
                        
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "arrow.left")
                            //Image(systemName: "house.fill")
                                .foregroundColor(Color("TextColor"))
                            Text("Help Support")
                                .foregroundColor(Color("TextColor"))
                                .font(.custom("AbhayaLibre-ExtraBold", size: 22))
                            
                        })
                        
                    }
                })
            VStack {
                Text("Rate Our App")
                    .font(.custom("AbhayaLibre-ExtraBold", size: 40))
                    .padding()
                
                HStack {
                    ForEach(1 ..< 6) { index in
                        Button(action: {
                            rating = index
                        }) {
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.yellow)
                        }
                    }
                }
                .padding()
                
                Text("Your Rating: \(rating) stars").font(.custom("AbhayaLibre-Bold", size: 26))
                
                
                VStack {
                    TextField("Write a review...", text: $reviewText, axis: .vertical)
                        .padding()
                        .background (Color.gray.opacity (0.3) .cornerRadius (10))
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                    
                    
                    Button("Submit".uppercased()) {
                        // Handle the submission of the rating and review text here
                        print("Rating: \(rating) stars")
                        print("Review Text: \(reviewText)")
                        submitRating()
                        submit = true
                    }
                    .alert("Thank you for your review!", isPresented: $submit) {
                        Button("OK", role: .cancel) { }}
                    .foregroundColor(Color("TextColor"))
                    .padding()
                    .background(Color("Color"))
                    .cornerRadius(25)
                    .font(.custom("AbhayaLibre-Bold", size: 24))
                    
                    .padding()
                }
                
            }.navigationBarBackButtonHidden(true)
            
        }
    }
}

struct Rating_Previews: PreviewProvider {
    static var previews: some View {
        Rating()
    }
}
