;; 3. Nest an `if` instruction inside a block, and conditionally branch to a label outside the block without ensuring the stack has the correct type for the conditional block's result. This test targets the type enforcement for branches within nested control instructions.

(assert_invalid
  (module
    (func $test
      (block 
        (if (i32.const 1)
          (then (br 1))
        )
      )
    )
  )
  "type mismatch"
)