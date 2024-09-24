;; 4. **Test Deep Nesting Without End**: Place `br` instructions deep within nested structures without ending blocks properly to examine if state mismanagement leads to an infinite loop.

(assert_invalid
  (module 
    (func $deep-nesting-without-end
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 2 (i32.const 1))
            (block (result i32)
              (br 3)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)