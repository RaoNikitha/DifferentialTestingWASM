;; 2. Create a nested `if` inside an outer `if`, where both `if` instructions have their respective `else` blocks. Input a series of stack manipulations leading to potential stack mismanagement in recursive function calls in WebAssembly Validator (OCaml) vs. explicit state management in Wizard Engine (Java).

(assert_invalid
  (module
    (func $nested-if-mismatch (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then (i32.const 1))
            (else (f64.const 1))
          )
        )
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)