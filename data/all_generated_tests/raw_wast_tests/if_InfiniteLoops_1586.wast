;; 7. Develop a test with a correct outer `if` condition leading to a looping construct based on wrong counter management. Ensure correct branch instructions are dependent on label calculations. This can catch differences in nested escaping due to incorrect label propagation.

(assert_invalid
  (module
    (func $nested-incorrect-label-propagation
      (i32.const 1)
      (if (result i32) (then
        (block (loop (br_if 1 (i32.const 0))))
      ))
    )
  )
  "type mismatch or incorrect label propagation"
)