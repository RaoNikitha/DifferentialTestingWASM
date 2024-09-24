;; 4. Construct blocks with complex nested structures and use conditional `br` instructions to different labels. Mismanaging the operand stack during unwinding could result in skipping the loop exit condition incorrectly and induce infinite looping.

(assert_invalid
  (module
    (func
      (block (loop (br 0) (i32.const 1) (br_if 1 (i32.const 1)) (br 1)))
    )
  )
  "type mismatch"
)