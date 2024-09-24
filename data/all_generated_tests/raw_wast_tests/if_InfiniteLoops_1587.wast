;; 8. Formulate a test with an `if` condition that is true leading into a series of nested `else` blocks each improperly setting conditions for a `br_if` within loops to cause infinite looping. Tests strict conformity of type, label, and state within branching.

(assert_invalid
  (module (func $nested-else-loop-infinite (result i32)
    (i32.const 1) 
    (if (result i32) 
      (then (loop (i32.const 0) (br_if 0 (i32.eqz (i32.const 1)))) (i32.const 0))
      (else (loop (i32.const 0) (br_if 0 (i32.eqz (i32.const 0))))) 
    )
  ))
  "type mismatch"
)