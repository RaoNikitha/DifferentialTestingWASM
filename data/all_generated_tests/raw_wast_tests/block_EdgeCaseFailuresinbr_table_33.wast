;; 4. Test Description: Construct a `block` with a `br_table` instruction where the default target is invalid or out of scope. Verify that `WebAssembly` catches the error and see if `wizard_engine` mishandles targeting defaults causing inconsistent outcomes.

(assert_invalid
  (module 
    (func $test-br_table-out-of-scope
      (block $outer
        (block $inner
          (br_table 0 1 2 (i32.const 0)) 
        )
      )
    )
  )
  "default index out of bounds"
)