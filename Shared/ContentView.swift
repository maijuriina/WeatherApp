//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 25/01/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        var image: UIImage = #imageLiteral(resourceName: "Background")!
        bgImage = UIImageView(image: image)
        bgImage!.frame = CGRectMake(0,0,100,200)
        self.view.addSubview(bgImage!)
    }*/
    
    var body: some View {
        /*ZStack {*/
            Text("Hello, world!")
                .padding()
        
    
        /*.background(
            Image("dark_background.pdf")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) )} */

        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background"))
        
        /*Zstack {
            #imageLiteral(resourceName: "Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        }*/

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

