;; 5. **Stack-Polymorphic Function with Multiple Returns**:    - Develop a function that has a stack-polymorphic nature, involving different operand sequences that lead to valid `return` instructions. The test checks if both implementations handle such behaviors correctly, mapping operand sequences precisely to the return type.

(assert_invalid
  (module
    (func $stack-polymorphic-multiple-returns
      (local $x i32)
      (local $y f64)
      (block
        (loop
          (br_if 0 (return (local.get $x)))
          (br_if 1 (return (local.get $y)))
        )
      )
    )
  )
  "type mismatch"
)