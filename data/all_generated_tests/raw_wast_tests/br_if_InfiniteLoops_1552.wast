;; Test br_if in a deeply nested loop structure that performs multiple br_ifs in succession to target various levels and check for correct operand stack management to avoid infinite looping.

(assert_invalid
  (module
    (func $deeply_nested_br_if
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (loop (result i32)
              (br_if 3 (i32.const 1)) 
              (br_if 2 (i32.const 0)) 
              (br_if 1 (i32.const 1)) 
              (br_if 0 (i32.const 0)) 
              (i32.const 42)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)