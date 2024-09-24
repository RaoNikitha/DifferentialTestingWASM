;; 8. **Test Description:**    Implement a `br` within a `block` where the stack is deliberately overfilled before the branch.    **Constraint Checked:** Ensuring proper stack unwinding and handling of excess operands.    **Relation to Stack Corruption:** Incorrect handling could result in a stack overflow.

(assert_invalid
  (module
    (func $stack-overfill-before-branch
      (block
        (i32.const 1) (i32.const 2) (i32.const 3)
        (br 0)
        (i32.const 4) (drop)
      )
      (i32.const 5) (drop)
    )
  )
  "type mismatch"
)