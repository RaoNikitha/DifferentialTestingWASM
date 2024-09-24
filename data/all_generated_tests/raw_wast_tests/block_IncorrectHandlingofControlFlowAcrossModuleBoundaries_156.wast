;; 7. **Table-Based Indirect Function Call within Block**:    - Utilize a module with a `block` encompassing a table-based indirect function call. The table should include entries for both local and imported functions. The test ensures that label indexing and control flow are correctly handled within the `block` and during indirect calls.

(assert_invalid
  (module (import "js" "imp" (func $imp))
    (table 1 funcref)
    (elem (i32.const 0) $imp)
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (call_indirect (type 0) (i32.const 0))
          (br 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)