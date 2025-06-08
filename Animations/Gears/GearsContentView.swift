//
//  GearsContentView.swift
//  Animations
//
//  Created by Tatiana on 08/06/25.
//

import SwiftUI

struct GearsContentView: View {
    var body: some View {
        ZStack {
            //MARK: - Motor
            Group {
                Image("motor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 120)
                    .offset(x: -120, y: 90)
            }
            
            //MARK: - Gears animating on Z axis
            
            Group {
                //Gear 1
                GearView(gearImage: "doubleGear", gearWidth: 40, gearDegrees: 360, offsetGearX: -124, offsetGearY: 102, duration: 5)
                //Gear 2
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -124, offsetGearY: -280, duration: 7)
                //Gear 3
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -280, duration: 7)
                //Gear 4
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: 124, offsetGearY: -70, duration: 5)
                //Gear 5
                GearView(gearImage: "doubleGear", gearWidth: 80, gearDegrees: -360, offsetGearX: 49, offsetGearY: -113, duration: 5)
                //Gear 6
                GearView(gearImage: "doubleGear", gearWidth: 100, gearDegrees: 360, offsetGearX: -6, offsetGearY: -80, duration: 7)
            }
            
            //MARK: - Gears animating on the Y axis
            Group {
                //Gear 7
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: -62, offsetGearY: -85, rotateDegrees: 76, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
                //Gear 8
                GearView(gearImage: "singleGear", gearWidth: 25, gearDegrees: -360, offsetGearX: -59, offsetGearY: 19, rotateDegrees: 76, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)                //Gear 10
                GearView(gearImage: "singleGear", gearWidth: 100, gearDegrees: -360, offsetGearX: 160, offsetGearY: 94, rotateDegrees: 76, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)                //Gear 11
                GearView(gearImage: "singleGear", gearWidth: 25, gearDegrees: -360, offsetGearX: 163, offsetGearY: 252, rotateDegrees: 76, duration: 7, xAxis: 0, yAxis: 1, zAxis: 0)
            }
            
            //MARK: - Gear animating on the X axis
            Group {
                //Gear 9
                GearView(gearImage: "singleGear", gearWidth: 175, gearDegrees: 360, offsetGearX: 60, offsetGearY: 39, rotateDegrees: 84, duration: 7, xAxis: 1, yAxis: 0, zAxis: 0)
            }
            
            //MARK: - Worm Gear
            Group {
                WormGearView().offset(x: 60, y: 30).zIndex(-1)
            }
            
            //MARK: - Belts that animate on the Z axis
            Group {
                //Belt 1
                BeltView(animateBelt: true, beltWidth: 425, beltHeight: 48, offsetBeltX: -124, offsetBeltY: -90, rotateDegrees: 90)
                //Belt 2
                BeltView(animateBelt: true, beltWidth: 352, beltHeight: 100, offsetBeltX: 0, offsetBeltY: -280, rotateDegrees: 0)
                //Belt 3
                BeltView(animateBelt: true, beltWidth: 258, beltHeight: 48, offsetBeltX: 124, offsetBeltY: -175, rotateDegrees: 90)
            }
            
            //MARK: - Belts that animate on the Y axis
            Group {
                //Belt 4
                BeltView(beltWidth: 32, beltHeight: 125)
                    .rotation3DEffect(.degrees(75), axis: (x: 0, y: 1, z: 0))
                    .offset(x: -60, y: -33)
                
                //Belt 5
                BeltView(beltWidth: 28, beltHeight: 180, offsetBeltY: -10)
                    .rotation3DEffect(.degrees(75), axis: (x: 0, y: 1, z: 0))
                    .offset(x: 162, y: 185)
            }
            
            //MARK: - Gear Shafts
            Group {
                //Shaft 1
                GearShaftView().offset(x: 5, y: 28).zIndex(-1)
                
                //Shaft 2
                GearShaftView().offset(x: 95, y: 260).zIndex(-1)
            }
            
            //MARK: - Fan
            Group {
                FanView().offset(x: 0, y: 250)
                    .frame(width: 140)
            }
        }
        //MARK: - Background
        .background(Image("goldBackground").resizable().aspectRatio(contentMode: .fill).frame(width: 400, height: 1000))
    }
}

#Preview {
    GearsContentView()
}
