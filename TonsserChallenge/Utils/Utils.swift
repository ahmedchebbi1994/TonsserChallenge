//
//  MTAPIClient.swift
//  TonsserChallenge
//
//  Created by Ahmed CHEBBI on 10/07/2020.
//  Copyright © 2020 Tonsser. All rights reserved.
//


import UIKit

typealias JSON = [String : Any]
fileprivate let imageCache = NSCache<NSString, UIImage>()

extension NSError {
    static func generalParsingError(domain: String) -> Error {
        return NSError(domain: domain, code: 400, userInfo: [NSLocalizedDescriptionKey : NSLocalizedString("Error retrieving data", comment: "General Parsing Error Description")])
    }
}

class MTAPIClient {
    
    //MARK: - Public
    static func downloadImage(url: URL, completion: @escaping (_ image: UIImage?, _ error: Error? ) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage, nil)
        } else {
            MTAPIClient.downloadData(url: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data, let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image, nil)
                } else {
                    completion(nil, NSError.generalParsingError(domain: url.absoluteString))
                }
            }
        }
    }
    //MARK: - Private
    fileprivate static func downloadData(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession(configuration: .ephemeral).dataTask(with: URLRequest(url: url)) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
}
extension UIImageView {

    func addCircleGradiendBorder(_ width: CGFloat) {
           let gradient = CAGradientLayer()
           gradient.frame =  CGRect(origin: CGPoint.zero, size: bounds.size)
           let colors: [CGColor] = [UIColor(red:87.0/255, green:206.0/255, blue: 172.0/255, alpha:0.71).cgColor,UIColor(red:44.0/255, green:192.0/255, blue:208.0/255, alpha:1.0).cgColor]
           gradient.colors = colors
           gradient.startPoint = CGPoint(x: 1, y: 0.5)
           gradient.endPoint = CGPoint(x: 0, y: 0.5)
           
           let cornerRadius = frame.size.width / 2
           layer.cornerRadius = cornerRadius
           clipsToBounds = true
           
           let shape = CAShapeLayer()
           let path = UIBezierPath(ovalIn: bounds)
           
           shape.lineWidth = width
           shape.path = path.cgPath
           shape.strokeColor = UIColor.black.cgColor
           shape.fillColor = UIColor.clear.cgColor // clear
           gradient.mask = shape
           
           layer.insertSublayer(gradient, below: layer)
       }
       
}
 
extension UIStackView {
    func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = backgroundColor
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        
        subView.layer.cornerRadius = radiusSize
        subView.layer.masksToBounds = true
        subView.clipsToBounds = true
        
        subView.layer.masksToBounds = false
        subView.layer.shadowRadius = 1
        subView.layer.shadowOpacity = 1
        subView.layer.shadowColor = UIColor.gray.cgColor
        subView.layer.shadowOffset = CGSize(width: 0 , height:1)
    }
    
}
extension UIViewController {
    private static let association = ObjectAssociation<UIActivityIndicatorView>()
    
    var indicator: UIActivityIndicatorView {
        set { UIViewController.association[self] = newValue }
        get {
            if let indicator = UIViewController.association[self] {
                return indicator
            } else {
                UIViewController.association[self] = UIActivityIndicatorView.customIndicator(at: self.view.center)
                return UIViewController.association[self]!
            }
        }
    }
    
    // MARK: - Acitivity Indicator
    public func startIndicatingActivity() {
        DispatchQueue.main.async {
            self.view.addSubview(self.indicator)
            //Constrain Animation
            self.indicator.center = self.view.center
            self.indicator.startAnimating()
        }
    }
    
    public func stopIndicatingActivity() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
}

public final class ObjectAssociation<T: AnyObject> {
    
    private let policy: objc_AssociationPolicy
    
    /// - Parameter policy: An association policy that will be used when linking objects.
    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }
    
    /// Accesses associated object.
    /// - Parameter index: An object whose associated object is to be accessed.
    public subscript(index: AnyObject) -> T? {
        get { return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T? }
        set { objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy) }
    }
}

extension UIActivityIndicatorView {
    public static func customIndicator(at center: CGPoint) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        indicator.layer.cornerRadius = 10
        indicator.center = center
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.color = .white
        indicator.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.5)
        return indicator
    }
}
