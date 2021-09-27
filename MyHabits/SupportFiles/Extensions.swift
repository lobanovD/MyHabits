//
//  Extensions.swift
//  MyHabits
//
//  Created by Dmitrii Lobanov on 16.09.2021.
//

import UIKit

func stripTime(from originalDate: Date) -> Date {
    let components = Calendar.current.dateComponents([.hour, .minute], from: originalDate)
    let date = Calendar.current.date(from: components)
    return date!
}

// MARK: - UIStackView
public extension UIStackView {
    func addArrangedSubviews(_ subviews: UIView...) {
        for subview in subviews {
            self.addArrangedSubview(subview)
        }
    }
}

// MARK: - UIView
public extension UIView {
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - UIFont
extension UIFont {
    var bold: UIFont { return withWeight(.heavy) }
    var semibold: UIFont { return withWeight(.semibold) }

    private func withWeight(_ weight: UIFont.Weight) -> UIFont {
        var attributes = fontDescriptor.fontAttributes
        var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

        traits[.weight] = weight

        attributes[.name] = nil
        attributes[.traits] = traits
        attributes[.family] = familyName

        let descriptor = UIFontDescriptor(fontAttributes: attributes)

        return UIFont(descriptor: descriptor, size: pointSize)
    }
}
