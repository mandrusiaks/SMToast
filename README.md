# SMToast

[![CI Status](http://img.shields.io/travis/mandrusiaks/SMToast.svg?style=flat)](https://travis-ci.org/mandrusiaks/SMToast)
[![Version](https://img.shields.io/cocoapods/v/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)
[![License](https://img.shields.io/cocoapods/l/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)
[![Platform](https://img.shields.io/cocoapods/p/SMToast.svg?style=flat)](http://cocoapods.org/pods/SMToast)

SMToast provides a fast and simple way to display a short message. Great for showing error messages during development. 

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

SMToast is extremely simple to use. Below are examples of how to user SMToast. 

```swift

    SMToast.make(title: "Hello", message: "This is a test toast", toastColor: .blue, fontColor: .white)

    SMToast.make(title: "Hello", toastColor: .blue)

    SMToast.make(title: "Hello", message: "This is a test toast")

    SMToast.make(message: "This is a test toast")

    SMToast.make(title: "Hello")

```

## License

SMToast is available under the MIT license. See the LICENSE file for more info.
