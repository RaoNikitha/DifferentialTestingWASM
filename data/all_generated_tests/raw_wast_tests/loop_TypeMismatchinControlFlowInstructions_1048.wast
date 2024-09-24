;; Test 9: A `loop` instruction with a function type `[i32] -> []`, containing nested calls that incorrectly expect `[f64]` on the stack. This tests strict adherence to stack typing rules and handling of type mismatches propagated from function calls inside loops.

(assert_invalid
  (module
    (func $type-param-loop
      (loop (param i32)
        (call $requires_f64)
      )
    )
    (func $requires_f64 (param f64))
  )
  "type mismatch"
)