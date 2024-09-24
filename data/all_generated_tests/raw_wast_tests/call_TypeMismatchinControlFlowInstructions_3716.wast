;; 5. Consume a function's return value in a `select` instruction that expects values of mismatched types (e.g., selecting between an integer and a float).

(assert_invalid
  (module
    (func (result i32) (i32.const 42))
    (func (param i32) (param f32) (result i32)
      (select (i32.const 0) (call 0) (f32.const 1.0))
    )
  )
  "type mismatch"
)