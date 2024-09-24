;; ```plaintext 1. Provide a `br_table` instruction with a vector of labels where one of the target labels expects a different number of operands than the others. Specifically, make sure one branch has an arity of 2 and the others have an arity of 1. This would test if the arity mismatch is caught properly.

(assert_invalid
  (module
    (func
      (block
        (block (result i32)
          (block
            (br_table 0 1 2 (i32.const 0))
          )
        (i32.const 42))
      )
    )
  )
  "type mismatch"
)