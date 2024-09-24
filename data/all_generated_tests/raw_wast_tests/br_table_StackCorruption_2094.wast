;; 4. Develop a test where `br_table` branches based on an operand that exactly matches the length of the label vector. Test for stack consistency and proper unwinding.

(assert_invalid
  (module (func $index-matches-length
    (block $default
      (block $label0
        (br_table 0 (i32.const 1)) ;; operand 1 matches the length of the label vector
      )
    )
  ))
  "index out of bounds"
)