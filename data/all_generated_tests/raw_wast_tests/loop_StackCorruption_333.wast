;; 4. **Test 4**:    - **Description**: Implement nested loops, each consuming and producing unique stack values. Use `br_table` to switch between loops.    - **Constraint**: Correct context extension and stack state between nested loops.    - **Stack Corruption Check**: Ensure nested loops manage their stack values properly to avoid corruption during `br_table` switches.

(assert_invalid
 (module
  (func $nested_loops
   (block $outer
    (loop $loop1
     (i32.const 0)
     (loop $loop2
      (br_table $loop1 $loop2 (i32.const 1))
      (br_table $loop1 $loop2 (i32.const 0))
     )
    )
   )
  )
 )
 "type mismatch"
)