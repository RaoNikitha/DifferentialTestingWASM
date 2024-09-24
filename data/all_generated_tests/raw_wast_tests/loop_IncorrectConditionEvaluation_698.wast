;; Design a `loop` with a leading `br_if` that dynamically evaluates a condition involving multiple stack manipulations. Ensure the sequence `push 5, push 5, i32.eq` correctly evaluates to true, causing a branch.

(assert_invalid
  (module (func $test-loop-br_if 
    (loop (result i32) 
      (i32.const 5) 
      (i32.const 5) 
      (i32.eq) 
      (br_if 0)
    )
  ))
  "type mismatch"
)