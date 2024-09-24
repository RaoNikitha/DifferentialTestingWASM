;; 9. **Test Description:**    Write a module that includes `block` constructs and calls an imported function that uses a `br` instruction to erroneously attempt to jump to a non-existing outer block. Verify that the error is caught and propagated correctly across module boundaries.

(assert_invalid
 (module
  (import "" "externalFunc" (func))
  (func $invalid_br_instruction
   (block
    (block
     (call 0)
     (br 2)
    ) 
   )
   (i32.eqz)
   (drop)
  )
 )
 "unknown label"
)