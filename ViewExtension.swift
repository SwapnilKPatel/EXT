//
//  Extensions.swift
//  DemoProject(ChoosePicture)
//
//  Created by Ravi Chokshi on 23/05/19.
//  Copyright © 2019 Ravi Chokshi. All rights reserved.
//

import UIKit

public extension UIView {
    
    
    func addBorder(width : CGFloat = 1.0, color : UIColor = UIColor.lightGray  ) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    func removeBorder(width : CGFloat = 0.0, color : UIColor = UIColor.clear  ) {
        
        layer.borderWidth = 0.0
        layer.borderColor = color.cgColor
    }
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 1.0
        self.layer.shadowOffset =  CGSize(width: 0.0, height: 0.0)
    }
    /// Returns the user interface direction.
    var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        return UIView.userInterfaceLayoutDirection(for: semanticContentAttribute)
    }
    /// Adds activity indicator to the center of the view.
    ///
    /// - Parameters:
    ///   - style: The basic appearance of the activity indicator.
    ///   - color: The color of the activity indicator.
    ///   - size: The frame rectangle for the view, measured in points.
    /// - Returns: Returns an instance of the activity indicator.
    func makeActivityIndicator(
        style: UIActivityIndicatorView.Style = .whiteLarge,
        color: UIColor = .gray,
        size: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40)) -> UIActivityIndicatorView
    {
        let activityIndicator = UIActivityIndicatorView(frame: size).with {
            $0.style = style
            $0.color = color
            $0.hidesWhenStopped = true
            $0.center = center
        }
        
        addSubview(activityIndicator)
        
        return activityIndicator
    }
    
    
   
    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            
            layer.borderColor = color.cgColor
        }
    }
    
    /// Border width of view; also inspectable from Storyboard.
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    /// Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(
        ofColor color: UIColor = .black,
        radius: CGFloat = 3,
        offset: CGSize = .zero,
        opacity: Float = 0.5)
    {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    /// Unarchives the contents of a XIB file associated with the receiver.
    ///
    /// - Parameters:
    ///   - name: The name of the XIB file. Defaults to the type's class name.
    /// - Returns: The instantiated type with its associated XIB unarchived.
    static func loadNIB(named name: String? = nil) -> Self {
        // Internal function used to handle generics and
        // returning the actual view type instead of `UIView`.
        func loadNIBHelper<T>(named name: String? = nil) -> T where T: UIView {
            let bundle = Bundle(for: T.self)
            let name = name ?? String(describing: T.self)
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        
        return loadNIBHelper(named: name)
    }
    /// A Boolean value that determines whether the view is visible.
    var isVisible: Bool {
        get { return !isHidden }
        set { isHidden = !newValue }
    }
    
    /// Returns the width of the frame.
    var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    
    /// Returns the height of the frame.
    var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    
    /// Get view's parent view controller
    var parentViewController: UIViewController? {
        // https://github.com/SwifterSwift
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}








//extension UITextView :UITextViewDelegate
//{
//    
//    /// Resize the placeholder when the UITextView bounds change
//    override open var bounds: CGRect {
//        didSet {
//            self.resizePlaceholder()
//        }
//    }
//    
//    /// The UITextView placeholder text
//    public var placeholder: String? {
//        get {
//            var placeholderText: String?
//            
//            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
//            
//                placeholderText = placeholderLabel.text
//            }
//            
//            return placeholderText
//        }
//        set {
//            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
//                placeholderLabel.text = newValue
//                placeholderLabel.sizeToFit()
//            } else {
//                self.addPlaceholder(newValue!)
//            }
//        }
//    }
//    
//    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
//    ///
//    /// - Parameter textView: The UITextView that got updated
//    public func textViewDidChange(_ textView: UITextView) {
//        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
//            placeholderLabel.isHidden = self.text.count > 0
//        }
//    }
//    
//    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
//    private func resizePlaceholder() {
//        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
//            let labelX = self.textContainer.lineFragmentPadding
//            let labelY = self.textContainerInset.top - 2
//            let labelWidth = self.frame.width - (labelX * 2)
//            let labelHeight = placeholderLabel.frame.height
//            
//            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
//        }
//    }
//    
//    /// Adds a placeholder UILabel to this UITextView
//    private func addPlaceholder(_ placeholderText: String) {
//        let placeholderLabel = UILabel()
//        
//        placeholderLabel.text = placeholderText
//        placeholderLabel.textAlignment = .center
//        placeholderLabel.sizeToFit()
//        
//        placeholderLabel.font = self.font
//        placeholderLabel.textColor = UIColor.lightGray
//        placeholderLabel.tag = 100
//        
//        placeholderLabel.isHidden = self.text.count > 0
//        
//        self.addSubview(placeholderLabel)
//        self.resizePlaceholder()
//        self.delegate = self
//    }
//}
enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView {
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 3), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -3), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
extension UIColor{
    
    
   
}
