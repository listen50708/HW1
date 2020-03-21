//
//  ContentView.swift
//  HW1
//
//  Created by WRYYYY on 2020/3/20.
//  Copyright © 2020 WRYYYY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            Text("卡比之星.JPG")
                .position(x: 200, y: 500)
                .font(.custom("BiauKai" ,size: 30))
           //手
            Group{
                //右手
                KirbyEllipse(pos_x:50, pos_y: 250, rotate: 135, width: 60, height: 120, red: 254, green: 150, blue: 202)
                //左手
                KirbyEllipse(pos_x:350, pos_y: 270, rotate: 135, width: 60, height: 120, red: 254, green: 150, blue: 202)
            }
            //腳
            Group{
                //右腳
                KirbyEllipse(pos_x:100, pos_y: 400, rotate: 0, width: 160, height: 60 , red: 254, green: 0, blue: 0)
                //左腳
                KirbyEllipse(pos_x:300, pos_y: 400, rotate: 0, width: 160, height: 60, red: 254, green: 0, blue: 0)
               
                
            }
            //body
            Group{
                Circle()
                    .fill(Color(red: 254/255, green: 150/255, blue: 202/255))
                    .frame(width: 300, height: 300)
                    .position(x: 200, y: 270)
                VStack{
                    Circle()
                        .stroke(Color.black, lineWidth: 5)
                        .frame(width: 300, height: 300)
                        .position(x: 200, y: 270)
                }
            }
            //face
            Group{
                //腮紅
                KirbyEllipse(pos_x:100, pos_y: 286, rotate: 105, width: 20, height: 35, red: 235, green: 70, blue: 90)
                KirbyEllipse(pos_x:300, pos_y: 286, rotate: 75, width: 20, height: 35, red: 235, green: 70, blue: 190)
                //眼睛
                KirbyEye(pos_x:160, pos_y: 250)
                KirbyEye(pos_x:240, pos_y: 250)
                //
                KirbyMouth()
                    .fill(Color(red:200/255, green: 0/255, blue: 0/255))
                //
                KirbyTongue()
                    .fill(Color(red: 235/255, green: 130/255, blue: 160/255))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct KirbyEllipse:View{
    var pos_x:CGFloat
    var pos_y:CGFloat
    var rotate:Double=0
    var width:CGFloat
    var height :CGFloat
    var red:Double
    var green:Double
    var blue:Double
    var body: some View {
        Ellipse()
            .fill(Color(red: red/255, green: green/255, blue: blue/255))
            .frame(width: width, height: height)
            .rotationEffect(.degrees(rotate))
            .position(x:pos_x,y:pos_y)
    }
}
struct KirbyEye:View{
    var pos_x:CGFloat
    var pos_y:CGFloat
    var body: some View {
        Group{
            Ellipse()
                .fill(Color(red: 0, green: 0, blue: 0))
                .frame(width: 45, height: 75)
                .position(x:pos_x,y:pos_y)
            Ellipse()
                .fill(Color(red: 255, green: 255, blue: 255))
                .frame(width: 30, height: 45)
                .position(x:pos_x,y:pos_y-5)
        }
    }
}
struct KirbyMouth:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to: CGPoint(x: 170, y: 300))
            path.addQuadCurve(to: CGPoint(x:230, y:300), control: CGPoint(x: 200, y:380))
            path.addQuadCurve(to: CGPoint(x:170, y:300), control: CGPoint(x: 200, y:280))
            path.closeSubpath()
        }
    }
}
struct KirbyTongue:Shape{
    func path(in rect: CGRect) -> Path {
        Path{ (path) in
            path.move(to: CGPoint(x: 180, y: 315))
            path.addQuadCurve(to: CGPoint(x:220, y:315), control: CGPoint(x: 200, y:370))
            path.addQuadCurve(to: CGPoint(x:180, y:315), control: CGPoint(x: 200, y:295))
            path.closeSubpath()
        }
    }
}
