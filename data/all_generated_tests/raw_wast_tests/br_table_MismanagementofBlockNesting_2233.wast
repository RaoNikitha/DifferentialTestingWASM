;; 3. **Test Description:** Design a `br_table` that uses index values targeting deeper nested `loop` and `block` constructs. Ensure the stack operands verify as expected before and after the branch, checking if misinterpretation leads to an incorrect flow exiting multiple blocks.

(assert_invalid
  (module
    (func $nested-br_table  ;; Test br_table with deeper nested constructs
      (block  ;; Outer block
        (loop  ;; Innermost loop
          (block  ;; Nested block within loop
            (br_table 0 1  ;; br_table targeting inner block and outer block
              (i32.const 2)  ;; Operand that is out of bounds
            )
          )
        )
      )
    )
  )
  " unknown label"
)