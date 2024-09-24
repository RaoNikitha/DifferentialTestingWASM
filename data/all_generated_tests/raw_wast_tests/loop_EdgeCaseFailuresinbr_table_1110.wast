;; - **Test 1**: Create a `br_table` instruction within a loop, providing it with an index that is deliberately out of bounds. This ensures the error handling mechanism for out-of-bounds indices is correctly implemented in both engines. Check if WebAssembly and Wizard Engine handle the `br_table` default target correctly.

(assert_invalid
  (module 
    (func $br_table_out_of_bounds
      (block
        (loop 
          (br_table 1 (i32.const 3))
        )
      )
    )
  )
  "out of bounds branch index"
)