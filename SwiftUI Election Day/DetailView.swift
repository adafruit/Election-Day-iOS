//
//  DetailView.swift
//  SwiftUI Election Day
//
//  Created by Trevor Beaton on 8/18/20.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    
    var width : CGFloat = 300
    var height : CGFloat = 300
    
    let formatter = DateFormatter()
    
    //State for model popover
    @State var showDem = false
    
    
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
        
        
        return ZStack{
            
            
            
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.1101362099, green: 0.3318728176, blue: 0.4901960784, alpha: 1)))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            
            VStack(alignment: .center){
               
                VStack{
                Text("Countdown to")
                .font(.title)
                .fontWeight(.bold)
                Text("November 3, 2020")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                }
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                TimerView(setDate: distantFuture)
                    .font(.system(size: 2 * multiplier, weight: .light, design: .monospaced))
                    .foregroundColor(.black)
                
                Text("2020 CANDIDATES")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 250, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 0.9542754709, green: 0.9462221747, blue: 0.9571917808, alpha: 1)))
                                .background(Color.white)
                                .cornerRadius(20)
                            
                            VStack{
                                
                                HStack{
                                    
                                    
                                    ZStack {
                                        
                                        Image("kamala")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(20)
                                            .clipShape(Circle())
                                            .shadow(radius: 15)
                                            .offset(x: 5, y: 0)
                                        Image("joe")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 140, height: 140)
                                            .cornerRadius(10)
                                            .clipShape(Circle())
                                            .shadow(radius: 15)
                                            .offset(x: -70.0, y: -50.0)
                                        
                                        
                                        
                                    }
                                    
                                    
                                }
                                .offset(x: 30, y: 10)
                                Text("Democratic Candidates")
                                    .foregroundColor(Color(#colorLiteral(red: 0.0634500971, green: 0.3940225376, blue: 1, alpha: 1)))
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("Joe Biden / Kamala Harris")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                            }
                            
                        }
                        .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                            self.showDem.toggle()
                        })
                        .sheet(isPresented: $showDem, content: {
                            CandidateInfo()
                        })
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 250, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 0.9542754709, green: 0.9462221747, blue: 0.9571917808, alpha: 1)))
                                .background(Color.white)
                                .cornerRadius(20)
                            
                            VStack{
                                
                                HStack{
                                    
                                    
                                    ZStack {
                                        
                                        Image("pence")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(20)
                                            .clipShape(Circle())
                                            .shadow(radius: 15)
                                            .offset(x: 5, y: 0)
                                        Image("t rump")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 140, height: 140)
                                            .cornerRadius(10)
                                            .clipShape(Circle())
                                            .shadow(radius: 15)
                                            .offset(x: -70.0, y: -50.0)
                                        
                                        
                                        
                                        
                                    }
                                }
                                .offset(x: 30, y: 15)
                                Text("Republican Candidates")
                                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.04677283753, blue: 0, alpha: 1)))
                                    .font(.body)
                                    .fontWeight(.bold)
                                Text("(Incumbent)")
                                    .fontWeight(.light)
                                    .foregroundColor(Color.gray)
                                Text("Donald Trump / Mike Pence")
                                    
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                            }
                        }
                        
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 250, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 0.9542754709, green: 0.9462221747, blue: 0.9571917808, alpha: 1)))
                                .background(Color.white)
                                .cornerRadius(20)
                            
                            VStack{
                            
                            HStack{
                                
                                
                                ZStack {
                                    
                                    Image("angela")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 130, height: 130)
                                        .cornerRadius(20)
                                        .clipShape(Circle())
                                        .shadow(radius: 15)
                                        .offset(x: 5, y: 0)
                                    Image("howie")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 140, height: 140)
                                        .cornerRadius(10)
                                        .clipShape(Circle())
                                        .shadow(radius: 15)
                                        .offset(x: -70.0, y: -50.0)
                                    
                                    
                                    
                                }
                            }
                            .offset(x: 30, y: 0)
                                Text("Green Party Candidates")
                                    .foregroundColor(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                                    .font(.body)
                                    .fontWeight(.bold)
                            
                                Text("Howie Hawkins / Angela Walker")
                                    
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                        }
                        
                        }
                        ZStack{
                            
                            Rectangle()
                                .frame(width: 250, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(#colorLiteral(red: 0.9542754709, green: 0.9462221747, blue: 0.9571917808, alpha: 1)))
                                .background(Color.white)
                                .cornerRadius(20)
                            
                            VStack{
                            
                            
                            HStack{
                                
                                
                                ZStack {
                                    
                                    
                                    Image("spike")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 130, height: 130)
                                        .cornerRadius(20)
                                        .clipShape(Circle())
                                        .shadow(radius: 15)
                                        .offset(x: 5, y: 0)
                                    Image("jo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 140, height: 140)
                                        .cornerRadius(10)
                                        .clipShape(Circle())
                                        .shadow(radius: 15)
                                        .offset(x: -70.0, y: -50.0)
                                    
                                    
                                    
                                }
                            }
                            .offset(x: 30, y: 0)
                                Text("Libertarian Candidates")
                                    .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                                    .font(.body)
                                    .fontWeight(.bold)
                                
 
                                Text("Jo Jogensen / Spike Cohen")
                                    
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .padding(.top, 5)
                        }
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                locationGathering()
                viewDidLoad()
                
            }
           
        }
        
    }
    
    struct CardView : View {
        
        //  var img = ""
        
        var body : some View {
            
            
            VStack{
                //Image(img)
                Text("test")
            }
            .frame(width: 250, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            
        }
    }
    
    struct TimerView : View {
        
        @State var now = Date()
        
        let setDate : Date
        
        var timer : Timer {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
                _ in
                self.now = Date()
            }
        }
        
        public func dateToString(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d:%02d:%02d:%02d:%02d:%02d", storedTime.month!,storedTime.weekOfMonth!, storedTime.day!, storedTime.hour!, storedTime.minute!, storedTime.second!)
        }
        
        public func month(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.month!)
        }
        
        public func week(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.weekOfMonth!)
        }
        
        public func day(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.day!)
        }
        
        public func hour(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.hour!)
        }
        
        public func minute(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.minute!)
        }
        
        public func second(_: Date) -> String {
            
            let calender = Calendar(identifier: .gregorian)
            let storedTime = calender
                .dateComponents([.month,.weekOfMonth, .day,.hour, .minute, .second], from: now, to: setDate)
            
            
            return String(format: "%02d", storedTime.second!)
        }
        
        
        
        var body : some View {
            
            VStack{
                
                HStack{
                    
                    VStack{
                        
                        
                        
                        Text(month(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Months")
                            .font(.body)
                            .fontWeight(.bold)
                            
                    }
                    
                    
                    VStack{
                        
                        
                        
                        Text(week(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Weeks")
                            .font(.body)
                            .fontWeight(.medium)
                        
                    }
                    
                    VStack{
                        
                        
                        
                        Text(day(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Days")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                    VStack{
                        
                        
                        
                        Text(hour(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Hours")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                    VStack{
                        
                        
                        
                        Text(minute(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Minutes")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                    VStack{
                        
                        
                        
                        Text(second(setDate))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.2352941176, blue: 0.3921568627, alpha: 1)))
                            .font(.body)
                            .fontWeight(.bold)
                        Text("Seconds")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                }
                
            }
            .onAppear {
                self.timer
            }
            .foregroundColor(Color(#colorLiteral(red: 0.9138245558, green: 0.9138245558, blue: 0.9138245558, alpha: 1)))
            
            
        }
        
    }
    
    struct DetailView_Previews: PreviewProvider {
        static var previews: some View {
            DetailView()
        }
    }
}
