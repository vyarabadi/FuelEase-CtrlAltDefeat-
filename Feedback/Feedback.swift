import SwiftUI

struct Feedback: View {
    
    @State var show = false
    @State var ratings = 0
    
    var body: some View {
     
        ZStack{
            
            VStack{
                
                Button(action: {
                    
                    self.ratings = 0
                    self.show.toggle()
                    
                }) {
                    
                    Text("Review").fontWeight(.bold).foregroundColor(.green)
                }
                
                if self.ratings != 0{
                    
                    Text("Ratings = \(self.ratings)").fontWeight(.bold).foregroundColor(.green).padding(.top, 25)
                }
            }
            
            if self.show{
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        FeedBack(ratings: self.$ratings, show: self.$show).padding()
                    }
                    
                }.background(Color.black.opacity(0.2).edgesIgnoringSafeArea(.all))
            }
            
        }(.backgound)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FeedBack : View {
    
    @Binding var ratings : Int
    @Binding var show : Bool
    
    var body : some View{
        
        VStack{
            
            HStack{
                
                Text("Please Rate The Quality Of The Product").fontWeight(.bold).foregroundColor(.white)
                
                Spacer()
                
            }.padding()
            .background(Color.green)
            
            VStack{
                
                if self.ratings != 0{
                    
                    if self.ratings == 5{
                        
                        Text("Excellent").fontWeight(.bold).foregroundColor(.green)
                    }
                    else if self.ratings == 4 {
                        
                        Text("Good").fontWeight(.bold).foregroundColor(.green)
                    }
                    else{
                        
                        Text("Okay").fontWeight(.bold).foregroundColor(.green)
                    }
                }
                
            }.padding(.top, 20)
            
            HStack(spacing: 15){
                
                ForEach(1...5,id: \.self){i in
                    
                    Image(systemName: self.ratings == 0 ? "star" : "star.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(i <= self.ratings ? .green : Color.black.opacity(0.2))
                        .onTapGesture {
                            
                            self.ratings = i
                    }
                }
                
            }.padding()
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    self.ratings = 0
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel").foregroundColor(.green).fontWeight(.bold)
                }
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Submit").foregroundColor(self.ratings != 0 ? .green : Color.black.opacity(0.2)).fontWeight(.bold)
                    
                }.padding(.leading, 20)
                .disabled(self.ratings != 0 ? false : true)
                
            }.padding()
            
        }
        .background(Color.white)
        .cornerRadius(10)
    }
}
