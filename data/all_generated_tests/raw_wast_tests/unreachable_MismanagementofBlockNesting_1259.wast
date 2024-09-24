;; 10. **Test 10:** Design a deeply nested structure involving multiple `block`, `loop`, and `if` constructs, with jumps via `br_table` leading to reach `unreachable` instructions placed strategically within the deepest structure:    - **Check:** Ensure the control flow's correct recognition of `unreachable` and that the surrounding structure follows expected behavior.    - **Constraint:** Ensures robustness of implementation against deeply complex and nested structures.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block $outer (result i32)
        (loop $inner
          (if (i32.const 1)
            (then
              (br_table $inner $outer 0 0 (local.get 0))
              (unreachable)
            )
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)