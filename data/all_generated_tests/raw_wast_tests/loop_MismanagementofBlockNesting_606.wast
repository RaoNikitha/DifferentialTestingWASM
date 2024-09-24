;; 7. Implement a loop containing a `br_table` that indirectly targets different depths of nested blocks and loops. Design tests to see if the indirect branching correctly interprets nested structures, preventing incorrect exits from the loops or blocks.

(assert_invalid
  (module
    (func $nested_loop_br_table (loop (result i32)
      (i32.const 0)
      (block (loop (result i32)
        (br_table 0 1 0 (i32.const 1))
      ))
      (i32.const 2)
    ))
  )
  "type mismatch"
)