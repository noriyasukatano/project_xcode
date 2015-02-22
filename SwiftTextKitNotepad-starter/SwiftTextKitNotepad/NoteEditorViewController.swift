//
//  NoteEditorViewController.swift
//  SwiftTextKitNotepad
//
//  Created by Gabriel Hauber on 18/07/2014.
//  Copyright (c) 2014 Gabriel Hauber. All rights reserved.
//

import UIKit

class NoteEditorViewController: UIViewController, UITextViewDelegate {

  @IBOutlet var textView: UITextView!

  var note: Note!

  override func viewDidLoad() {
    super.viewDidLoad()
    textView.text = note.contents
  }

  func textViewDidEndEditing(textView: UITextView!) {
    note.contents = textView.text
  }

}
