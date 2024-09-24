;; 1. Create a `br_table` instruction with an index pointing to an entry that is out of bounds. This should test whether the implementations correctly handle index range checks and trigger an error or default behavior. This checks the target label validity constraint.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32)
        (br_table 0 2 (i32.const 0) (i32.const 0))
      )
    )
  ))
  "unknown label"
)