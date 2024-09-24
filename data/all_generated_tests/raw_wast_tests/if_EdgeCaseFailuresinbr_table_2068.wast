;; Build an `if` block with nested instructions wherein the innermost `if` contains a `br_table` branching based on an index calculated by nested computations leading to out-of-bound jumps in different implementations.

(assert_invalid
  (module (func
    (i32.const 0)
    (if (result i32)
      (then
        (i32.const 1)
        (if (result i32)
          (then
            (i32.const 1)
            (i32.const 2)
            (br_table 0 1)
          )
        )
      )
      (else
        (i32.const 1)
      )
    )
  ))
  "type mismatch"
)