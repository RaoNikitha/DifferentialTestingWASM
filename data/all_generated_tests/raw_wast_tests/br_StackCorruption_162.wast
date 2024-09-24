;; 3. **Test Description:**    Use a `br` targeting a `loop` from within another nested `loop`.     **Constraint Checked:** Correct handling of backward branches and operand consistency.    **Relation to Stack Corruption:** Incorrect operand handling could lead to stack underflows during loop iterations.

(assert_invalid
  (module
    (func $test-br-in-nested-loops
      (loop (result i32)
        (loop (result i32)
          (br 1)
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)