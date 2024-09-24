;; 7. **Test 7**:    - A series of nested `block` and `loop` instructions, ending with an `if` block that branches outside of the deeply nested structure.    - Tests behavior when the `if` condition forces an exit from multiple nested structures.

(assert_invalid
  (module (func $nested-block-loop-if-branch
    (block 
      (loop 
        (if (i32.const 1) 
          (then (br 2))
        )
      )
    )
  ))
  "invalid branch depth"
)