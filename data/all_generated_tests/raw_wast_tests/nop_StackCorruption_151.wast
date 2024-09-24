;; Test 2: Place `nop` within nested control structures, such as `block`, `loop`, or `if`, to ensure that the stack's state remains consistent throughout and after execution.

(assert_invalid
  (module
    (func (nop) 
          (block 
            (nop)
            (loop 
              (nop)
              (if (nop) (nop))
            )
          )
    )
  )
  "type mismatch"
)