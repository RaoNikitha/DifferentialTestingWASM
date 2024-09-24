;; 10. Implement a block with a comprehensive set of logical operations (e.g., greater than, less than, equal to) feeding conditions to `br_if` instructions. Confirm that these conditions are accurately evaluated to dictate the control flow out of the block.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (i32.const 5)
      (i32.const 10)
      (i32.gt_s)  ;; Check if 5 > 10, expected: false (0)
      (br_if 0)
      (i32.const 20)
    )
  ))
  "type mismatch"
)