;; - **Test 5**:   A complex control flow with an `if`-`else` construct where the `if` branch uses `br_if` to push a value of `i32` type and the `else` branch expects `f32`.   - **Reason**: Validates type mismatch handling within alternative control paths.   - **Constraint**: Both branches of an `if`-`else` must push values of the same type on the stack.

(assert_invalid
  (module (func $type-if-br_if-mismatch
    (block (result i32)
      (if (result i32)
        (i32.const 1) 
        (then (br_if 0 (i32.const 1)) (i32.const 42))
        (else (f32.const 0.0))
      )
    )
  ))
  "type mismatch"
)