;; Test 10: Create a block that expects a tuple (int, string) but use a br instruction within it to branch with mismatched operand types like (float, int), emphasizing operand management and type constraints.

(assert_invalid
  (module
    (func $mismatch-operands
      (block (result (i32 i32))
        (f32.const 0.0) 
        (i32.const 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)