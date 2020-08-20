//
//  CandidateInfo.swift
//  SwiftUI Election Day
//
//  Created by Trevor Beaton on 8/18/20.
//

import SwiftUI

struct CandidateInfo: View {
    var body: some View {
        ZStack{
            
            Color.black.opacity(0.05).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            DemocratInfo()
        }
    }
}

struct DemocratInfo: View {
    var body: some View {
        
        VStack{
            
            HStack{
                Image("joe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    
                    .shadow(radius: 15)
                Image("kamala")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    
                    .shadow(radius: 15)
           
            }
            
            
            Text("Joseph Robinette Biden Jr. (D)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.0634500971, green: 0.3940225376, blue: 1, alpha: 1)))
                .offset(x: -40.0, y: 0)
            
            
            Text("American politician who served as the 47th vice president of the United States from 2009 to 2017. A member of the Democratic Party, Biden is the presumptive Democratic presidential nominee for the 2020 election, running against the incumbent, Donald Trump.")
                .font(.body)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding()
            
            Text("Kamala Devi Harris (D)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding()
                .foregroundColor(Color(#colorLiteral(red: 0.0634500971, green: 0.3940225376, blue: 1, alpha: 1)))
                .offset(x: -5.0, y: 0)
            
            
            Text("An American politician and lawyer who has served as the junior United States senator from California since 2017. She is the presumptive Democratic vice presidential nominee in the 2020 election.")
                
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding()
        }
        
    }
}

struct CandidateInfo_Previews: PreviewProvider {
    static var previews: some View {
        CandidateInfo()
    }
}
