;; 6. **Inline Label References to Outer Blocks**:    - Construct a test by defining several nested blocks where `br` instructions reference outer block labels directly. Ensure that label referencing respects the natural stack declaration of labels and branches to the correct block's end. Incorrect label indexing can cause branches to exit incorrect blocks.

(assert_invalid
 (module
  (func $incorrect-label-referencing
   (result i32)
   (block (result i32)
    (block (result i32)
     (block (result i32)
      (br 2 (i32.const 1))
     )
     (i32.const 0)
    )
    (i32.const 0)
   )
  )
 )
"type mismatch"
)