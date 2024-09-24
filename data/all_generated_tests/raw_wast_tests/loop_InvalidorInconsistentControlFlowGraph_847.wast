;; Implement a loop where an instruction sequence within the loop introduces a type inconsistency, and test if the CFG correctly flags this inconsistency within the loop's context.

(assert_invalid
  (module (func $type-mismatch-within-loop
    (i32.const 0)
    (loop (result i32)
      (f32.const 0.0)  ;; Type mismatch here: loop expects i32 result, but f32 is pushed
    )
  ))
  "type mismatch"
)