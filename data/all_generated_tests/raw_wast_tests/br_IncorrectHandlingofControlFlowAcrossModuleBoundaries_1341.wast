;; 2. **Test Description:** Design a test where the module exports a function containing a `br` instruction targeting an `if` block. The calling module should call this exported function. Verify if the stack is unwound correctly after the branch.    - **Constraint:** Ensures proper stack unwinding for forward branches in exported functions.    - **Relation:** Identifies potential issues in handling operand stacks when control branches out of an `if` block in an exported function.

(assert_invalid
  (module
    (func $exported_func
      (local i32)
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (br 0)
          )
          (else
            (i32.const 0)
          )
        )
      )
      (i32.eqz) (drop)
    )
    (export "exported_func" (func $exported_func))
  )
  "type mismatch"
)