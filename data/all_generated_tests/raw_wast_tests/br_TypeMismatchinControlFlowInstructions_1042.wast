;; 3. Formulate a module containing nested blocks; one block expecting an `i32` at the top level, and an inner `if` block changing the control flow with a `br` instruction that mistakenly provides an `f64` value. This will test if the engine can correctly verify type expectations on nested control flow instructions.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (if 
          (i32.const 0)
          (then 
            (br 1 (f64.const 0.0))
          )
        )
      )
    )
  )
  "type mismatch"
)