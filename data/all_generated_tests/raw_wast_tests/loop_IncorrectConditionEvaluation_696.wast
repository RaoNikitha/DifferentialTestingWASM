;; Create a `loop` that terminates only conditionally using a `br_if`. Perform an inner calculation that modifies the stack conditionally, checking `br_if` with a false outcome to verify no branching.

(assert_invalid
  (module (func 
    (i32.const 0)
    (loop (param i32)
      (i32.const 1)
      (i32.eqz)
      (br_if 0)
    )
  ))
  "type mismatch"
)