;; 7. Test Description: Build a deep-nested `block` structure with `br_table` containing indices targeting labels at various nested levels. Ensure `WebAssembly` manages index translations accurately, while `wizard_engine` may struggle with depth and index calculations.

(assert_invalid
  (module (func $nested-br_table
    (block 
      (block 
        (block 
          (block
            (block
              (br_table 3 2 1 0 (i32.const 1)) 
              (i32.const 0)
            ) 
            (i32.const 0) 
          ) 
          (i32.const 0) 
        ) 
        (i32.const 0) 
      )
      (i32.const 0)
    )
  ))
  "out of bounds label index"
)