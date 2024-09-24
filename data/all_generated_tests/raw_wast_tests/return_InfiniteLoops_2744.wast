;; 3. **Multiple `br_if` with Deep Stack**: Implement a scenario with multiple layers of loops and conditional `br_if` statements. Verify if stack unwinding and `return` operate correctly within loops, avoiding being caught in an infinite loop in the Wizard Engine due to improper stack management.

(assert_invalid
  (module
    (func $multiple-br_if-deep-stack (result i32)
      (block (loop (loop (block
        (br_if 1 (i32.const 1))
        (br_if 0 (i32.const 1))
        (br_if 2 (return (i32.const 2)))
      ))))
      (i32.const 0)
    )
  )
  "type mismatch"
)