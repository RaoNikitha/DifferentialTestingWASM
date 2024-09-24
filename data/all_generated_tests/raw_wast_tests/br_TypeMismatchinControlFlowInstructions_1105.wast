;; 6. **Test for Unexpectedly Empty Stack**: Construct a `block` that expects non-empty operands on the stack but branch to it after clearing the stack. This will test if the stack state is correctly validated before and after branching within control instructions.

(assert_invalid
  (module
    (func $unexpected-empty-stack
      (block (result i32)
        (drop) ;; Explicitly clear the stack
        (br 0) ;; Attempt to branch expecting a non-empty stack
      )
    )
  )
  "type mismatch"
)