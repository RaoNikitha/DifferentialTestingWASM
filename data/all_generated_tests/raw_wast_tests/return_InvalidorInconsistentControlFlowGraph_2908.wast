;; 7. Implement a function with nested loops and `return` instructions interleaved within to prematurely exit loops, checking whether WebAssembly identifies possible unsafe stack conditions that the Wizard Engine’s method may overlook due to marking code unreachable.

(assert_invalid
  (module
    (func $nested-loops-with-return
      (loop 
        (loop 
          (block
            (br 1)
          )
          (return)
        )
        (loop
          (return)
        )
      )
    )
  )
  "type mismatch"
)