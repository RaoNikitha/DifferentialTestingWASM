;; Test 1: A `block` with nested `br` instructions that create multiple branches, testing if the stack is properly unwound to the correct height when `end` is reached and checking for possible stack corruption.

(assert_invalid
  (module (func $nested-blocks-stack-unwind (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 42)
        (br 1)
      )
      (i32.const 0)
      (br 0)
    )
  ))
  "type mismatch"
)