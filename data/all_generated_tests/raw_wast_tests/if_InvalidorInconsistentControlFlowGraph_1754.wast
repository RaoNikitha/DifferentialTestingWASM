;; 5. **Test Multi-Level `if-elseif` Scenario**:    - Construct a series of `if`-`else`-`if` conditions to test the CFG’s ability to manage multiple branching paths and ensure proper visibility among all branches.    - **Constraint Checked**: evaluates the CFG’s support for multi-level conditional branching.

(assert_invalid
  (module (func $multi-level-if
    (if (result i32) (i32.const 0)
      (then (i32.const 10))
      (else
        (if (result i32) (i32.const 1)
          (then (i32.const 20))
          (else (i32.const 30)) 
        )
      )
    )
  ))
  "type mismatch"
)