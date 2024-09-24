;; 1. **Default Branch Activation with Out-of-Bounds Index**    - Test a `br_table` instruction with an operand index that is greater than the length of the target label list to ensure that it correctly branches to the default label rather than causing a crash or undefined behavior. This checks index bounds constraint.

(assert_invalid
  (module
    (func $default-branch-out-of-bounds
      (block (br_table 0 1 2 (i32.const 3)))
    )
  )
  "unknown label"
)