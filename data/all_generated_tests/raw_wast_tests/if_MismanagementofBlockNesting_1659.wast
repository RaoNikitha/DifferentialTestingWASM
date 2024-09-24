;; 10. Develop a complex `if` nested inside another `if` within a `loop`, where the innermost `else` includes another loop. Use `br_if` and `br_table` to navigate different nested levels based on stack conditions. This tests whether the initialization and reset mechanisms correctly handle deeply nested structures and maintain control flow integrity.

(assert_invalid
  (module (func $complex-nested-if
    (loop (if (i32.const 1) 
      (then 
        (if (result i32) (i32.const 1)
          (then (i32.const 0))
          (else (loop (br 1)))
        )
      ) 
      (else (br_table 0 0 (i32.const 2)))
    ))
  ))
  "type mismatch"
)