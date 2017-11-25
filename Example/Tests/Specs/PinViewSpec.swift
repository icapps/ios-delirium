//
//  PinViewSpec.swift
//  Delirium
//
//  Created by Jelle Vandebeeck on 14/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots
import Delirium

class PinViewSpec: QuickSnapshotSpec {

    override func spec() {
        describe("pin view") {
            var view: PinView!
            beforeEach{
                let bundle = Bundle(for: self.classForCoder)
                let storyboard = UIStoryboard(name: "PinSpec", bundle: bundle)
                let controller = storyboard.instantiateInitialViewController()!
                view = controller.view.subviews.first as? PinView
            }

            it("should show an normal pin view") {
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct button size") {
                var configuration = PinConfiguration()
                configuration.buttonSize = 100.0
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct number of digits") {
                var configuration = PinConfiguration()
                configuration.numberOfDigits = 6
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct button font") {
                var configuration = PinConfiguration()
                configuration.buttonFont = UIFont.systemFont(ofSize: 20.0, weight: UIFont.Weight.heavy)
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct dot stroke color") {
                var configuration = PinConfiguration()
                configuration.dotStrokeColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct number stroke color") {
                var configuration = PinConfiguration()
                configuration.numberStrokeColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct clear stroke color") {
                var configuration = PinConfiguration()
                configuration.clearStrokeColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct clear text color") {
                var configuration = PinConfiguration()
                configuration.clearTextColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct background color") {
                var configuration = PinConfiguration()
                configuration.backgroundColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct number text color") {
                var configuration = PinConfiguration()
                configuration.numberTextColor = .green
                view.configuration = configuration
                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct selection background color") {
                var configuration = PinConfiguration()
                configuration.selectionBackgroundColor = .green
                view.configuration = configuration

                let button = view.subviews.filter { subview -> Bool in
                    if let button = subview as? PinButton {
                        switch button.type {
                        case .number(_):
                            return true
                        default:
                            return false
                        }
                    }
                    return false
                }.first as? UIButton
                button?.isHighlighted = true

                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should show the correct clear selection background color") {
                var configuration = PinConfiguration()
                configuration.clearSelectionBackgroundColor = .green
                view.configuration = configuration

                let button = view.subviews.filter { subview -> Bool in
                    if let button = subview as? PinButton {
                        switch button.type {
                        case .clear:
                            return true
                        default:
                            return false
                        }
                    }
                    return false
                    }.first as? UIButton
                button?.isHighlighted = true

                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should not show the correct selection background color") {
                var configuration = PinConfiguration()
                configuration.allowSelectionFeedback = false
                configuration.selectionBackgroundColor = .green
                view.configuration = configuration

                let button = view.subviews.filter { subview -> Bool in
                    if let button = subview as? PinButton {
                        switch button.type {
                        case .number(_):
                            return true
                        default:
                            return false
                        }
                    }
                    return false
                    }.first as? UIButton
                button?.isHighlighted = true

                self.expect📷ToHaveValidSnapshot(view)
            }

            it("should not show the correct clear selection background color") {
                var configuration = PinConfiguration()
                configuration.allowSelectionFeedback = false
                configuration.clearSelectionBackgroundColor = .green
                view.configuration = configuration

                let button = view.subviews.filter { subview -> Bool in
                    if let button = subview as? PinButton {
                        switch button.type {
                        case .clear:
                            return true
                        default:
                            return false
                        }
                    }
                    return false
                    }.first as? UIButton
                button?.isHighlighted = true
                
                self.expect📷ToHaveValidSnapshot(view)
            }
        }
    }
}
