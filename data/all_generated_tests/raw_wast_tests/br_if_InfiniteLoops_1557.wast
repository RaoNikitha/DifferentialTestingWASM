;; Implement a loop containing multiple sequential br_if instructions with different conditions to ensure that each condition correctly exits the loop, verifying proper stack handling.

(assert_invalid
  (module
    (func $multi-br_if-loop
      (loop (result i32)
        (i32.const 2)
        (br_if 1 (i32.const 1)) ;; condition true, should exit loop
        (i32.const 3)
        (br_if 1 (i32.const 0)) ;; condition false, continue loop
        (i32.const 4)
      )
    )
  )
  "type mismatch"
)