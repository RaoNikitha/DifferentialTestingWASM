;; Test 9: Design a loop where the initial instruction sequence causes a type to be pushed onto the stack that differs from the loop’s declared block type. This checks if the initial type setup before the loop execution is correctly validated.

(assert_invalid
  (module (func $invalid_initial_type_setup
    (i32.const 0) (i32.const 1) ;; push two i32 values on the stack
    (loop (result i32) (drop) (drop))
  ))
  "type mismatch"
)