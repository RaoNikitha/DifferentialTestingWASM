;; 5. **Test Description 5**:    Create a WASM module with multiple nested loops and an exported function that performs `br` instructions to various loop depths. Import this function into another module and call it. Check if the correct loop is targeted with proper stack management.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop 
          (loop 
            (block 
              (br 1)
            ) 
          (br 0))
        )
      )
    )
  )
  "unknown label"
)