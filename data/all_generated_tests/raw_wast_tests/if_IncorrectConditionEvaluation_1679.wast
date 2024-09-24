;; - **Test Description 10**: Introduce a global variable accessed in the `if` condition (e.g., `global.get 0` where the global is set to zero). Ensure that the `else` block is executed when the global variable evaluates to the condition value.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $global-if-else (result i32)
      (if (result i32) (global.get $g)
        (then (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)