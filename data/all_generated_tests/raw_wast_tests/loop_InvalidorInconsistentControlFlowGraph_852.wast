;; 3. **Incorrect Backward Branching**:    - **Description**: Create a loop with a complex control flow where `br_if` instructions conditionally branch to the loop’s beginning. The conditions ensure some paths never branch back.    - **Constraint Checked**: Accurate backward jump handling and proper unwinding of the operand stack.    - **CFG Relevance**: Ensures the CFG correctly accounts for all possible paths, particularly backward branches, and reflects loop reinitializations.

(assert_invalid
  (module
    (func $test (result i32)
      (local i32)
      (block
        (loop (result i32)
          (local.set 0 (i32.const 0))
          (br_if 1 (local.get 0))
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br_if 0 (i32.lt_s (local.get 0) (i32.const 10)))
        )
      )
    )
  )
  "type mismatch"
)