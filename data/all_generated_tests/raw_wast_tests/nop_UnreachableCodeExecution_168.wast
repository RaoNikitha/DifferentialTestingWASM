;; 9. Place a `nop` immediately before a `br_if` instruction which directs to a block containing `unreachable`. Check that the branch condition is evaluated correctly, without skipping to `unreachable`.

 ;; (module
  (func $test (param i32) (result i32)
    (block 
      (br_if 0 (i32.const 1)) 
      (nop)
      (unreachable)
    )
    (i32.const 0)
  )
)