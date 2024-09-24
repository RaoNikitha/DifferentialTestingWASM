;; 6. **Indirect Branch Table in Deep Nest**: Construct a deeply nested set of loops (`loop within loop within loop`) with an indirect branch table (`br_table`). The function selects branches based on an indexed operand, ensuring that the indices are interpreted correctly and do not exit the wrong loop.

(assert_invalid
  (module (func $indirect-br-table-in-deep-nest
    (i32.const 0)
    (loop (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_table 0 1 2 2 (i32.const 3))
        )
      )
    )
  ))
  "type mismatch"
)