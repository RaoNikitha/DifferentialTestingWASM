;; 3. **Test Description:**    Create a scenario where `call_indirect` is placed inside nested conditional branches (`if` and `else` pairs), and ensure that exiting from within `if` blocks correctly transitions to the appropriate outer blocks.    - **Constraint Checked:** Conditional nesting with `call_indirect`.    - **Mismanagement Relation:** Ensures branch handling within nested `if-else` blocks is accurate without flow disruptions.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call_indirect (type 0) (i32.const 0) (i32.const 42))
        )
        (else
          (return (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)