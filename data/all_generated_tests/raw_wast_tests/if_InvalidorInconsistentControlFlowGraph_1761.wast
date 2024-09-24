;; 2. **Missing `else` Branch with Expected Output**:    - Construct a test where an `if` block is terminated without an `else` branch, but the function signature expects an output type produced by the `else` branch.    - *Constraint*: The output type specified by the function signature must be obtained from either the `then` or `else` branch.    - *Relation to CFG*: Checks the CFG’s ability to properly handle incomplete conditional structures without an `else` path.

(assert_invalid
  (module (func $missing-else-branch (result i32)
    (if (result i32) (i32.const 1) (then (drop)))
  ))
  "type mismatch"
)