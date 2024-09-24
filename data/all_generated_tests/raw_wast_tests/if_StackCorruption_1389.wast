;; 10. Craft an `if` block that interacts with the global stack state, such as pushing/popping global variables. This complex scenario might reveal differences in how operand stack changes are tracked and synchronized with the global state by different implementations.

(assert_invalid
  (module
    (global $x (mut i32) (i32.const 0))
    (func $global-stack-interaction
      (if (result i32)
        (global.set $x (i32.const 1)) (then (global.get $x) (i32.const 10))
        (else (global.set $x (i32.const 2)) (i32.const 20))
      )
    )
  )
  "type mismatch"
)