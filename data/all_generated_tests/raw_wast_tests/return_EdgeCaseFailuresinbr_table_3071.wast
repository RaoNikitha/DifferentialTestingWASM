;; 10. **Test Description**: Function employing `br_table` targeting blocks with different control flow – some terminating with `return`, some continuing execution.      - **Constraint**: Confirms that `return` properly unwinds only when intended, without affecting non-terminating branches.

(assert_invalid
  (module
    (func $br_table_with_return (result i32)
      (block
        (block
          (block (br_table 0 1 2 (i32.const 0)) (return (i32.const 1))) 
          (i32.const 2))
        (i32.const 3))
      (i32.const 4))
  )
  "type mismatch"
)