;; 7. **Test Name: Relative Label Lookup Error**    **Description:** Construct a test where relative label lookup for `br_if` is incorrectly implemented, causing it to misinterpret label indices.    **Infinite Loop Relation:** Relative lookup errors can misdirect the branch, causing the program to stick within the loop perpetually.

(assert_invalid
  (module (func $relative-label-lookup-error
    (block
      (loop
        (br_if 1 (i32.const 1))
      )
    )
  ))
  "unknown label"
)