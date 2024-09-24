;; 10. A function using nested `block` structures with multiple nested depths, including `nop` instructions, to test that the stack remains correctly managed and the control flow correctly identifies and exits the intended nested block layer.

(assert_invalid
  (module
    (func $nested-blocks 
      (block
        (block
          (block
            (nop)
            (br 2)
          )
          (return)
        )
      )
    )
  )
  "type mismatch"
)