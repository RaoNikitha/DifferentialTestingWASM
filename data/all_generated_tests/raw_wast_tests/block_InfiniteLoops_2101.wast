;; Test 2: Implement a nested block structure where the inner block contains a loop that should exit on an `i32.eqz` condition but doesn’t due to incorrect stack handling. The outer block type requires an `i32` result. Verify if WebAssembly manages the nested block correctly and exits, while `wizard_engine` gets stuck in an infinite loop.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (loop
            (br_if 1 (i32.eqz (i32.const 0)))
            (br 0)
          )
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)