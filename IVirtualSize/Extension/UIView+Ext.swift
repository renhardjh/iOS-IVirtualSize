//
//  UIView+Ext.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit


enum Constraint {
    case relative(NSLayoutConstraint.Attribute, CGFloat, to: Anchorable? = nil, NSLayoutConstraint.Attribute? = nil)
    case fixed(NSLayoutConstraint.Attribute, CGFloat)
    case multiple([Constraint])
}

extension Constraint {
    static var top: Constraint = .top()
    static var bottom: Constraint = .bottom()
    static var trailing: Constraint = .trailing()
    static var leading: Constraint = .leading()
    static var width: Constraint = .width()
    static var height: Constraint = .height()
    static var centerX: Constraint = .centerX()
    static var centerY: Constraint = .centerY()
    static var verticalEdges: Constraint = .verticalEdges()
    static var horizontalEdges: Constraint = .horizontalEdges()
    static var allEdges: Constraint = .allEdges()

    static func bottom(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.bottom, -padding, to: anchors)
    }
    static func top(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.top, padding, to: anchors)
    }
    static func leading(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.leading, padding, to: anchors)
    }
    static func trailing(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.trailing, -padding, to: anchors)
    }

    static func bottom(to anchors: Anchorable? = nil, _ toAttribute: NSLayoutConstraint.Attribute? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.bottom, -padding, to: anchors, toAttribute)
    }
    static func top(to anchors: Anchorable? = nil, _ toAttribute: NSLayoutConstraint.Attribute? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.top, padding, to: anchors, toAttribute)
    }
    static func leading(to anchors: Anchorable? = nil, _ toAttribute: NSLayoutConstraint.Attribute? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.leading, padding, to: anchors, toAttribute)
    }
    static func trailing(to anchors: Anchorable? = nil, _ toAttribute: NSLayoutConstraint.Attribute? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.trailing, -padding, to: anchors, toAttribute)
    }

    static func fixedWidth(_ constant: CGFloat) -> Constraint {
        .fixed(.width, constant)
    }
    static func fixedHeight(_ constant: CGFloat) -> Constraint {
        .fixed(.height, constant)
    }
    static func width(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.width, padding, to: anchors)
    }
    static func height(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.height, padding, to: anchors)
    }
    static func centerX(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.centerX, padding, to: anchors)
    }
    static func centerY(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .relative(.centerY, padding, to: anchors)
    }

    static func verticalEdges(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .multiple([.top(to: anchors, padding: padding), .bottom(to: anchors, padding: padding)])
    }
    static func horizontalEdges(to anchors: Anchorable? = nil, padding: CGFloat = 0) -> Constraint {
        .multiple([.leading(to: anchors, padding: padding), .trailing(to: anchors, padding: padding)])
    }
    static func allEdges(to anchors: Anchorable? = nil, padding:  CGFloat = 0) -> Constraint {
        .multiple([.horizontalEdges(to: anchors, padding: padding), .verticalEdges(to: anchors, padding: padding)])
    }
}

extension NSLayoutConstraint {
    convenience init(item: Any, attribute: Attribute, toItem: Any? = nil, toAttribute: Attribute = .notAnAttribute, constant: CGFloat) {
        self.init(item: item,
                  attribute: attribute,
                  relatedBy: .equal,
                  toItem: toItem,
                  attribute: toAttribute,
                  multiplier: 1,
                  constant: constant)
    }
}

extension UIView {
    func addResizer() {
        let slider = IResizerView(viewToResize: self)
        addSubview(slider)
        slider.place(on: self).pin(.centerX, .bottom(to: self.window?.safeAreaLayoutGuide, padding: 100), .fixedWidth(200))
    }

    func removeResizer() {
        subviews.compactMap { $0 as? IResizerView }.forEach { $0.removeFromSuperview() }
    }
}

extension UIView {
    @discardableResult
    func place(on view: UIView) -> UIView {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    @discardableResult
    func pin(_ constraints: Constraint...) -> UIView {
        self.translatesAutoresizingMaskIntoConstraints = false
        apply(constraints)
        return self
    }

    private func apply(_ constraints: [Constraint]) {
        for constraint in constraints {
            switch constraint {
            case .relative(let attribute, let constant, let toItem, let toAttribute):
                NSLayoutConstraint(item: self,
                                   attribute: attribute,
                                   toItem: toItem ?? self.superview!,
                                   toAttribute: toAttribute ?? attribute,
                                   constant: constant).isActive = true
            case .fixed(let attribute, let constant):
                NSLayoutConstraint(item: self,
                                   attribute: attribute,
                                   constant: constant).isActive = true
            case .multiple(let constraints):
                apply(constraints)
            }
        }
    }
}

protocol Anchorable {
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
    var widthAnchor: NSLayoutDimension { get }
    var heightAnchor: NSLayoutDimension { get }
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
}

extension UIView: Anchorable { }
extension UILayoutGuide: Anchorable {
    var firstBaselineAnchor: NSLayoutYAxisAnchor {
        preconditionFailure("UILayoutGuide does not support firstBaselineAnchor")
    }

    var lastBaselineAnchor: NSLayoutYAxisAnchor {
        preconditionFailure("UILayoutGuide does not support firstBaselineAnchor")
    }
}
