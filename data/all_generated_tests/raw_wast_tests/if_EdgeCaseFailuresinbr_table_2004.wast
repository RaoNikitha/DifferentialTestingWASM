;; 5. **Test 5**: Mixing `if` and `loop` inside an `if` block with a `br_table` where the index is exactly one more than the highest target index, testing large index boundary conditions.

(assert_invalid
  (module
    (func $mix-if-loop-br_table (param i32) (result i32)
      (if (result i32) (i32.const 1)
        (then
          (loop $loop (result i32)
            (br_table 0 1 2 (get_local 0)) 
          )
        )
        (else (i32.const 0))
      )
    )
  )
  "label index out of range"
)