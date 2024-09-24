;; 7. **Test Misindexed br_if with Complex Nesting Levels**:     Use `br_if` to branch to mislabeled ("incorrect") blocks within a complex nested structure. This should spot mismanagement when referencing the wrong labels due to incorrect depth calculations.

(assert_invalid
  (module
    (func (block (block (block (block (block
      (br_if 4 (i32.const 1))
    ))))))
  )
  "unknown label"
)