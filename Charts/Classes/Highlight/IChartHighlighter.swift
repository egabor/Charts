//
//  IChartHighlighter.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

@objc
public protocol IChartHighlighter : NSObjectProtocol
{
    /// Returns a Highlight object corresponding to the given x- and y- touch positions in pixels.
    /// - parameter x:
    /// - parameter y:
    /// - returns:
    func getHighlight(x x: CGFloat, y: CGFloat) -> ChartHighlight?
}