;; 8. **Test for Incorrect Label Target Post-Block**:    - Include a forward branch (e.g., `br`) exiting a block but resuming incorrectly beyond the expected continuation point. This checks the correct resumption after a block.    - Constraint: Correct behavior of forward branch.    - CFG Impact: CFG inconsistency, causing unintended execution paths.

(assert_invalid
  (module (func $incorrect-label (result i32)
    (block (result i32) (br 1 (i32.const 0)) (i32.const 1))
  ))
  "label unknown or invalid"
)