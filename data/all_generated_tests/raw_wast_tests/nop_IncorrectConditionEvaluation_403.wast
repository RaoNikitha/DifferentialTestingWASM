;; 4. Position a `nop` instruction within nested `if` blocks. Validate that the correct path is taken by the outer and inner control structures, ensuring `nop` does not interfere with nested condition evaluations.

 ;; (module
  (func (param i32) (result i32)
    (if (i32.eq (local.get 0) (i32.const 0))
      (then 
        (nop)
        (i32.const 1)
      )
      (else 
        (if (i32.eq (local.get 0) (i32.const 1))
          (then 
            (nop)
            (i32.const 2)
          )
          (else 
            (i32.const 3)
          )
        )
      )
    )
  )
)

(assert_return 
  (invoke "test" (i32.const 0)) 
  (i32.const 1)
)

(assert_return 
  (invoke "test" (i32.const 1)) 
  (i32.const 2)
)

(assert_return 
  (invoke "test" (i32.const 2)) 
  (i32.const 3)
)