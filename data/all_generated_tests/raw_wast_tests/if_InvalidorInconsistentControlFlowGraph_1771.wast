;; 2. Create a nested `if` within another `if`, with the outer condition always evaluating to true and the inner condition always evaluating to false, checking if the CFG maintains proper nesting and branch targeting.

(assert_invalid
  (module (func $nested-if (result i32)
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 0)
          (then (i32.const 1))
          (else (i32.const 2) (i32.const 3))
        )
      )
      (else (i32.const 4))
    )
  ))
  "type mismatch"
)