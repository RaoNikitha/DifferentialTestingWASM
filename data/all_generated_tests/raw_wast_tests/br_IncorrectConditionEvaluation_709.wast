;; 10. **Test Description 10:** Use a `br_if` conditioned on a stack top being a specific constant value after several arithmetic operations. Miscalculating or erroneous condition evaluation would cause unexpected branching.     - **Constraint Checked:** Accurate evaluation post arithmetic operations.     - **Differential Behavior:** Wizard Engine may incorrectly determine fixed value match, causing wrong/unconditional branching.

(assert_invalid
  (module
    (func
      (block
        (i32.const 5)
        (i32.const 3)
        (i32.add)
        (i32.const 8)
        (i32.eq)
        (br_if 0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)