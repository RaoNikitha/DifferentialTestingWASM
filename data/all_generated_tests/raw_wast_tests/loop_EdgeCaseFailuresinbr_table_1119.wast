;; - **Test 10**: Implement a loop containing a `br_table` with dynamic target assignment, where the index is provided by runtime stack manipulation (e.g., computed index via arithmetic operations). Check how engines manage dynamic index resolution and edge cases leading to undefined behavior or appropriate error handling.

(assert_invalid
  (module (func (loop (param i32)
    (i32.const 5)
    (i32.const 10)
    (i32.add)
    (br_table 0 1)))) 
  "type mismatch or index out of bounds in br_table"
)