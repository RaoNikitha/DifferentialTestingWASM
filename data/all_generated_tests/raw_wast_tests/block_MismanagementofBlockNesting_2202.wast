;; 3. Construct a `block` containing a nested `if` condition and a `loop`, and then use a `br_if` within the `loop` to jump to the outer `block`. Ensure that the flow control resumes correctly at the outer `block` after the `br_if`.

(assert_invalid
  (module (func
    (block (result i32)
      (i32.const 10)
      (if (result i32) (i32.const 1) (i32.const 0))
      (loop (result i32)
        (br_if 1 (i32.const 1))
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)