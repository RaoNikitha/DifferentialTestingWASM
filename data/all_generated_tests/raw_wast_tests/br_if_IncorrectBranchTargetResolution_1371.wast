;; 2. **Test Description 2: Loop Incorrect Target**    - Define a loop within another loop. Insert a `br_if 1` in the inner loop to verify whether it correctly targets the outer loop.

(assert_invalid
  (module (func $loop-incorrect-target
    (loop (loop (br_if 1 (i32.const 1)))))
  )
  "unknown label"
)