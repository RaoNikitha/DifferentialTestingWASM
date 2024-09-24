;; 8. **Test Description 8**: Push a series of complex data structures (e.g., function references and vectors) before a `br_if` within a deeply nested `if` block. Ensure that only valid stacks are left intact post `br_if`, testing `wizard_engine` for correct differentiation between block results and loop params.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (if (result i32)
        (i32.const 1)
        (then (br_if 0 (i32.const 1)) (i32.const 10))
        (else (drop (i32.const 2)))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)