;; 4. Construct a sequence of `br_if` and `nop` instructions where the `br_if` conditionally branches based on an `i32.eq` comparison. Ensure the type consistency by checking if `nop` does not affect the operand type expectations. The test confirms proper handling of branching with conditions.

(assert_invalid
  (module
    (func (block (br_if 0 (i32.eq (i32.const 0) (i32.const 0))) (nop)))
  )
  "unexpected end of type section"
)