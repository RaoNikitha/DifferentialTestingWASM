;; 6. **Test with Function Call in Unreachable Code**:     - **Description**: Place a call instruction within a block of code that is unreachable due to previous conditional logic.     - **Constraint Checked**: Ensures the `unreachable` determination is handled correctly and no execution paths are taken.     - **CFG Relation**: Tests how the CFG treats unreachable code and verifies that unreachable paths are not erroneously executed.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $f (param i32))
    (block
      unreachable
      (call $f (i32.const 0))
    )
  )
  "call in unreachable code"
)