;; 8. A `loop` with both correct and incorrect `br_if` conditions leading to test branches alternately consisting of correct and incorrect state evaluations. This ensures effective management of the target label context and eliminates infinite loops due to misinterpreted branch declarations.

(assert_invalid
  (module
    (func (loop (br_if 0 (i32.const 1)) (br_if 0 (f32.const 0.0))))
  )
  "type mismatch"
)