;; 10. **Test Interleaved Unreachable and Br-If in Nested Conditionals:**    - Interleave `unreachable` with `br_if` inside nested conditionals, aiming to exit to non-trivial outer levels.    - *Constraint*: Verifies intricate conditional exits respecting `unreachable` while resolving forward and backward branches.    - *Relation to Branch Resolution*: Demonstrates complex conditional context branching evaluation with stack-polymorphic traps.  By perturbing the use of `unreachable` in various branching scenarios, these tests aim to identify incorrect branch target resolution in WebAssembly and reveal discrepancies across implementations.

(assert_invalid
  (module
    (func (block
      (if (i32.const 1)
        (then (block
          (if (i32.const 0)
            (then (unreachable))
            (else (br_if 0 (i32.const 1)))
          )
          (drop (i32.const 1))
        ))
        (else (br_if 0 (i32.const 0)))
      )
    ))
  )
  "type mismatch"
)