;; 7. **Branched but Unreachable Code**:    - **Description**: Employ `br_if` to branch to a label, but the code under that label is technically unreachable due to static analysis.    - **Constraint**: Reachability analysis.    - **CFG Impact**: CFG contains paths leading to unreachable code, increasing inconsistency.

(assert_invalid
  (module
    (func $test_br_if
      (block
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "unreachable code"
)