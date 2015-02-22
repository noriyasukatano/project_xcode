//
//  NotesListViewController.swift
//  SwiftTextKitNotepad
//
//  Created by Gabriel Hauber on 18/07/2014.
//  Copyright (c) 2014 Gabriel Hauber. All rights reserved.
//

import UIKit

class NotesListViewController: UITableViewController {

  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    // whenever this view controller appears, reload the table. This allows it to reflect any changes
    // made whilst editing notes
    tableView.reloadData()
  }


  // #pragma mark - Table view data source

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes.count
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

    // Configure the cell...
    let note = notes[indexPath.row]
    cell.textLabel?.text = note.title

    return cell
  }


  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    if let editorVC = segue.destinationViewController as? NoteEditorViewController {

      if "CellSelected" == segue.identifier {
        if let path = tableView.indexPathForSelectedRow() {
          editorVC.note = notes[path.row]
        }

      } else if "AddNewNote" == segue.identifier {
        let note = Note(text: " ")
        editorVC.note = note
        notes.append(note)
      }
    }
  }

}
