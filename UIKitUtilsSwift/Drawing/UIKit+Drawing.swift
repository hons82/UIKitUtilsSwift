//
//  UIKit+Drawing.swift
//  UIKitUtilsSwift
//
//  Created by Hannes Tribus on 16/11/15.
//  Copyright © 2015 3Bus. All rights reserved.
//

import UIKit

public func CGPathAddRoundedRectSimple(path: CGMutablePathRef, rect: CGRect, radius: CGFloat) {
    var radiusAdj = radius
    if (2 * radiusAdj > rect.size.height) {
        radiusAdj = rect.size.height / 2.0
    }
    if (2 * radiusAdj > rect.size.width) {
        radiusAdj = rect.size.width / 2.0
    }
    CGPathAddArc(path, nil, rect.origin.x + radiusAdj, rect.origin.y + radiusAdj, radiusAdj, CGFloat(M_PI), CGFloat(M_PI * 1.5), Bool(0))
    CGPathAddArc(path, nil, rect.origin.x + rect.size.width - radiusAdj, rect.origin.y + radiusAdj, radiusAdj, CGFloat(M_PI * 1.5), CGFloat(M_PI * 2), Bool(0))
    CGPathAddArc(path, nil, rect.origin.x + rect.size.width - radiusAdj, rect.origin.y + rect.size.height - radiusAdj, radiusAdj, CGFloat(M_PI * 2), CGFloat(M_PI * 0.5), Bool(0))
    CGPathAddArc(path, nil, rect.origin.x + radiusAdj, rect.origin.y + rect.size.height - radiusAdj, radiusAdj, CGFloat(M_PI * 0.5), CGFloat(M_PI), Bool(0))
    CGPathAddLineToPoint(path, nil, rect.origin.x, rect.origin.y + radiusAdj)
}

public func CGContextAddRoundedRect(context: CGContextRef, rect: CGRect, radius: CGFloat) {
    var radiusAdj = radius
    if (2 * radiusAdj > rect.size.height) {
        radiusAdj = rect.size.height / 2.0
    }
    if (2 * radiusAdj > rect.size.width) {
        radiusAdj = rect.size.width / 2.0
    }
    CGContextAddArc(context, rect.origin.x + radiusAdj, rect.origin.y + radiusAdj, radiusAdj, CGFloat(M_PI), CGFloat(M_PI * 1.5), 0)
    CGContextAddArc(context, rect.origin.x + rect.size.width - radiusAdj, rect.origin.y + radiusAdj, radiusAdj, CGFloat(M_PI * 1.5), CGFloat(M_PI * 2), 0)
    CGContextAddArc(context, rect.origin.x + rect.size.width - radiusAdj, rect.origin.y + rect.size.height - radiusAdj, radiusAdj, CGFloat(M_PI * 2), CGFloat(M_PI * 0.5), 0)
    CGContextAddArc(context, rect.origin.x + radiusAdj, rect.origin.y + rect.size.height - radiusAdj, radiusAdj, CGFloat(M_PI * 0.5), CGFloat(M_PI), 0)
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + radiusAdj)
}

public func CGContextStrokeRoundedRect(context: CGContextRef, rect: CGRect, radius: CGFloat) {
    CGContextBeginPath(context)
    CGContextAddRoundedRect(context, rect: rect, radius: radius)
    CGContextStrokePath(context)
}

public func CGContextFillRoundedRect(context: CGContextRef, rect: CGRect, radius: CGFloat) {
    CGContextBeginPath(context)
    CGContextAddRoundedRect(context, rect: rect, radius: radius)
    CGContextFillPath(context)
}

public func CGContextClipToRoundedRect(context: CGContextRef, rect: CGRect, radius: CGFloat) {
    CGContextBeginPath(context)
    CGContextAddRoundedRect(context, rect: rect, radius: radius)
    CGContextClip(context)
}

public func CGContextDrawLinearGradient(context: CGContextRef, colors: [UIColor], locations: [CGFloat], startPoint: CGPoint,  endPoint: CGPoint) {
    var arr = [CGColorRef]()
    for color in colors {
        arr.append(color.CGColor)
    }
    let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), arr, locations)
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, CGGradientDrawingOptions(rawValue: 0))
}

public func CGContextDrawLinearGradientOverRect(context: CGContextRef, colors: [UIColor], locations: [CGFloat], rect: CGRect) {
    CGContextDrawLinearGradient(context, colors: colors, locations: locations, startPoint: rect.origin, endPoint: CGPointMake(rect.origin.x, rect.origin.y + rect.size.height))
}

public func CGContextDrawSteelGradientOverRect(context: CGContextRef, rect: CGRect) {
    let locations:[CGFloat] = [ 0.0, 0.015, 0.985, 1.0 ]
    CGContextDrawLinearGradientOverRect(context, colors: [
        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0),
        UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0),
        UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        ],
        locations: locations, rect: rect)
}

public func CGContextDrawLightSteelGradientOverRect(context: CGContextRef, rect: CGRect) {
    let locations:[CGFloat] = [ 0.0, 0.025, 0.985, 1.0 ]
    CGContextDrawLinearGradientOverRect(context, colors: [
        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.0),
        UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0),
        UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        ],
        locations: locations, rect: rect)
}

public func CGContextDrawHighlightOverRect(context: CGContextRef, rect: CGRect) {
    let locations:[CGFloat] = [ 0.0, 0.02, 0.98, 1.0 ]
    CGContextDrawLinearGradientOverRect(context, colors: [
        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0),
        UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 0.0),
        UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
        ],
        locations: locations, rect: rect)
}

public func CGContextDrawDisclosureIndicatorAtPoint(context: CGContextRef, point: CGPoint) {
    var p = point
    let DISCLOSURE_IND_SIZE: CGFloat = 6
    CGContextSetLineWidth(context, 3)
    UIColor.blackColor().set()
    CGContextSetAlpha(context, 0.66)
    p.x += 0.5
    p.y += 0.5
    CGContextMoveToPoint(context, p.x, p.y)
    p.x += DISCLOSURE_IND_SIZE
    p.y += DISCLOSURE_IND_SIZE
    CGContextAddLineToPoint(context, p.x, p.y)
    p.x -= DISCLOSURE_IND_SIZE
    p.y += DISCLOSURE_IND_SIZE
    CGContextAddLineToPoint(context, p.x, p.y)
    CGContextStrokePath(context)
    CGContextSetAlpha(context, 1.0)
}
