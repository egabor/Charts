//
//  PieRadarChartHighlighter.swift
//  Charts
//
//  Created by Daniel Cohen Gindi on 26/7/15.

//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics

public class PieRadarChartHighlighter: ChartHighlighter
{    
    public override func getHighlight(x x: CGFloat, y: CGFloat) -> ChartHighlight?
    {
        guard let chart = self.chart as? PieRadarChartViewBase
            else { return nil }
        
        let touchDistanceToCenter = chart.distanceToCenter(x: x, y: y)
        
        // check if a slice was touched
        if touchDistanceToCenter > chart.radius
        {
            // if no slice was touched, highlight nothing
            return nil
        }
        else
        {
            var angle = chart.angleForPoint(x: x ,y: y)
            
            if chart is PieChartView
            {
                angle /= CGFloat(chart.chartAnimator.phaseY)
            }
            
            let index = chart.indexForAngle(angle)
            
            // check if the index could be found
            if index < 0 || index >= chart.data?.maxEntryCountSet?.entryCount ?? 0
            {
                return nil
            }
            else
            {
                return closestHighlight(index: index, x: x, y: y);
            }
        }
    }
    
    /// Returns the closest Highlight object of the given objects based on the touch position inside the chart.
    /// - parameter index:
    /// - parameter x:
    /// - parameter y:
    public func closestHighlight(index index: Int, x: CGFloat, y: CGFloat) -> ChartHighlight?
    {
        fatalError("closestHighlight(index, x, y) cannot be called on PieRadarChartHighlighter")
    }
}