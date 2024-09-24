;; Test 1: - Create a nested structure with multiple levels of `block` instructions and use `br_if` to target label `0`. Confirm the execution path behaves as if it targets the innermost block correctly. If wizard_engine allows an out-of-bounds index, it might exhibit different behavior. - **Constraint Checked**: Label Lookup Mechanism. - **Relation to Incorrect Branch Target Resolution**: Tests if the implementation handles correct resolution of the innermost label.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (i32.const 1)
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)