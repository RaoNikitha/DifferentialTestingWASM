;; 9. Combine `br` instructions with `call` instructions, invoking functions that alter the stack with arguments and return values, to test the stack integrity post-branch. Stack corruption can occur if function calls incorrectly handle the stack in conjunction with `br` instructions.

(assert_invalid
  (module
    (func $callee (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $test
      (block
        (i32.const 5)
        (call $callee)
        (br 0)
      )
    )
  )
  "type mismatch"
)