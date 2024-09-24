;; 4. **Multiple `br_table` Instructions in a Loop**    - Introduce a loop containing multiple `br_table` instructions that rely on various indices to jump to different loop blocks. Validate if the stack and control flow correctly handle these indirect branches without corrupting the stack.

(assert_invalid
  (module
    (func $multi-br-table-loop
      (loop $loop1 (result i32)
        (i32.const 0)
        (br_table $loop1 $loop1)
        (br_table $loop1 $loop1)
      )
    )
  )
  "type mismatch"
)