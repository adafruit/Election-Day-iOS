
import SwiftUI
import CoreLocation

//12,46,86
struct ContentView: View {
    
    //Location
    
    @ObservedObject private var locationManager = LocationManager()
    
    var width : CGFloat = 300
    var height : CGFloat = 300
    
    let formatter = DateFormatter()
    
    
    
    
    @State var distantFuture = Date()
    @State var locationLabel = "nada"
    @State var daysTo = Date()
    //var toDate = Calendar.current.date(byAdding: .day, value: 20, to: )!
    //var electionDayDate = formatter.date(from: "3/11/2020")!
    
    func viewDidLoad() -> Void {
        let calendar = Calendar.current
        
        var components = DateComponents()
        
        components.day = 4
        components.month = 11
        components.year = 2020
        components.hour = 0
        components.minute = 0
        
        distantFuture = calendar.date(from: components)!
        
        print(distantFuture)
    }
    
    func locationGathering (){
        guard let exposedLocation = self.locationManager.exposedLocation else {
            print("*** Error in \(#function): exposedLocation is nil")
            return
        }
        
        self.locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            
            var output = "Current Location:"
            
            if let state = placemark.administrativeArea {
                output = output + " \(state),"
            }
            if let town = placemark.locality {
                output = output + " \(town)"
            }
            self.locationLabel = output
        }
    }
    
    
    var body: some View {
        
        
        let multiplier = width / 44
        
        
        NavigationView {
        
        
        return ZStack{
           
            
            
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.1101362099, green: 0.3318728176, blue: 0.4901960784, alpha: 1)))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            
            Rectangle()
                .offset(y: 350)
                .frame(width: 5000, height: 400, alignment: .center)
                .foregroundColor(Color(#colorLiteral(red: 0.1400283462, green: 0.4283899031, blue: 0.6383163195, alpha: 1)))
                .edgesIgnoringSafeArea([.horizontal, .bottom])
            
            
            VStack {
                
                ZStack{
                    
                    Image("flag")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .shadow(radius: 15)
                    
                    HStack{
                        DayView(setDate: distantFuture)
                        
                        
                        Text("Days")
                        
                    }
                    .padding(.bottom, 60)
                    .padding(.trailing, 10)
                    .font(.system(size: 4 * multiplier, weight: .heavy, design: .monospaced))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .shadow(color: Color.black.opacity(0.1),radius: 1, x:0, y:1)
                }
                .padding(.top, 70)
                
                
                Text("Countdown To Election Day")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 4 * multiplier, weight: .heavy, design: .monospaced))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .lineLimit(2)
                    .padding(.horizontal)
                // .padding(.horizontal, 1000)
                
                
                
                        
                
                Text("There's no such thing as a vote that does not matter.\nIt all matters.\n- Barack Obama")
                    //.fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 2.5 * multiplier, weight: .regular , design: .monospaced))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .padding(.top, 37)
                    .padding(.horizontal, 40.0)
                    .opacity(0.6)
               
                
               
               
                Spacer()
                
                
//                Button(action: {
//                    print("Delete button tapped!")
//                }) {
//                    Text("Need Voter Information For \nBrooklyn, New York?\nClick Here ")
//
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .multilineTextAlignment(.center)
//                        .lineLimit(3)
//                }
//                //.padding()
//                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
//
//                // .background(Color.white)
//                // .cornerRadius(40)
//                .offset(x: 0, y: -40)

                

                
                
                
                Link("Need Voter Information For \n      Brooklyn, New York?\n               Click Here ",
                     destination: URL(string: "https://www.vote.org/state/new-york/")!)
                  //  .font(.headline)
                   // .fontWeight(.bold)
                   // .multilineTextAlignment(.center)
                    .lineLimit(3)
                    
                    .foregroundColor(.white)
                    .offset(x: 0, y: -80)
                
                
                ZStack{
              
//
//                    Button(action: {
//                 //   print("Delete button tapped!")
//                }) {
//                    Text("WHOS'S RUNNING")
//
//                        .font(.headline)
//                        .fontWeight(.bold)
//                }

                
                    NavigationLink("WHO'S RUNNING", destination: DetailView().navigationBarTitle(Text("")))
                     //   .offset(x: 0, y: -20)
                      //  .opacity(0.2)
                }
                .font(.headline)
               // .fontWeight(.bold)
                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.1400283462, green: 0.4283899031, blue: 0.6383163195, alpha: 1)))
                .background(Color.white)
                .cornerRadius(40)
                .offset(x: 0, y: -60)
                
              
                
                //                ZStack(alignment: .leading){
                //                    Image("vote")
                //                        .resizable()
                //                        .aspectRatio(contentMode: .fit)
                //
                //                    DayView(setDate: distantFuture )
                //                        .font(.system(size: 10 * multiplier, weight: .heavy, design: .monospaced))
                //                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)))
                //                        .shadow(color: Color.black.opacity(0.1),radius: 1, x:0, y:1)
                //                }
                //                .frame(width: 340, height: 220)
                //
                //                .shadow(color: Color.black.opacity(0.2),radius: 20,x:0,y:20)
                //
                //                Spacer()
                //
                //                ZStack{
                //                    Rectangle()
                //                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                //                        .cornerRadius(30)
                //                    VStack{
                //
                //                        Text(locationLabel)
                //                            .font(.system(size: 2 * multiplier, weight: .light, design: .monospaced))
                //                            .foregroundColor(.black)
                //
                //
                //
                //                        Text("Countdown To Election Day")
                //                            .font(.system(size: 3 * multiplier, weight: .semibold, design: .monospaced))
                //                            .foregroundColor(.black)
                //
                //                        Text("November 3, 2020")
                //                            .font(.system(size: 2 * multiplier, weight: .light, design: .monospaced))
                //                            .foregroundColor(.black)
                //
                //                        Spacer()
                //                            .frame( height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                //
                //                        TimerView(setDate: distantFuture)
                //                            .font(.system(size: 2 * multiplier, weight: .light, design: .monospaced))
                //                            .foregroundColor(.black)
                //
                //
                //                        Link("Election Tools, Deadlines and Rules",
                //                              destination: URL(string: "https://www.vote.org/state/new-york/")!)
                //                            .foregroundColor(.blue)
                //                            .padding(.top, 10)
                //                    }
                //
                //                }
                //                .frame(width: 340, height: 220)
                //                .shadow(color: Color.black.opacity(0.2),radius: 20,x:0,y:20)
                //                Spacer()
                //
                //                ZStack{
                //                    Rectangle()
                //                        .foregroundColor(.white)
                //                        .cornerRadius(30)
                //
                //                    VStack{
                //                        Text("Presidential Candidates as of Today")
                //                            .font(.system(size: 2 * multiplier, weight: .bold, design: .monospaced))
                //                            .foregroundColor(.black)
                //                            .padding(5)
                //
                //                        VStack{
                //                            Text("Democratic Candidates")
                //                                .foregroundColor(.blue)
                //                            Text("Joe Biden / Kamala Harris")
                //
                //                        }
                //                        .padding(5)
                //                        VStack{
                //                            Text("Republican Candidates")
                //                                .foregroundColor(.red)
                //                            Text("Donald Trump / Mike Pence")
                //
                //                        }
                //                        .padding(5)
                //                        VStack{
                //                            Text("Green Party Candidates")
                //                                .foregroundColor(.green)
                //                            Text("Howie Hawkins / Angela Walker")
                //
                //
                //                        }
                //                        .padding(5)
                //                        VStack{
                //                            Text("Libertarian Candidates")
                //                                .foregroundColor(.yellow)
                //                            Text("Jo Jorgensen / Spike Cohen")
                //
                //                        }
                //                        .padding(5)
                //
                //
                //
                //
                //                    }
                //                    Spacer()
                //                }
                //                .frame(width: 340, height: 220)
                //                .shadow(color: Color.black.opacity(0.2),radius: 20,x:0,y:20)
                
            }
            
            .onAppear {
                locationGathering()
                viewDidLoad()
                
            }
            .frame(width: 360, height: 750, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
            
            
            
        }
        
    }
    
    
}


struct DayView : View {
    
    @State var now = Date()
    
    let setDate : Date
    
    var timer : Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            self.now = Date()
        }
    }
    
    
    
    public func daysToElection(_: Date) -> String {
        
        let calender = Calendar(identifier: .gregorian)
        let storedTime = calender
            .dateComponents([.day], from: now, to: setDate)
        
        
        return String(format: " %02d", storedTime.day!)
    }
    
    var body : some View {
        
        VStack{
            
            Text(daysToElection(setDate))
            //                .padding(.bottom, 60)
            //                .padding(.trailing, 33)
            
        }
        
    }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


