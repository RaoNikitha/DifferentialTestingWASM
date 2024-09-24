;; 8. Test a `br_if` instruction inside a `block` with multiple immediate next instructions when the condition evaluates true, ensuring that block finalization and stack unwinding handle branching properly.

(assert_invalid
  (module
    (func $br_if_block_unwind
      (block 
        (i32.add (i32.const 3) 
          (br_if 0 (i32.const 1) (i32.const 2))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)