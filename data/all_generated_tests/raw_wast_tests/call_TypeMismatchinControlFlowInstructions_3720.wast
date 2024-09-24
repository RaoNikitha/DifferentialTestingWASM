;; 9. Nest a call within a `br_table` (branch table) instruction that branches to blocks with differing expected types from the function's return type.

(assert_invalid
  (module
    (func $type-mismatch (result i32)
      (block (result i32 i32) 
        (br_table 0 (call 1 (i32.const 1)))
      )
    )
    (func (result i32))
  )
  "type mismatch"
)