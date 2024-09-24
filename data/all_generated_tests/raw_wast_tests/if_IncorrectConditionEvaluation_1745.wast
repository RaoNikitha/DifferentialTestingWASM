;; 6. Test an `if` instruction where the condition is provided by a function call returning `0` or `1`. Ensure the `br_if` correctly evaluates the function results for branching. This checks function calls influencing branching logic.

(assert_invalid
  (module
    (func $cond (result i32) (i32.const 0))
    (func $type-if-function (result i32)
      (if (result i32) (call $cond)
        (then (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)