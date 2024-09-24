;; 5. Design an `if` block where the condition is derived from the result of a prior arithmetic operation. Ensure the `br_if` correctly evaluates this arithmetic result. This checks the handling of dynamically computed conditions.

(assert_invalid
  (module
    (func $if-arithmetic-branch (result i32)
      (if (result i32)
        (i32.add (i32.const 1) (i32.const 2))
        (then (i32.const 1))
        (else (br 0 (i32.const 0)))
      )
    )
  )
  "type mismatch"
)