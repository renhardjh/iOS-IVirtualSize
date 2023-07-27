//
//  IResizerView.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit

final class IResizerView: UIView {
    private let viewToResize: UIView
    private let startingFrame: CGRect
    let slider = UISlider()

    init(viewToResize: UIView) {
        self.viewToResize = viewToResize
        self.startingFrame = viewToResize.frame
        super.init(frame: .zero)

        slider.backgroundColor = .white
        slider.tintColor = .black
        slider.layer.cornerRadius = 10
        slider.addTarget(self, action: #selector(didChangeHeight), for: .valueChanged)
        slider.minimumValue = 50
        slider.maximumValue = Float(startingFrame.height)
        slider.value = Float(startingFrame.height)
        slider.place(on: self).pin(.allEdges)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didChangeHeight() {
        let height = CGFloat(slider.value)
        let width = height * CGFloat(startingFrame.width / startingFrame.height)
        let newX = (startingFrame.width - width) / 2
        let newY = (startingFrame.height - height) / 2
        viewToResize.frame = CGRect(origin: CGPoint(x: newX, y: newY),
                                    size: CGSize(width: width, height: height))
    }
}
