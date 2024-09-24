;; 8. **Test Description**: An `if` instruction where the condition checks a value returned from a sequence of function calls including imported functions, followed by additional control flow instructions.    **Constraint**: Verifies correct stack evaluation for complex, interwoven control flows with multiple function calls.    **Goal**: Catches issues in evaluation and propagation of return values within nested control flows involving imports.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func $complex_if_nested (result i32)
      (local $x i32)
      (local $y i32)
      (local.set $x (call $ext_func))
      (local.set $y (call $ext_func))
      (if (result i32)
        (i32.add (local.get $x) (local.get $y))
        (then (i32.const 42))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)