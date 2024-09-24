;; 3. Use a `loop` that has multiple backward branches (`br` and `br_if`) within its body, to ensure that each branch leads correctly to the beginning of the loop and does not cause an infinite loop.

(assert_invalid
  (module
    (func $nested-loop-backward-branch
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br 1) ;; This should branch out to the end of $outer loop
          (br_if 1 (i32.const 1)) ;; This should branch out to the end of $outer loop
        )
      )
    )
  )
  "type mismatch"
)