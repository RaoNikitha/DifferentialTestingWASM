;; 1. **Test 1**: Define an `if` block with a `then` branch that pushes a value onto the stack, followed by an `else` branch that pops a value. Ensure the block type specifies a higher stack size than anticipated, causing a differential stack underflow in the `else` branch due to mismatched stack expectations.

(assert_invalid
  (module (func $stack-mismatch-if-else (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 2) (i32.const 3))
      (else (drop) (i32.const 4) (i32.const 5))
    )
  ))
  "type mismatch"
)