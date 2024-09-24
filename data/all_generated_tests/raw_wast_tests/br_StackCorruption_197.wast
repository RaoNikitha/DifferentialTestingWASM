;; 8. **Multiple Branches from a Block:**    Implement a control structure where multiple branches originate from a single block, each targeting different labels. Validate if the stack restoration differentiates correctly between branches and unwinds to the correct levels.

(assert_invalid
  (module
    (func $multiple-branches-from-block
      (block
        (block (br 1))  ; Branch to the outer block
        (block (br 0))  ; Branch to the current block
      )
      (i32.const 1)
      (br 2)  ; Invalid branch to a non-existent label
    )
  )
  "unknown label"
)