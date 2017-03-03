# SMToast

[![CI Status](http://img.shields.io/travis/mandrusiaks/SMToast.svg?style=flat)](https://travis-ci.org/mandrusiaks/SMToast)
[![Version](https://img.shields.io/cocoapods/v/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)
[![License](https://img.shields.io/cocoapods/l/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)
[![Platform](https://img.shields.io/cocoapods/p/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)

SMToast provides a fast and simple way to display a short message. It works great for showing error messages during development or notifying users of successful actions. 

| ![SMToast](SMToast/Assets/SMToast.png) | ![SMToast2](SMToast/Assets/SMToast2.png) |
|:--------------------------------------:|:-----------------------------------------|

## Installation

### CocoaPods

SMToast is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SMToast"
```

###Manual

Alternatively, you can simply add ```SMToast.swift``` to your project.

## Basic Examples

SMToast is extremely simple to use. Below show a few of SMToast's convenience initialization methods.

```swift

    SMToast(title: "Hello").make()

    SMToast(message: "This is a test toast").make()
    
    SMToast(title: "Hello", toastColor: .blue).make()

    SMToast(title: "Hello", message: "This is a test toast").make()

    SMToast(title: "Hello", message: "This is a test toast", duration: 6).make()

    SMToast(title: "Hello", message: "This is a test toast", fadeDuration: 3).make()

    SMToast(title: "Hello", message: "This is a test toast", toastColor: .blue, fontColor: .white).make()



    //Example of SMToast being created with all properties customized

    let toast = SMToast(title: "Hello", message: "This is a test toast", toastColor: .blue, 
                        fontColor: .white, duration: 3, fadeDuration: 1)
    toast.make()

```

## License

SMToast is available under the MIT license. See the LICENSE file for more info.
