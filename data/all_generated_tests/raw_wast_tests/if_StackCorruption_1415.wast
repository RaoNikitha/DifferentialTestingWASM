;; 6. Dynamic Stack Depth Changes: Use an `if` that matches varying stack depths before and after execution. ```wasm // Example (if (result f64)   (then      f64.const 3.14      i32.const 10   )   (else f64.const 2.71) ) ``` *Reasoning*: Tests if varying stack depths within `if` blocks do not disrupt the stack, causing potential corruption.

(assert_invalid
  (module
    (func $dynamic-stack-depth-change (result f64)
      (if (result f64)
        (then
          f64.const 3.14
          i32.const 10
        )
        (else
          f64.const 2.71
        )
      )
    )
  )
  "type mismatch"
)