;; 4. **Test 4**:    - **Description**: Nested `call` instructions within loops where each block manipulates local and global variables.    - **Constraint Checked**: Validates that stack and variable states are correctly preserved across nested function calls and loop iterations.    - **Relation to Block Nesting**: Ensures variable scope and stack manipulations are properly nested.

(assert_invalid
  (module
    (global $g i32 (i32.const 0))
    (func $test-loop
      (local $i i32)
      (block
        (loop $loop
          (call $nested-call)
          (local.set $i (i32.add (local.get $i) (i32.const 1)))
          (br_if $loop (i32.lt_s (local.get $i) (i32.const 10)))
        )
      )
    )
    (func $nested-call
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
    )
  )
  "type mismatch"
)