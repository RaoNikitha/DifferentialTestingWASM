;; 8. Design a `select` instruction test that includes a `nop` between operands. `i32` and `f32` constants should follow the `nop`, ensuring type coherence is maintained while performing stack operations during the selection process. Verify the result type is valid.

(assert_invalid
  (module 
    (func (result i32) 
      (select 
        (nop) 
        (i32.const 10) 
        (f32.const 0.0))
    )
  )
  "type mismatch"
)