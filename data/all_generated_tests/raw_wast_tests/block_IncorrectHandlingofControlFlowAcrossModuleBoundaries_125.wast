;; 6. Implement a `block` that calls an imported function which performs a `br` instruction to an outer block label. Confirm that the control flow resumes correctly in the main module.

(assert_invalid
  (module 
    (import "env" "func" (func $importedFunc))
    (func (result i32)
      (i32.const 0)
      (block (result i32)
        (i32.const 1)
        (block (block (result i32) (call $importedFunc) (br 2)))
        (i32.const 2)
        (return)
      )
      i32.add
    )
  )
  "type mismatch"
)