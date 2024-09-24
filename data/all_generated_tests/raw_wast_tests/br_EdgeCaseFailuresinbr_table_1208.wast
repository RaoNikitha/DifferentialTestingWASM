;; 9. Test a `br_table` with operand stack manipulation where the branch index dynamically changes based on the stack operands. This emphasizes correct dynamic management of the operand stack across branches.

(assert_invalid
  (module
    (func $br-table-operand-stack (result i32)
      (block $outer (result i32)
        (block $inner
          (i32.const 1) ;; Push 1 onto the stack
          (br_table 0 1 (i32.const 3)) ;; br_table with dynamic index from stack
        )
      )
    )
  )
  "type mismatch"
)