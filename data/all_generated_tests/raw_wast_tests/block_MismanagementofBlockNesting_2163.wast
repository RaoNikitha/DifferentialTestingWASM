;; 4. **Test 4**:    Implement a test with a block nest containing a loop that is branched to from an outer block using `br`. Verify both engines handle the loop and resume correctly after the branch. This ensures proper handling of nested blocks with branching to loops.

(assert_invalid
  (module (func $nested-blocks-with-loop (result i32)
    (i32.const 5)
    (block (result i32)
      (block (result i32)
        (loop (result i32)
          (block
            (br 2)
          )
          (i32.const 42)
        )
      )
    )
  ))
  "type mismatch"
)