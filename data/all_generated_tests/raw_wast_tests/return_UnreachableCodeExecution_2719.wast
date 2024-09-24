;; 8. **Test Scenario**: Include a block where a `return` is called on valid condition, and an unreachable instruction placed after condition evaluation.    **Constraint**: Ensures `return` path does not fall through to unchecked instructions.    **Unreachable Code**: Test if condition mismanagement leads to unreachable.

(assert_invalid
  (module
    (func $return-in-block-unreachable (result i32)
      (block
        (i32.const 5)
        (br_if 0 (i32.const 1))
        (return)
        (unreachable)
      )
    )
  )
  "unreachable code"
)