;; - **Test 5**: Create a loop with a `br_table` instruction where the table includes multiple branches, and the provided index exceeds the number of targets by one. Test if the engines correctly handle the transition to the default target when the index is just out of bounds.

(assert_invalid
  (module 
    (func (loop (result i32)
      (block (result i32)
        (i32.const 0) 
        (block (br_table 0 1 2 2)
          (i32.const 3)
        )
      )
    ))
  )
  "type mismatch"
)