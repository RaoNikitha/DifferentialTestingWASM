;; 2. Include a `loop` block with a forward `br_if` targeting two separate loops based on different conditions. Validate correct branching towards the specified loop.

(assert_invalid
  (module (func $type-forward-br_if (result i32)
    (loop (result i32)
      (i32.const 1) 
      (br_if 1 (i32.const 0))
      (loop (result i32)
        (i32.const 2)
        (br_if 0 (i32.const 1))
      )
    )
  ))
  "type mismatch"
)