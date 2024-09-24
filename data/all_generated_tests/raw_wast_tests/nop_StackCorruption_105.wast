;; 6. Create a function with complex nested loops that perform stack operations, and insert `nop` instructions within these loops. Validate that no stack corruption occurs during the loop operations by verifying stack states at specific points.

 ;; (module
  (func $complex_loop
    (loop $outer
      (i32.const 0)  ;; Initial stack state
      (nop)
      (loop $inner
        (i32.const 1)  ;; Operation within inner loop
        (nop)
        (br $inner)
      )
      (i32.const 2)  ;; Operation within outer loop
      (nop)
      (br $outer)
    )
  )
)