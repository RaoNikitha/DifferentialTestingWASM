;; 10. **Test Description 10: Reverse Jump Misplacement in Nested Conditions**     - Create a nested setup involving multiple conditional `if-else` constructs, insert `br_if` pointing to higher levels to observe whether backward jumps are processed correctly without misreferencing.

(assert_invalid
  (module
    (func (result i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (br_if 1 (i32.const 1)) (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)