//
//  CircularProgressView.swift
//  Formuleer
//
//  Created by Ansyar Hafid on 08/03/24.
//  Copyright © 2024 Ansyar Hafid. All rights reserved.
//

import UIKit
import FXCoreUI

public class CircularProgressView: UIView {
    @IBOutlet private var contentView: UIView!
    
    private var totalTasksTitleLabel = UILabel()
    private var TotalTasksLabel = UILabel()
    private var doneLayer = CAShapeLayer()
    private var todoLayer = CAShapeLayer()
    private var pendingLayer = CAShapeLayer()
    private var backgroundLayer = CAShapeLayer()

    public var totalTasks: Int = 25 {
        didSet {
            TotalTasksLabel.text = "\(totalTasks)"
            setNeedsDisplay()
        }
    }

    // Public properties for configuration
    public var donePercentage: CGFloat = 0.0 {
        didSet {
            drawProgress()
        }
    }

    public var todoPercentage: CGFloat = 0.0 {
        didSet {
            drawProgress()
        }
    }

    public var pendingPercentage: CGFloat = 0.0 {
        didSet {
            drawProgress()
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        self.contentMode = .redraw
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        self.contentMode = .redraw
    }
    
    private func commonInit() {
        if let nibView = Bundle.module.loadNibNamed(String(describing: CircularProgressView.self),
                                                  owner: self,
                                                  options: nil)?.first as? UIView {
            contentView = nibView
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }

        setupView()
    }
    
    private func setupView() {
        // Initialize the background layer
        backgroundLayer.lineWidth = 20.0
        backgroundLayer.fillColor = nil
        backgroundLayer.strokeColor = UIColor.FlexColor.snowWhite.cgColor
        layer.addSublayer(backgroundLayer)

        // Initialize the progress layers
        [pendingLayer, doneLayer, todoLayer].forEach { layer in
            layer.lineWidth = 20.0
            layer.fillColor = nil
            layer.strokeEnd = 0.0
            self.layer.addSublayer(layer)
        }

        // Configure progress layer colors
        doneLayer.strokeColor = UIColor.systemOrange.cgColor
        todoLayer.strokeColor = UIColor.systemYellow.cgColor
        pendingLayer.strokeColor = UIColor.systemBlue.cgColor

        // Configure the total projects title label
        totalTasksTitleLabel.attributedText = .label3Regular("Total Tasks",
                                                                alignment: .center,
                                                                additionalAttribute: [.foregroundColor: UIColor.FlexColor.gray])
        addSubview(totalTasksTitleLabel)
        
        // Configure the total projects label
        let totalValue = String(totalTasks)
        TotalTasksLabel.attributedText = .headline1ExtraBold(totalValue,
                                                           alignment: .center,
                                                           additionalAttribute: [.foregroundColor: UIColor.FlexColor.black])
        addSubview(TotalTasksLabel)
    }

    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        // Set the totalProjectsLabel size
        let labelHeight: CGFloat = 22 // Adjust the height as necessary
        let labelWidth = bounds.width
        let totalLabelSize = TotalTasksLabel.sizeThatFits(CGSize(width: labelWidth, 
                                                                    height: CGFloat.greatestFiniteMagnitude))
        let titleLabelSize = totalTasksTitleLabel.sizeThatFits(CGSize(width: labelWidth, 
                                                                         height: CGFloat.greatestFiniteMagnitude))
        
        // Calculate the combined height of both labels
        let combinedHeight = totalLabelSize.height + titleLabelSize.height
        
        // Position the totalProjectsTitleLabel above the totalProjectsLabel
        totalTasksTitleLabel.frame = CGRect(x: 0, 
                                               y: (bounds.height - combinedHeight) / 2,
                                               width: labelWidth,
                                               height: titleLabelSize.height)
        
        // Position the totalProjectsLabel below the totalProjectsTitleLabel
        TotalTasksLabel.frame = CGRect(x: 0, 
                                          y: totalTasksTitleLabel.frame.maxY,
                                          width: labelWidth,
                                          height: totalLabelSize.height)
        
        // Ensure that the drawProgress method is called to update the view
        drawProgress()
    }

    
    private func drawProgress() {
        // First, remove all existing progress layers to avoid layer duplication.
        [doneLayer, todoLayer, pendingLayer].forEach { $0.removeFromSuperlayer() }

        let lineWidth: CGFloat = 20.0  // Consistent line width for all layers.
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = (min(bounds.width, bounds.height) / 2) - (lineWidth / 2)

        // Define a full circle path for the background layer
        let fullCirclePath = UIBezierPath(arcCenter: centerPoint, 
                                          radius: radius, startAngle: -(.pi / 2),
                                          endAngle: (.pi * 2) - (.pi / 2),
                                          clockwise: true)
        
        configureLayer(layer: backgroundLayer, 
                       path: fullCirclePath.cgPath,
                       lineWidth: lineWidth,
                       strokeColor: UIColor.FlexColor.paleGray.cgColor,
                       strokeEnd: 1.0)

        // Create an array of tuples (layer, percentage)
        let progressTuples = [
            (doneLayer, donePercentage),
            (todoLayer, todoPercentage),
            (pendingLayer, pendingPercentage)
        ]
        
        // Sort the array based on the percentage, in descending order
        let sortedLayers = progressTuples.sorted { $0.1 > $1.1 }
        
        // Add the layers to the view's layer, according to their sorted order
        for (layer, percentage) in sortedLayers {
            configureLayer(layer: layer, 
                           path: fullCirclePath.cgPath,
                           lineWidth: lineWidth,
                           strokeColor: layer.strokeColor!,
                           strokeEnd: percentage / 100)
        }

        animateStrokeEnd(for: doneLayer, toValue: donePercentage / 100)
        animateStrokeEnd(for: todoLayer, toValue: todoPercentage / 100)
        animateStrokeEnd(for: pendingLayer, toValue: pendingPercentage / 100)
    }

    private func configureLayer(layer: CAShapeLayer, path: CGPath, lineWidth: CGFloat, strokeColor: CGColor, strokeEnd: CGFloat) {
        layer.path = path
        layer.lineWidth = lineWidth
        layer.strokeColor = strokeColor
        layer.fillColor = nil
        layer.lineCap = .round // Assuming you want rounded caps.
        layer.strokeEnd = strokeEnd
        self.layer.addSublayer(layer) // Add the layer to your view's layer.
    }




    private func animateStrokeEnd(for layer: CAShapeLayer, toValue: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = toValue
        animation.duration = 0.5
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        layer.add(animation, forKey: "strokeEnd")
    }
}
