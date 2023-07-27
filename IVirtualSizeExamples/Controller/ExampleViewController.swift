//
//  ExampleViewController.swift
//  IVirtualSizeExamples
//
//  Created by RenhardJH on 27/07/23.
//

import UIKit

class ExampleViewController: UIViewController {

    private let headerStackView = UIStackView()
    private let headerBackgroundView = UIView()
    private let icon = UIImageView()
    private let titleLabel = UILabel()
    private let mainImageView = UIView()
    private let mainImageViewLabel = UILabel()
    private let storyByLabel = UILabel()
    private let multilineText = UILabel()
    private let bottomText = UILabel()
    private let bottomIconOne = UIImageView()
    private let bottomIconTwo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Test View Controller"
        view.backgroundColor = .white
        view.tintColor = .red
        navigationController?.navigationBar.prefersLargeTitles = true
        let horizontalPadding: CGFloat = 20

        headerStackView.distribution = .fillProportionally
        headerStackView.alignment = .center
        headerStackView.spacing = 10
        headerStackView.place(on: view).pin(.top(to: view.safeAreaLayoutGuide),
                                            .horizontalEdges(padding: horizontalPadding),
                                            .fixedHeight(50))
        headerBackgroundView.place(on: headerStackView).pin(.top,
                                                            .bottom,
                                                            .width)
        headerBackgroundView.layer.cornerRadius = 5

        headerStackView.addArrangedSubview(icon)
        headerStackView.addArrangedSubview(titleLabel)

        headerBackgroundView.backgroundColor = .lightGray

        titleLabel.text = "The Lorem Ipsum"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage(systemName: "arrow.up.right.diamond.fill")

        mainImageView.backgroundColor = .systemGreen
        mainImageView.layer.cornerRadius = 5
        mainImageView.place(on: view).pin(.top(to: headerStackView, .bottom, padding: horizontalPadding),
                                          .leading(padding: horizontalPadding),
                                          .trailing(padding: horizontalPadding),
                                          .fixedHeight(200))

        mainImageViewLabel.text = "Lorem Ipsum"
        mainImageViewLabel.font = .systemFont(ofSize: 8, weight: .ultraLight)
        mainImageViewLabel.place(on: view).pin(.top(to: mainImageView, .bottom, padding: 2),
                                               .leading(padding: horizontalPadding),
                                               .trailing(padding: horizontalPadding))

        storyByLabel.text = "Lorem Ipsum Dolor Sit Amet"
        storyByLabel.place(on: view).pin(.top(to: mainImageViewLabel, .bottom, padding: 12),
                                         .leading(padding: horizontalPadding),
                                         .trailing(padding: horizontalPadding))

        multilineText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        multilineText.numberOfLines = 0
        multilineText.font = .systemFont(ofSize: 20, weight: .thin)
        multilineText.place(on: view).pin(.top(to: storyByLabel, .bottom, padding: 8),
                                          .leading(padding: horizontalPadding),
                                          .trailing(padding: horizontalPadding))

        bottomText.text = "LEFT BOTTOM"
        bottomText.place(on: view).pin(.bottom(to: view.safeAreaLayoutGuide, padding: horizontalPadding),
                                       .leading(padding: horizontalPadding))

        bottomIconOne.image = UIImage(systemName: "arrow.right.to.line")
        bottomIconTwo.image = UIImage(systemName: "arrow.left.to.line")

        bottomIconOne.place(on: view).pin(.bottom(to: view.safeAreaLayoutGuide, padding: horizontalPadding),
                                          .trailing(padding: horizontalPadding))
        bottomIconTwo.place(on: view).pin(.bottom(to: view.safeAreaLayoutGuide, padding: horizontalPadding),
                                          .trailing(to: bottomIconOne, .leading, padding: 10))
    }
}
