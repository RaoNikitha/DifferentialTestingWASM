;; Test 5: Nest multiple blocks within a function with alternating returns and `unreachable` instructions. Confirm that each return instruction correctly identifies and skips the outer block’s `unreachable` code.

(assert_invalid
  (module
    (func $nested-blocks-with-return (result i32)
      (i32.const 0)
      (block 
        (block 
          (block
            (return)
            unreachable
          )
          unreachable
        )
        unreachable
      )
    )
  )
  "type mismatch"
)