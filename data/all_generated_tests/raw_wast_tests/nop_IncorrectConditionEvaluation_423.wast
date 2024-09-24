;; Implement nested conditionals where `nop` appears inside each branch. Check if `br_if` correctly evaluates the nested conditions and branches.

(assert_invalid
  (module
    (func (block
            (block
              (br_if 0 (i32.const 0))
              (block
                (nop)
                (br_if 1 (i32.const 1))
              )
            )
          )
    )
  )
  "type mismatch"
)