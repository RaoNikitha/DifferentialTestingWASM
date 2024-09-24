;; 6. **Test 6:** Create a function containing a nested block structure where a `br_table` at varying depths contains `unreachable` and other instructions. Test around the depth where mismanagement may occur:    - **Check:** Validate if executing the nested blocks correctly hits `unreachable`, causing a trap without errors.    - **Constraint:** Ensures `unreachable` is recognized correctly within `br_table` constructs.

(assert_invalid
  (module (func $type-br_table-unreachable-nesting
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 2 1 (unreachable) (i32.const 0) (i32.const 1))
        )
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)