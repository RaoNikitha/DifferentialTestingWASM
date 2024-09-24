;; 5. **Test Case 5**: Construct a conditional branch within an `if` block that targets a block outside the scope, testing invalid forward jumps for `br_if`.    - **Constraint Checked**: Enforcement of blocks targeted by `br_if` being within valid enclosing scopes.    - **CFG Relation**: Invalid branches in CFG leading to unreachable code or invalid state transitions.

(assert_invalid
  (module
    (func $test
      (if (result i32)
        (then
          (block
            (br_if 1 (i32.const 1)) 
          )
          (i32.const 0)
        )
      )
    )
  )
  "unknown label"
)