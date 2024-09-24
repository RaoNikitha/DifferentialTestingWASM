;; 3. Create a code snippet where a loop contains a `return` statement ensuring the loop condition is bypassed, and verify if WebAssembly's `check_block` context maintains stack integrity versus the Wizard Engine’s `setUnreachable` logic.

(assert_invalid
  (module
    (func (result i32)
      (loop (br_if 1 (i32.const 1)) (return) (i32.const 0))
    )
  )
  "type mismatch"
)