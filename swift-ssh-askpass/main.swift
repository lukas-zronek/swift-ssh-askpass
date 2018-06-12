//
//  main.swift
//  swift-ssh-askpass
//
//  Created by Jeremy Beker on 9/28/16.
//  Copyright © 2016 Picosphere. All rights reserved.
//

import Foundation
import Cocoa

let application = NSApplication.shared
NSApp.setActivationPolicy(.accessory)
NSApp.activate(ignoringOtherApps: true)

let arguments = CommandLine.arguments
guard arguments.count > 1 else { exit(1) }
let message = arguments[1]

let alert = NSAlert()

alert.window.title = "Enter your passphrase"
alert.messageText = "SSH Agent"
alert.informativeText = message
alert.icon = NSImage(named: NSImage.Name.caution)
alert.alertStyle = .warning

let ok = alert.addButton(withTitle: "OK")
let cancel = alert.addButton(withTitle: "Cancel")

let passwordField = NSSecureTextField(frame: NSRect(x: 0, y: 0, width: 400, height: 24))

alert.accessoryView = passwordField
alert.window.initialFirstResponder = passwordField

switch (alert.runModal().rawValue) {
case 1000:
    print(passwordField.stringValue)
default:
    break
}
