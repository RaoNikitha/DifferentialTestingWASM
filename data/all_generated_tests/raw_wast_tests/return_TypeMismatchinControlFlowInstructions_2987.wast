;; 6. **Test for Type Mismatch in Conditional Block with Early Return**: Formulate a function with a conditional block (`if-else`) where the `return` in the `if` branch provides a different type (`f32`) than the `else` branch expects (`i64`). Check if type mismatches are detected.

(assert_invalid
 (module
  (func $conditional-return-type-mismatch (result i64)
   (if (result i64)
    (i32.const 1)
    (then (return (f32.const 0.0)))
    (else (i64.const 0))
   )
  )
 )
 "type mismatch"
)