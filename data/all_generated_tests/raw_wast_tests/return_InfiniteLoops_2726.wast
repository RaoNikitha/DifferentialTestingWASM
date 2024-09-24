;; Design a loop where the `return` instruction depends on a global state. If the global state is not updated correctly, the `return` should never be executed and the loop should run indefinitely. This checks global state management with `return`.

(assert_invalid 
  (module 
    (global $g (mut i32) (i32.const 0)) 
    (func $loop-with-return-based-on-global
      (loop
        (if (i32.eq (global.get $g) (i32.const 1))
            (return))
        (br 0)
      )
    )
  )
  "type mismatch"
)